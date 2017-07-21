#' @title Calculate overall cluster entropy
#'
#' @description Used to calcualte overall cluster entropy from a confusion matrix.
#'
#' @param conf_mat A confusion matrix from \code{\link[c2c]{get_conf_mat}} or otherwise (ideally a matrix, although data frames will probably work)
#'
#' @return A scaler, cluster entropy as defined in Manning (2008)
#'
#' @references Manning, C. D., Raghavan, P., & Schütze, H. (2008) Introduction to information retrieval (Vol. 1, No. 1). Cambridge: Cambridge university press.
#'
#' @export

overall_entropy <- function(conf_mat) {
  inner_sum <- apply(conf_mat, 1, function(x) {
    c_size <- sum(x)
    sum(x * ifelse(x != 0, log2(x/c_size), 0))
  })
  -sum(inner_sum)/(sum(conf_mat) * log2(ncol(conf_mat)))
}


#' @title Calculate overall cluster purity
#'
#' @description Used to calcualte overall cluster purity from a confusion matrix.
#'
#' @param conf_mat A confusion matrix from \code{\link[c2c]{get_conf_mat}} or otherwise (ideally a matrix, although data frames will probably work)
#'
#' @return A scaler, cluster purity as defined in Manning (2008)
#'
#' @references Manning, C. D., Raghavan, P., & Schütze, H. (2008) Introduction to information retrieval (Vol. 1, No. 1). Cambridge: Cambridge university press.
#'
#' @export

overall_purity <- function(conf_mat) {
  sum(apply(conf_mat, 1, max)) / sum(conf_mat)
}


#' @title Calculate overall percentage agreement
#'
#' @description Used to calcualte overall percentage agreement for a confusion matrix - the confusion matrix must have equal dimensions and the diagonal must represent 'matching' class pairs (percentage agreement does not make sense otherwise)
#'
#' @param conf_mat A confusion matrix from \code{\link[c2c]{get_conf_mat}} or otherwise (ideally a matrix, although data frames will probably work)
#'
#' @return A scaler, percentage agreement (sometime refered to as overall accuracy)
#'
#' @export

percentage_agreement <- function(conf_mat) {
  (sum(diag(conf_mat)) / sum(conf_mat))
}
