#' @title Make a vector of class labels into a hard binary matrix
#'
#' @description Used in \code{\link[c2c]{get_conf_mat}} but might be useful separately
#'
#' @param x Character or factor vector of class labels
#'
#' @return Binary matrix of class membership.
#'
#' @examples
#' my_labels <- rep(c("a","b","c","d"), 5)
#' labels_to_matrix(my_labels)
#'
#' @export

labels_to_matrix <- function(x) {
  x_df <- data.frame(labels = as.character(x))
  out_df <- as.data.frame(stats::model.matrix(~0+labels, data = x_df))
  names(out_df) <- gsub("labels", "", names(out_df))
  out_df
}

