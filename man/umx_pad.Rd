% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/misc_and_utility.r
\name{umx_pad}
\alias{umx_pad}
\title{Pad an Object with NAs}
\usage{
umx_pad(x, n)
}
\arguments{
\item{x}{An \R object (list, data.frame, matrix, atomic vector).}

\item{n}{The final length of each object.}
}
\value{
- padded object
}
\description{
This function pads an R object (list, data.frame, matrix, atomic vector)
with \code{NA}s. For matrices, lists and data.frames, this occurs by extending
each (column) vector in the object.
}
\examples{
umx_pad(1:3, 4)
umx_pad(1:3, 3)
}
\references{
- \url{https://github.com/kevinushey/Kmisc/tree/master/man}
}
\seealso{
Other Miscellaneous Utility Functions: \code{\link{install.OpenMx}},
  \code{\link{qm}}, \code{\link{umxBrownie}},
  \code{\link{umxFactor}}, \code{\link{umxVersion}},
  \code{\link{umx_array_shift}},
  \code{\link{umx_cell_is_on}},
  \code{\link{umx_cont_2_quantiles}},
  \code{\link{umx_find_object}},
  \code{\link{umx_graphviz_rank}}, \code{\link{umx_make}},
  \code{\link{umx_mat2dot}}, \code{\link{umx_msg}},
  \code{\link{umx_open_CRAN_page}},
  \code{\link{umx_pb_note}}, \code{\link{umx_print}},
  \code{\link{umx_scale}}, \code{\link{umx_score_scale}},
  \code{\link{umx}}
}
\concept{Miscellaneous Utility Functions}
