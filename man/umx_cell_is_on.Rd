% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/misc_and_utility.r
\name{umx_cell_is_on}
\alias{umx_cell_is_on}
\title{Return whether a cell is in a set location of a matrix}
\usage{
umx_cell_is_on(r, c, where = c("diag", "lower", "upper", "any", "left"),
  mat = NULL)
}
\arguments{
\item{r}{which row the cell is on.}

\item{c}{which column the cell is in.}

\item{where}{the location (any, diag, lower or upper or left).}

\item{mat}{(optionally) provide matrix to check dimensions against r and c.}
}
\value{
- \code{\link{mxModel}}
}
\description{
Helper to determine is a cell is in a set location of a matrix or not.
Left is useful for, e.g. twin means matrices.
}
\examples{
umx_cell_is_on(r = 3, c = 3, "lower")
umx_cell_is_on(r = 3, c = 3, "upper")
umx_cell_is_on(r = 3, c = 3, "diag")
umx_cell_is_on(r = 2, c = 3, "diag")
umx_cell_is_on(r = 3, c = 3, "any")
a_cp = umxMatrix("a_cp", "Lower", 3, 3, free = TRUE, values = 1:6)
umx_cell_is_on(r = 3, c = 3, "left", mat = a_cp)
\dontrun{
# test stopping
umx_cell_is_on(r=4,c = 3, "any", mat = a_cp)
}
}
\references{
- \url{https://github.com/tbates/umx}, \url{https://tbates.github.io}
}
\seealso{
- \code{\link{umxLabel}}

Other Miscellaneous Utility Functions: \code{\link{install.OpenMx}},
  \code{\link{qm}}, \code{\link{umxBrownie}},
  \code{\link{umxFactor}}, \code{\link{umxVersion}},
  \code{\link{umx_array_shift}},
  \code{\link{umx_cont_2_quantiles}},
  \code{\link{umx_find_object}},
  \code{\link{umx_graphviz_rank}}, \code{\link{umx_make}},
  \code{\link{umx_mat2dot}}, \code{\link{umx_msg}},
  \code{\link{umx_open_CRAN_page}}, \code{\link{umx_pad}},
  \code{\link{umx_pb_note}}, \code{\link{umx_print}},
  \code{\link{umx_scale}}, \code{\link{umx_score_scale}},
  \code{\link{umx}}
}
\concept{Miscellaneous Utility Functions}
