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

#' @export
vec_ptype2.scalar <- function(x, y, ..., x_arg = "x", y_arg = "y") {
  NextMethod()
}

#' @export
#' @method vec_ptype2.double scalar
vec_cast.double.scalar <- function(x, to, ...) {
  if (!is.numeric(unclass(x))) stop_incompatible_cast(x, to)
  vctrs:::shape_broadcast(unclass(x), to)
}

#' @export
#' @method vec_ptype2.double scalar
vec_ptype2.double.scalar <- function(x, y, ..., x_arg = "x", y_arg = "y") {
  asdf
  NextMethod()
}
