## --- edit R/hello.R to read: ---
## #' Say Hello
## #'
## #' @param name A character string: the name to greet.
## #' @return A greeting like "Hello, name!"
## #' @export
## hello <- function(name = "World") {
##   paste0("Hello, ", name, "!")
## }
## -------------------------------

#' Say Hello
#'
#' @param name A character string: the name to greet.
#' @return A greeting like "Hello, name!"
#' @export
hello <- function(name = "World") {
  paste0("Hello, ", name, "!")
}
