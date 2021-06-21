#' @noRd
Dict <- (function() {
  if (!exists("instance")) instance <- NULL
  function(obj = NULL) {
    if (!is.null(obj)) instance <<- obj
    return(instance)
  }
})()

#' @noRd
Tokenizer <- (function() {
  if (!exists("instance")) instance <- NULL
  function(obj = NULL) {
    if (!is.null(obj)) instance <<- obj
    return(instance)
  }
})()

#' @noRd
#' @export
#' @keywords internal
Param <- (function() {
  if (!exists("instance")) instance <- NULL
  function(obj = NULL) {
    if (!is.null(obj)) instance <<- obj
    return(instance)
  }
})()

#' @noRd
Parser <- (function() {
  if (!exists("instance")) instance <- NULL
  function(obj = NULL) {
    if (!is.null(obj)) instance <<- obj
    return(instance)
  }
})()

#' Save options
#' @noRd
.op <- NULL

#' @noRd
#' @param libname libname
#' @param pkgname pkgname
#' @keywords internal
.onLoad <- function(libname, pkgname) {
  ## Try to suppress warning that illegal reflective access from RJavaTools.
  .op <<- options(java.parameters = c(
    getOption("java.parameters"),
    "--illegal-access=permit"
  ))
  rJava::.jpackage(pkgname,
    morePaths = c(
      "inst/java/kintoki-0.2.0-SNAPSHOT.jar",
      "inst/java/sudachi-0.4.3.jar",
      "inst/java/javax.json-1.1.jar",
      "inst/java/jdartsclone-1.2.0.jar"
    ),
    lib.loc = libname
  )

  rebuild_dictionary(json_string(pkgname, libname))

  Param(rJava::.jnew("com.worksap.nlp.kintoki.cabocha.Param"))

  if (!is_dev_package(pkgname)) {
    Param()$loadConfig(system.file("cabocharc.properties", package = pkgname, lib.loc = libname))
    Param()$set(Param()$SUDACHI_DICT, system.file("dic", package = pkgname, lib.loc = libname))
    Param()$set(Param()$CHUNKER_MODEL, system.file("model/chunk.unidic.model", package = pkgname, lib.loc = libname))
    Param()$set(Param()$PARSER_MODEL, system.file("model/dep.unidic.model", package = pkgname, lib.loc = libname))
  } else {
    Param()$loadConfig(system.file("inst/cabocharc.properties", package = pkgname, lib.loc = libname))
    Param()$set(Param()$SUDACHI_DICT, system.file("inst/dic", package = pkgname, lib.loc = libname))
    Param()$set(Param()$CHUNKER_MODEL, system.file("inst/model/chunk.unidic.model", package = pkgname, lib.loc = libname))
    Param()$set(Param()$PARSER_MODEL, system.file("inst/model/dep.unidic.model", package = pkgname, lib.loc = libname))
  }
}

#' @noRd
#' @param libpath libpath
#' @keywords internal
.onUnload <- function(libpath) {
  options(.op)
}
