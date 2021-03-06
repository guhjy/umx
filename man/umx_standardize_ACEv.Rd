% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/umx_build_umxACEv.R
\name{umx_standardize_ACEv}
\alias{umx_standardize_ACEv}
\title{Standardize an ACE variance components model (ACEv)}
\usage{
umx_standardize_ACEv(model, ...)
}
\arguments{
\item{model}{An \code{\link{umxACEv}} model to standardize.}

\item{...}{Other parameters.}
}
\value{
- A standardized \code{\link{umxACEv}} model.
}
\description{
umx_standardize_ACE allows umx_standardize to standardize an ACE variance components model.
}
\examples{
require(umx)
data(twinData)
selDVs = c("bmi")
mzData <- twinData[twinData$zygosity \%in\% "MZFF",][1:80,] # 80 pairs for speed
dzData <- twinData[twinData$zygosity \%in\% "DZFF",][1:80,]
m1  = umxACEv(selDVs = selDVs, sep="", dzData = dzData, mzData = mzData)
std = umx_standardize(m1)
}
\references{
- \url{https://tbates.github.io}, \url{https://github.com/tbates/umx}
}
\seealso{
Other zAdvanced Helpers: \code{\link{umx_merge_CIs}},
  \code{\link{umx_standardize_ACEcov}},
  \code{\link{umx_standardize_ACE}},
  \code{\link{umx_standardize_CP}},
  \code{\link{umx_standardize_IP}},
  \code{\link{umx_standardize_Simplex}},
  \code{\link{umx_stash_CIs}}, \code{\link{umx}}
}
\concept{zAdvanced Helpers}
