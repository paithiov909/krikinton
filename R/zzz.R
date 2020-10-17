#' @noRd
#' @export
#' @keywords internal
param <- NULL

#' @noRd
#' @param libname libname
#' @param pkgname pkgname
#' @import rJava
#' @importFrom pkgload is_dev_package
#' @keywords internal
.onLoad <- function(libname, pkgname) {
  rJava::.jpackage(pkgname,
    morePaths = c(
      "inst/java/kintoki-0.2.0-SNAPSHOT.jar",
      "inst/java/sudachi-0.4.3.jar",
      "inst/java/javax.json-1.1.jar",
      "inst/java/jdartsclone-1.2.0.jar"
    ),
    lib.loc = libname
  )

  rJava::javaImport(packages = "com.worksap.nlp.kintoki.cabocha.Cabocha")
  rJava::javaImport(packages = "com.worksap.nlp.kintoki.cabocha.Param")

  param <<- rJava::.jnew("com.worksap.nlp.kintoki.cabocha.Param")

  if (!pkgload::is_dev_package(pkgname)) {
    param$loadConfig(system.file("cabocharc.properties", package = pkgname, lib.loc = libname))
    param$set(param$SUDACHI_DICT, system.file("dic", package = pkgname, lib.loc = libname))
    param$set(param$CHUNKER_MODEL, system.file("model/chunk.unidic.model", package = pkgname, lib.loc = libname))
    param$set(param$PARSER_MODEL, system.file("model/dep.unidic.model", package = pkgname, lib.loc = libname))
  } else {
    param$loadConfig(system.file("inst/cabocharc.properties", package = pkgname, lib.loc = libname))
    param$set(param$SUDACHI_DICT, system.file("inst/dic", package = pkgname, lib.loc = libname))
    param$set(param$CHUNKER_MODEL, system.file("inst/model/chunk.unidic.model", package = pkgname, lib.loc = libname))
    param$set(param$PARSER_MODEL, system.file("inst/model/dep.unidic.model", package = pkgname, lib.loc = libname))
  }
}
