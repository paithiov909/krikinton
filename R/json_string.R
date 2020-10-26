#' List Presentation of Sudachi's Setting
#' @export
sudachi_json <- list( ## TODO: escape strings
  path = NA_character_,
  systemDict = "system_core.dic",
  inputTextPlugin = list(
    list(class = "com.worksap.nlp.sudachi.DefaultInputTextPlugin"),
    list(class = "com.worksap.nlp.sudachi.ProlongedSoundMarkInputTextPlugin",
         prolongedSoundMarks = list("ー", "-", "⁓", "〜", "〰"),
         replacementSymbol = "ー")
  ),
  oovProviderPlugin = list(
    list(class = "com.worksap.nlp.sudachi.MeCabOovProviderPlugin"),
    list(class = "com.worksap.nlp.sudachi.SimpleOovProviderPlugin",
         oovPOS = list("補助記号", "一般", "*", "*", "*", "*" ),
         leftId = 5968L,
         rightid = 5968L,
         cost = 3857L)
  ),
  pathRewritePlugin = list(
    list(class = "com.worksap.nlp.sudachi.JoinNumericPlugin",
         joinKanjiNumeric = TRUE),
    list(class = "com.worksap.nlp.sudachi.JoinKatakanaOovPlugin",
         oovPOS = list("名詞", "普通名詞", "一般", "*", "*", "*" ),
         minLength = 3L)
  )
)

#' @noRd
#' @param pkgname pkgname
#' @param libname libname
#' @importFrom pkgload is_dev_package
#' @importFrom jsonlite toJSON
#' @keywords internal
json_string <- function(pkgname, libname) {
  dic_path <- ifelse(
    !pkgload::is_dev_package(pkgname),
    system.file("dic", package = pkgname, lib.loc = libname),
    system.file("inst/dic", package = pkgname, lib.loc = libname)
  )
  default_json <- sudachi_json
  default_json$path = dic_path
  return(jsonlite::toJSON(default_json, auto_unbox = TRUE, pretty = TRUE))
}
