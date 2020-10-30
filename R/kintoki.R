#' Rebuild Kintoki Parser
#'
#' @return returns a binding to the instance of
#' `com.worksap.nlp.kintoki.cabocha.Cabocha` invisibly
#'
#' @import rJava
#' @export
rebuild_parser <- function() {
  Parser(rJava::.jnew("com.worksap.nlp.kintoki.cabocha.Cabocha", Param()))
  return(invisible(Parser()))
}

#' Call Kintoki Parser
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
#' @importFrom tibble as_tibble
#' @export
kintoki <- function(chr) {
  if (!is.character(chr) || is.na(chr)) {
    message("Invalid characters provided. Chr must be a character vector, not NA_character_.")
    return(invisible(tibble::tibble()))
  } else {
    texts <- stringi::stri_enc_toutf8(chr)
    if (is.null(Parser())) rebuild_parser()

    results <- purrr::imap(texts, function(sent, idx) {
      if (!is.na(sent)) {
        tree <- rJava::J(Parser(), "parse", sent)

        chunk_size <- tree$getChunkSize()

        if (!rJava::is.jnull(chunk_size)) {
          df <- lapply(seq_len(chunk_size), function(i) {
            chunk <- tree$chunk(i - 1L)
            token_size <- chunk$getTokenSize()
            tokens <- lapply(seq_len(token_size), function(j) {
              token <- chunk$token(j - 1L)
              res <- list(
                Surface = token$getSurface(),
                Feature = token$getFeature()
              )
              res <- lapply(res, function(elem) {
                Encoding(elem) <- "UTF-8"
                return(elem)
              })
              res <- list(
                Sid = idx,
                Cid = i - 1L,
                Link = chunk$getLink(),
                Score = chunk$getScore(),
                Head = chunk$getHeadPos(),
                Func = chunk$getFuncPos(),
                Tid = j - 1L,
                res
              )
              return(as.data.frame(res))
            })
            tokens <- purrr::map_dfr(tokens, ~
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
            return(tibble::as_tibble(tokens))
          })
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
