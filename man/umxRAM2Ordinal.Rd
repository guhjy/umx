% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/build_run_modify.r
\name{umxRAM2Ordinal}
\alias{umxRAM2Ordinal}
\title{umxRAM2Ordinal}
\usage{
umxRAM2Ordinal(model, verbose = TRUE, thresholds = c("deviationBased",
  "ignore"), name = NULL, showEstimates = TRUE, refModels = NULL)
}
\arguments{
\item{model}{An RAM model to add thresholds too.}

\item{verbose}{Tell the user what was added and why (Default = TRUE).}

\item{thresholds}{How to implement thresholds: c("deviationBased", "direct", "ignore", "left_censored").}

\item{name}{= A new name for the modified model (NULL means leave it as it).}

\item{showEstimates}{= Whether to show estimates in the summary (if autoRun) TRUE.}

\item{refModels}{pass in reference models if available. Use FALSE to suppress computing these if not provided.}
}
\value{
- \code{\link{mxModel}}
}
\description{
umxRAM2Ordinal: Convert a RAM model whose data contain ordinal variables to a threshold-based model
}
\examples{
\dontrun{
data(twinData)
# Cut to form category of 20\% obese subjects
obesityLevels   = c('normal', 'obese')
cutPoints       = quantile(twinData[, "bmi1"], probs = .2, na.rm = TRUE)
twinData$obese1 = cut(twinData$bmi1, breaks = c(-Inf, cutPoints, Inf), labels = obesityLevels) 
twinData$obese2 = cut(twinData$bmi2, breaks = c(-Inf, cutPoints, Inf), labels = obesityLevels) 
ordDVs = c("obese1", "obese2")
twinData[, ordDVs] = umxFactor(twinData[, ordDVs])
mzData = twinData[twinData$zygosity \%in\% "MZFF",]
m1 = umxRAM("tim", data = mzData, umxPath("bmi1", with = "bmi2"), umxPath(v.m.= c("bmi1", "bmi2")))
m1 = umxRAM("tim", data = mzData, umxPath("obese1", with = "obese2"), umxPath(v.m.= c("obese1", "obese2")))
}
}
\seealso{
- \code{\link{umxRAM}}

Other Advanced Model Building Functions: \code{\link{umxJiggle}},
  \code{\link{umxLabel}}, \code{\link{umxLatent}},
  \code{\link{umxThresholdMatrix}},
  \code{\link{umxValues}}, \code{\link{umx_add_variances}},
  \code{\link{umx_fix_first_loadings}},
  \code{\link{umx_fix_latents}},
  \code{\link{umx_get_bracket_addresses}},
  \code{\link{umx_string_to_algebra}}, \code{\link{umx}}
}
\concept{Advanced Model Building Functions}
