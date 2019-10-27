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

un_scalar <- function(x) {
  class(x) <- setdiff(class(x), "scalar")
  x
}

#' @export
vec_ptype2.scalar <- function(x, y, ..., x_arg = "x", y_arg = "y") {
  vec_ptype2(y, un_scalar(x), ..., x_arg = y_arg, y_arg = x_arg)
}

#' @export
#' @method vec_ptype2.double scalar
vec_cast.double.scalar <- function(x, to, ...) {
  if (!is.numeric(unclass(x))) stop_incompatible_cast(x, to)
  vctrs:::shape_broadcast(unclass(x), to)
}

#' @export
#' @method vec_ptype2.integer scalar
vec_ptype2.integer.scalar <- function(x, y, ..., x_arg = "x", y_arg = "y") {
  y <- un_scalar(y)
  if (!is.numeric(y)) stop_incompatible_type(x, y, x_arg, y_arg)
  if (is.integer(y)) integer() else numeric()
}

#' @export
#' @method vec_ptype2.double scalar
vec_ptype2.double.scalar <- function(x, y, ..., x_arg = "x", y_arg = "y") {
  y <- un_scalar(y)
  if (!is.numeric(y)) stop_incompatible_type(x, y, x_arg, y_arg)
  numeric()
}

#' @export
vec_proxy.scalar <- function(x, ...) {
  un_scalar(x)
}

#' @export
vec_restore.scalar <- function(x, ...) {
  if (vec_size(x) == 1) scalar(x) else un_scalar(x)
}
