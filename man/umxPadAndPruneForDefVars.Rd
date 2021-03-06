% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/misc_and_utility.r
\name{umxPadAndPruneForDefVars}
\alias{umxPadAndPruneForDefVars}
\title{umxPadAndPruneForDefVars}
\usage{
umxPadAndPruneForDefVars(df, varNames, defNames, suffixes,
  highDefValue = 99, rm = c("drop_missing_def", "pad_with_mean"))
}
\arguments{
\item{df}{the dataframe to process}

\item{varNames}{list of names of the variables being analysed}

\item{defNames}{list of covariates}

\item{suffixes}{that map names on columns in df (i.e., c("T1", "T2"))}

\item{highDefValue}{What to replace missing definition variables (covariates) with. Default = 99}

\item{rm}{= how to handle missing values in the varNames. Default is "drop_missing_def", "pad_with_mean")}
}
\value{
- dataframe
}
\description{
Replaces NAs in definition slots with the mean for that variable ONLY where all data are missing for that twin
}
\examples{
\dontrun{
data(twinData)
sum(is.na(twinData$ht1))
df = umxPadAndPruneForDefVars(twinData, varNames = "ht", defNames = "wt", c("1", "2"))
}
}
\references{
- \url{https://tbates.github.io}, \url{https://github.com/tbates/umx}
}
\seealso{
Other Data Functions: \code{\link{umxCovData}},
  \code{\link{umxHetCor}}, \code{\link{umx_as_numeric}},
  \code{\link{umx_cov2raw}}, \code{\link{umx_lower2full}},
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
}
\concept{Data Functions}
