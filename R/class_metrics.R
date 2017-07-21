#' @title Calculate cluster entropy per class
#'
#' @description Used to calcualte cluster entropy from a confusion matrix, for each class (i.e. each row and column of the confusion matrix).
#'
#' @param conf_mat A confusion matrix from \code{\link[c2c]{get_conf_mat}} or otherwise (ideally a matrix, although data frames will probably work)
#'
#' @details Metrics per class are useful when you are comparing two classifications with different numbers of classes, when an overall measure might not be useful or sensible. Entropy as defined in Manning (2008).
#'
#' @return A data frame with two columns, the first corresponding to the confusion matrix rows, the second corresponding to the confusion matrix columns.
#'
#' @references Manning, C. D., Raghavan, P., & Schütze, H. (2008) Introduction to information retrieval (Vol. 1, No. 1). Cambridge: Cambridge university press.
#'
#' @export

class_entropy <- function(conf_mat) {
  mle_prob <- function(x) {
    prob <- x / sum(x)
    sum(abs(prob * ifelse(prob != 0, log2(prob), 0)))
  }
  list(row_entropy = apply(conf_mat, 1, mle_prob),
       col_entropy = apply(conf_mat, 2, mle_prob))
}


#' @title Calculate cluster purity per class
#'
#' @description Used to calcualte cluster purity from a confusion matrix, for each class (i.e. each row and column of the confusion matrix).
#'
#' @param conf_mat A confusion matrix from \code{\link[c2c]{get_conf_mat}} or otherwise (ideally a matrix, although data frames will probably work)
#'
#' @details Metrics per class are useful when you are comparing two classifications with different numbers of classes, when an overall measure might not be useful or sensible. Purity as defined in Manning (2008).
#'
#' @return A data frame with two columns, the first corresponding to the confusion matrix rows, the second corresponding to the confusion matrix columns.
#'
#' @references Manning, C. D., Raghavan, P., & Schütze, H. (2008) Introduction to information retrieval (Vol. 1, No. 1). Cambridge: Cambridge university press.
#'
#' @export

class_purity <- function(conf_mat) {
  list(row_purity = apply(conf_mat, 1, max) / apply(conf_mat, 1, sum),
       col_purity = apply(conf_mat, 2, max) / apply(conf_mat, 2, sum))
}
