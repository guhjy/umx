% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/xmu.r
\name{xmu_twin_check}
\alias{xmu_twin_check}
\title{Check basic aspects of input for twin models.}
\usage{
xmu_twin_check(selDVs, dzData = dzData, mzData = mzData, sep = NULL,
  enforceSep = TRUE, nSib = 2, numObsMZ = NULL, numObsDZ = NULL,
  optimizer = NULL)
}
\arguments{
\item{selDVs}{Variables used in the data.}

\item{dzData}{The DZ twin data.}

\item{mzData}{The MZ twin data.}

\item{sep}{Separator between base-name and numeric suffix when creating variable names, e.g. "_T"}

\item{enforceSep}{Whether to require sep to be set, or just warn if it is not (Default = TRUE: enforce).}

\item{nSib}{How many people per family? (Default = 2).}

\item{numObsMZ}{set if data are not raw.}

\item{numObsDZ}{set if data are not raw.}

\item{optimizer}{Set by name (if you want to change it).}
}
\value{
-
}
\description{
Check that DVs are in the data, that the data have rows, set the optimizer if requested.
}
\examples{
library(umx)
data(twinData)
mzData = subset(twinData, zygosity == "MZFF")
dzData = subset(twinData, zygosity == "MZFF")
xmu_twin_check(selDVs = c("wt", "ht"), dzData = dzData, mzData = mzData, 
	sep = "", enforceSep = TRUE)
xmu_twin_check(selDVs = c("wt", "ht"), dzData = dzData, mzData = mzData, 
	sep = "", enforceSep = FALSE)
xmu_twin_check(selDVs = c("wt", "ht"), dzData = dzData, mzData = mzData, 
	sep = "", enforceSep = TRUE, nSib = 2, optimizer = NULL)
\dontrun{
# TODO xmu_twin_check: move to a test file:
# 1. stop on no rows
xmu_twin_check("Generativity", twinData[NULL,], twinData[NULL,], sep="_T")
# Error in xmu_twin_check("Generativity", twinData[NULL, ], twinData[NULL,  : 
#   Your DZ dataset has no rows!

# 2. Stop on a NULL sep  = NULL IFF enforceSep = TRUE
xmu_twin_check(selDVs = c("wt", "ht"), dzData = dzData, mzData = mzData, enforceSep = TRUE)
# 3. stop on a factor with sep = NULL
}
}
\references{
- \url{https://github.com/tbates/umx}, \url{https://tbates.github.io}
}
\seealso{
Other Twin Modeling Functions: \code{\link{umxACE_cov_fixed}},
  \code{\link{umxACEcov}}, \code{\link{umxACEnew}},
  \code{\link{umxACEv}}, \code{\link{umxACE}},
  \code{\link{umxCPold}}, \code{\link{umxCP}},
  \code{\link{umxGxE_window}}, \code{\link{umxGxEbiv}},
  \code{\link{umxGxE}}, \code{\link{umxIPnew}},
  \code{\link{umxIP}}, \code{\link{umxSexLim}},
  \code{\link{umxSimplex}}, \code{\link{umxSummaryACEcov}},
  \code{\link{umxSummaryACEv}},
  \code{\link{umxSummaryACE}}, \code{\link{umxSummaryCP}},
  \code{\link{umxSummaryGxEbiv}},
  \code{\link{umxSummaryGxE}}, \code{\link{umxSummaryIP}},
  \code{\link{umxSummarySexLim}},
  \code{\link{umxSummarySimplex}}, \code{\link{umx}}

Other Check or test: \code{\link{umx_check_names}},
  \code{\link{umx_is_class}}, \code{\link{umx_is_numeric}},
  \code{\link{umx}}
}
\concept{Check or test}
\concept{Twin Modeling Functions}
