#' List Presentation of Sudachi's Setting
#' @export
sudachi_json <- function() {
  list(
    path = NA_character_,
    systemDict = "system_core.dic",
    inputTextPlugin = list(
      list(class = "com.worksap.nlp.sudachi.DefaultInputTextPlugin"),
      list(
        class = "com.worksap.nlp.sudachi.ProlongedSoundMarkInputTextPlugin",
        prolongedSoundMarks = list(enc2utf8("\u30fc"), "-", enc2utf8("\u301c"), enc2utf8("\u3030")),
        replacementSymbol = enc2utf8("\u30fc")
      )
    ),
    oovProviderPlugin = list(
      list(class = "com.worksap.nlp.sudachi.MeCabOovProviderPlugin"),
      list(
        class = "com.worksap.nlp.sudachi.SimpleOovProviderPlugin",
        oovPOS = list(enc2utf8("\u88dc\u52a9\u8a18\u53f7"), enc2utf8("\u4e00\u822c"), "*", "*", "*", "*"),
        leftId = 5968L,
        rightid = 5968L,
        cost = 3857L
      )
    ),
    pathRewritePlugin = list(
      list(
        class = "com.worksap.nlp.sudachi.JoinNumericPlugin",
        joinKanjiNumeric = TRUE
      ),
      list(
        class = "com.worksap.nlp.sudachi.JoinKatakanaOovPlugin",
        oovPOS = list(enc2utf8("\u540d\u8a5e"), enc2utf8("\u666e\u901a\u540d\u8a5e"), enc2utf8("\u4e00\u822c"), "*", "*", "*"),
        minLength = 3L
      )
    )
  )
}

#' @noRd
#' @param pkgname pkgname
#' @param libname libname
#' @keywords internal
json_string <- function(pkgname, libname) {
  dic_path <- ifelse(
    !is_dev_package(pkgname),
    system.file("dic", package = pkgname, lib.loc = libname),
    system.file("inst/dic", package = pkgname, lib.loc = libname)
  )
  default_json <- sudachi_json()
  default_json$path <- dic_path
  return(toJSON(default_json, auto_unbox = TRUE, pretty = TRUE))
}
