#' @export
scalar <- function(x) {
  stopifnot(vec_size(x) == 1)
  class(x) <- c("scalar", class(x))
  x
}

#' @export
is_scalar <- function(x) {
  inherits(x, "scalar")
}
