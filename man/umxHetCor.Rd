% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/misc_and_utility.r
\name{umxHetCor}
\alias{umxHetCor}
\title{Create a matrix of correlations for variables of diverse types (binary, ordinal, continuous)}
\usage{
umxHetCor(data, ML = FALSE, use = c("pairwise.complete.obs",
  "complete.obs"), treatAllAsFactor = FALSE, verbose = FALSE,
  return = c("correlations", "hetcor object"), std.err = FALSE)
}
\arguments{
\item{data}{A \code{\link{data.frame}} of columns for which to compute heterochoric correlations. OR an existing covariance matrix.}

\item{ML}{Whether to use Maximum likelihood computation of correlations (default = FALSE)}

\item{use}{How to handle missing data: Default= "pairwise.complete.obs". Alternative ="complete.obs".}

\item{treatAllAsFactor}{Whether to treat all columns as factors, whether they are or not (Default = FALSE)}

\item{verbose}{How much to tell the user about what was done.}

\item{return}{Return just the correlations (default) or the hetcor object (contains, method, SEs etc.)}

\item{std.err}{Compute the SEs? (default = FALSE)}
}
\value{
- A matrix of correlations
}
\description{
umxHetCor is a helper to 
1. return just the correlations from John Fox's polycor::hetcor function
2. If you give it a covariance matrix, return the nearest positive-definite correlation matrix.
}
\examples{
umxHetCor(mtcars[,c("mpg", "am")])
umxHetCor(mtcars[,c("mpg", "am")], treatAllAsFactor = TRUE, verbose = TRUE)
}
\references{
-
}
\seealso{
Other Data Functions: \code{\link{umxCovData}},
  \code{\link{umxPadAndPruneForDefVars}},
  \code{\link{umx_as_numeric}}, \code{\link{umx_cov2raw}},
  \code{\link{umx_lower2full}},
  \code{\link{umx_make_MR_data}},
  \code{\link{umx_make_TwinData}},
  \code{\link{umx_make_bin_cont_pair_data}},
  \code{\link{umx_make_fake_data}},
  \code{\link{umx_polychoric}},
  \code{\link{umx_polypairwise}},
  \code{\link{umx_polytriowise}},
  \code{\link{umx_read_lower}}, \code{\link{umx_rename}},
  \code{\link{umx_reorder}}, \code{\link{umx_stack}},
  \code{\link{umx_swap_a_block}}, \code{\link{umx}}

Other Miscellaneous Stats Helpers: \code{\link{reliability}},
  \code{\link{umxCov2cor}}, \code{\link{umx_apply}},
  \code{\link{umx_cor}}, \code{\link{umx_fun_mean_sd}},
  \code{\link{umx_means}}, \code{\link{umx_r_test}},
  \code{\link{umx_round}}, \code{\link{umx_var}},
  \code{\link{umx}}
}
\concept{Data Functions}
\concept{Miscellaneous Stats Helpers}
