
# hidden utility functions ------------------------------------------------

na_to_zero <- function(x) {
  x[is.na(x)] <- 0
  as.matrix(x)
}

get_hard_cols <- function(x) {
  if (all(x==0)) {return(x)}
  if (sum(x==max(x)) > 1) {
    xx <- rep(0, length(x))
    xx[which(x==max(x))[1]] <- 1 # choose first one to break tie ####--->>> change to random
    return(xx)
  } else {
    return(ifelse(x==max(x),1,0))
  }
}
