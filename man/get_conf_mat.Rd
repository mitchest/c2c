% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_conf_mat.R
\name{get_conf_mat}
\alias{get_conf_mat}
\title{Generate a confusion matrix from two classifications/clustering solutions.}
\usage{
get_conf_mat(A, B, make.A.hard = F, make.B.hard = F)
}
\arguments{
\item{A}{A matrix or data.frame (or something that can be coerced to a matrix) of class membership or a vector of class labels (character or factor).}

\item{B}{A matrix or data.frame (or something that can be coerced to a matrix) or class membership or a vector of class labels (character or factor).}

\item{make.A.hard}{logical (defaults to FALSE). If TRUE, and if A= is a matrix of soft membership, it will be degraded to a hard binary matrix, taking the highest value, breaking ties at random}

\item{make.B.hard}{logical (defaults to FALSE). If TRUE, and if B= is a matrix of soft membership, it will be degraded to a hard binary matrix, taking the highest value, breaking ties at random}
}
\value{
A confusion matrix
}
\description{
\code{get_conf_mat} takes two classifications or clustering solutions and creates a confusion matrix representing the number of shared sites between them.
}
\details{
Takes inputs A and B (converting labels to matrices if required) and combines them via (\eqn{A^TB}). Soft classifications will necessarily be matrices. Hard classifications can be given as a binary matrix of membership or a vector of labels. For matrix inputs, rows should represent individual sites, observations, cases etc., and columns should represent classes. For class label inputs, the vector should be ordered similarly by site, observation, case etc; they will be converted to a binary matrix (see \code{\link[c2c]{labels_to_matrix}}). Classes from matrix A are represented by rows of the output, and classes from matrix B are represented by the columns. Class names inherited from \code{names()} or \code{colnames()} - if at least one of the inputs has names, interpretation will be much easier. Ties in membership probability are broken at random - if you don't want this to happen, suggest you break the tie manually before proceeding.
}
\examples{
# meaningless data, but you get the idea

# compare two soft classifications
my_soft_mat1 <- matrix(runif(50,0,1), nrow = 10, ncol = 5)
my_soft_mat2 <- matrix(runif(30,0,1), nrow = 10, ncol = 3)
# make the confusion matrix and calculate stats
conf_mat <- get_conf_mat(my_soft_mat1, my_soft_mat2)
conf_mat; calculate_clustering_metrics(conf_mat)

# compare a soft classification to a vector of hard labels
my_labels <- rep(c("a","b","c"), length.out = 10)
# utilising labels_to_matrix(my_labels)
conf_mat <- get_conf_mat(my_soft_mat1, my_labels)
conf_mat; calculate_clustering_metrics(conf_mat)

# make one of the soft matrices hard
# utilising get_hard(my_soft_mat2)
conf_mat <- get_conf_mat(my_soft_mat1, my_soft_mat2, make.B.hard = TRUE)
conf_mat; calculate_clustering_metrics(conf_mat)

# two classifications with same number of classes, enables percentage agreement
conf_mat <- get_conf_mat(my_soft_mat1, my_soft_mat1)
conf_mat; calculate_clustering_metrics(conf_mat)

}
\references{
Lyons, Foster and Keith (2017). Simultaneous vegetation classification and mapping at large spatial scales. \emph{Journal of Biogeography}.
}
\seealso{
\code{\link[c2c]{calculate_clustering_metrics}}, \code{\link[c2c]{labels_to_matrix}}, \code{\link[c2c]{get_hard}}
}
\author{
Mitchell Lyons
}
\keyword{confusion}
\keyword{matrix}
