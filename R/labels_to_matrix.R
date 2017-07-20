#' @title Make a vector of class labels into a hard binary matrix
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
  x_df <- data.frame(labels = x)
  out_df <- as.data.frame(model.matrix(~0+labels, data = x_df))
  names(out_df) <- gsub("labels", "", names(out_df))
  out_df
}

