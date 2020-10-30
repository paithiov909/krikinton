#' Rebuild Dictionary
#'
#' @param json_string character scalar. valid json string
#' @return returns a binding to the instance of
#' `com.worksap.nlp.sudachi.JapaneseDictionary` invisibly
#'
#' @import rJava
#' @export
rebuild_dictionary <- function(json_string) {
  Dict(rJava::.jnew("com.worksap.nlp.sudachi.JapaneseDictionary", json_string))
  return(invisible(Dict()))
}

#' Rebuild Sudachi Tokenizer
#'
#' @return returns a binding to the instance of
#' `com.worksap.nlp.sudachi.JapaneseTokenizer` invisibly
#'
#' @import rJava
#' @export
rebuild_tokenizer <- function() {
  Tokenizer(rJava::J(Dict(), "create"))
  return(invisible(Tokenizer()))
}

#' Call Sudachi Tagger
#'
#' @param chr character vector
#' @return tibble
#'
#' @import rJava
#' @importFrom stringi stri_enc_toutf8
#' @importFrom tidyr separate
#' @importFrom purrr imap
#' @importFrom purrr map_dfr
#' @importFrom purrr discard
#' @importFrom purrr is_empty
#' @importFrom tibble tibble
#' @export
sudachi <- function(chr) {
  if (!is.character(chr) || is.na(chr)) {
    message("Invalid characters provided. Chr must be a character vector, not NA_character_.")
    return(invisible(tibble::tibble()))
  } else {
    texts <- stringi::stri_enc_toutf8(chr)
    if (is.null(Tokenizer())) rebuild_tokenizer()

    results <- purrr::imap(texts, function(sent, idx) {
      if (!is.na(sent)) {
        morphemes <- Tokenizer()$tokenize(sent)
        morph_size <- morphemes$size()

        if (!rJava::is.jnull(morph_size)) {
          df <- lapply(seq_len(morph_size), function(i) {
            morpheme <- morphemes$get(i - 1L)
            features <- morpheme$partOfSpeech()
            features <- sapply(seq_len(features$size()), function(itr) {
              return(features$get(itr - 1L))
            }, simplify = TRUE)
            res <- list(
              Surface = morpheme$surface(),
              Reading = morpheme$readingForm(),
              Normalized = morpheme$normalizedForm(),
              Original = morpheme$dictionaryForm(),
              Feature = paste(features, collapse = ",")
            )
            res <- lapply(res, function(elem) {
              Encoding(elem) <- "UTF-8"
              return(elem)
            })
            res <- list(
              Sid = idx,
              res,
              isOOV = morpheme$isOOV()
            )
            return(as.data.frame(res))
          })
          df <- purrr::map_dfr(df, ~
          tidyr::separate(
            .,
            col = "Feature",
            into = c(
              "POS1",
              "POS2",
              "POS3",
              "POS4",
              "X5StageUse1",
              "X5StageUse2"
            ),
            sep = ","
          ))
          return(purrr::map_dfr(df, ~.))
        } else {
          return(tibble::tibble())
        }
      } else {
        return(tibble::tibble())
      }
    })

    return(purrr::map_dfr(
      purrr::discard(results, ~ purrr::is_empty(.)),
      ~.
    ))
  }
}
