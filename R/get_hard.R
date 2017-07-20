#' @title Decompose soft (fuzzy, probabalistic) membership to hard binary matrix
#'
#' @param x A matrix or data frame (or something coercible to a matrix) containing memberships - rows are sites (observations, cases etc.) columns are classes
#'
#' @return Binary matrix of class membership. Class names inherited from \code{names()} or \code{colnames()}.
#'
#' @examples
#' my_mat <- matrix(runif(20,0,1), nrow = 4)
#' get_hard(my_mat)
#'
#' @export

get_hard <- function(x) {
  x <- as.matrix(x)
  if("character" %in% apply(x, 2, class)) {stop("Input contained characters - if supplying a matrix (or data.frame or similar) all columns should be numeric or integer")}
  t(apply(X = na_to_zero(x), MARGIN = 1, FUN = get_hard_cols))
}

