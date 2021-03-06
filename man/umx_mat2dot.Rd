% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/misc_and_utility.r
\name{umx_mat2dot}
\alias{umx_mat2dot}
\title{Return dot code for paths in a matrix}
\usage{
umx_mat2dot(x, cells = c("any", "diag", "lower", "upper", "left"),
  from = "rows", fromLabel = NULL, toLabel = NULL, selDVs = NULL,
  showFixed = FALSE, arrows = c("forward", "both", "back"),
  type = NULL, digits = 2, p = list(str = "", latents = c(),
  manifests = c()))
}
\arguments{
\item{x}{a \code{\link{umxMatrix}} to make paths from.}

\item{cells}{which cells to process: "any" (default), "diag", "lower", "upper". "left" is the left half (e.g. in a twin means matrix)}

\item{from}{one of "rows", "columns" or a name}

\item{fromLabel}{= NULL}

\item{toLabel}{= NULL}

\item{selDVs}{if not null, row is used to index into this to set target name}

\item{showFixed}{= FALSE}

\item{arrows}{"forward" "both" or "back"}

\item{type}{one of "latent" or "manifest" (default NULL, don't accumulate new names using "from" list)}

\item{digits}{rounding values (default = 2).}

\item{p}{input to build on. list(str = "", latents = c(), manifests = c())}
}
\value{
- list(str = "", latents = c(), manifests = c())
}
\description{
Return dot code for paths in a matrix is a function which 
Walk rows and cols of matrix. At each free cell, 
Create a string like:
	ai1 -> var1 [label=".35"]
A latent (and correlations among latents)
	* these go from a_cp n=row TO common n= row
	* or for off diag, from a_cp n=col TO a_cp n= row
}
\examples{
# Make a lower 3*3 value= 1:6 (1,4,6 on the diag)
a_cp = umxMatrix("a_cp", "Lower", 3, 3, free = TRUE, values = 1:6)
out = umx_mat2dot(a_cp, cells = "lower", from = "rows", arrows = "both")
cat(out$str)
out = umx_mat2dot(a_cp, cells = "lower", from = "cols", arrows = "both")
cat(out$str)
# First call also inits the plot struct
out = umx_mat2dot(a_cp, from = "rows", cells = "lower", arrows = "both", type = "latent")
out = umx_mat2dot(a_cp, from = "rows", cells = "diag" , toLabel= "common", type = "latent", p = out)
cat(out$str)

}
\seealso{
- \code{\link{plot}}

Other Miscellaneous Utility Functions: \code{\link{install.OpenMx}},
  \code{\link{qm}}, \code{\link{umxBrownie}},
  \code{\link{umxFactor}}, \code{\link{umxVersion}},
  \code{\link{umx_array_shift}},
  \code{\link{umx_cell_is_on}},
  \code{\link{umx_cont_2_quantiles}},
  \code{\link{umx_find_object}},
  \code{\link{umx_graphviz_rank}}, \code{\link{umx_make}},
  \code{\link{umx_msg}}, \code{\link{umx_open_CRAN_page}},
  \code{\link{umx_pad}}, \code{\link{umx_pb_note}},
  \code{\link{umx_print}}, \code{\link{umx_scale}},
  \code{\link{umx_score_scale}}, \code{\link{umx}}
}
\concept{Miscellaneous Utility Functions}
