% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/misc_and_utility.r
\name{umx_graphviz_rank}
\alias{umx_graphviz_rank}
\title{Helper to make a graphviz rank string}
\usage{
umx_graphviz_rank(vars, pattern, rank)
}
\arguments{
\item{vars}{a list of strings}

\item{pattern}{regular expression to filter vars}

\item{rank}{"same", max, min}
}
\value{
string
}
\description{
Helper to make a graphviz rank string is a function which
}
\examples{
umx_graphviz_rank(c("as1"), "^[ace]s[0-9]+$", "same")
}
\seealso{
- \code{\link{umxLabel}}

Other Miscellaneous Utility Functions: \code{\link{install.OpenMx}},
  \code{\link{qm}}, \code{\link{umxBrownie}},
  \code{\link{umxFactor}}, \code{\link{umxVersion}},
  \code{\link{umx_array_shift}},
  \code{\link{umx_cell_is_on}},
  \code{\link{umx_cont_2_quantiles}},
  \code{\link{umx_find_object}}, \code{\link{umx_make}},
  \code{\link{umx_mat2dot}}, \code{\link{umx_msg}},
  \code{\link{umx_open_CRAN_page}}, \code{\link{umx_pad}},
  \code{\link{umx_pb_note}}, \code{\link{umx_print}},
  \code{\link{umx_scale}}, \code{\link{umx_score_scale}},
  \code{\link{umx}}
}
\concept{Miscellaneous Utility Functions}
