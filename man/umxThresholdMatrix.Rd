% Generated by roxygen2 (4.0.2): do not edit by hand
\name{umxThresholdMatrix}
\alias{umxThresholdMatrix}
\title{umxThresholdMatrix}
\usage{
umxThresholdMatrix(df, suffixes = NA, threshMatName = "threshMat",
  method = c("auto", "Mehta", "allFree"), l_u_bound = c(NA, NA),
  deviationBased = FALSE, droplevels = FALSE, verbose = FALSE)
}
\arguments{
\item{df}{the data being modelled (to allow access to the factor levels and quantiles within these for each variable)}

\item{suffixes}{e.g. c("T1", "T2") - Use for data with repeated observations in a row (i.e., twin data) (defaults to NA)}

\item{threshMatName}{name of the matrix which is returned. Defaults to "threshMat" - best not to change it.}

\item{method}{How to set the thresholds: auto (the default), Mehta, which fixes the first two (auto chooses this for ordinal) or "allFree" (auto chooses this for binary)}

\item{l_u_bound}{c(NA, NA) by default, you can use this to bound the thresholds. Careful you don't set bounds too close if you do.}

\item{deviationBased}{Whether to build a helper matrix to keep the thresholds in order (defaults to = FALSE)}

\item{droplevels}{Whether to drop levels with no observed data (defaults to FALSE)}

\item{verbose}{(defaults to FALSE))}
}
\value{
- thresholds matrix
}
\description{
High-level helper for ordinal modeling. Creates, labels, and sets smart-starts for this complex matrix. Big time saver!
}
\details{
When modeling ordinal data (sex, low-med-hi,
depressed/normal, not at all, rarely, often, always), a useful conceptual strategy to handle expectations
is to build a standard-normal model (i.e., a latent model with zero-means, and unit (1.0) variances),
and then to threshold this normal distribution to generate the observed data. Thus an observation of "depressed"
is modeled as a high score on the latent normally distributed trait, with thresholds set so that only scores above
this threshold (1-minus the number of categories).
}
\examples{
x = data.frame(ordered(rbinom(100,1,.5))); names(x)<-c("x")
umxThresholdMatrix(x)

require(OpenMx)
data(twinData)
twinData$zyg = factor(twinData$zyg, levels = 1:5, labels = c("MZFF", "MZMM", "DZFF", "DZMM", "DZOS"))
# ==================
# = Binary example =
# ==================
# Cut to form category of 80 \% obese subjects
cutPoints <- quantile(twinData[, "bmi1"], probs = .2, na.rm = TRUE)
obesityLevels = c('normal', 'obese')
twinData$obese1 <- cut(twinData$bmi1, breaks = c(-Inf, cutPoints, Inf), labels = obesityLevels)
twinData$obese2 <- cut(twinData$bmi2, breaks = c(-Inf, cutPoints, Inf), labels = obesityLevels)
# Step 2: Make the ordinal variables into mxFactors (ensures ordered= TRUE + requires user to confirm levels)
selDVs = c("obese1", "obese2")
twinData[, selDVs] <- mxFactor(twinData[, selDVs], levels = obesityLevels)
mzData <- subset(twinData, zyg == "MZFF", selDVs)
str(mzData)
umxThresholdMatrix(mzData, suffixes = 1:2)
umxThresholdMatrix(mzData, suffixes = 1:2, verbose = FALSE) # supress informative messages

# ======================================
# = Ordinal (n categories > 2) example =
# ======================================
# Cut to form three categories of weight
cutPoints <- quantile(twinData[, "bmi1"], probs = c(.4, .7), na.rm = TRUE)
obesityLevels = c('normal', 'overweight', 'obese')
twinData$obeseTri1 <- cut(twinData$bmi1, breaks = c(-Inf, cutPoints, Inf), labels = obesityLevels)
twinData$obeseTri2 <- cut(twinData$bmi2, breaks = c(-Inf, cutPoints, Inf), labels = obesityLevels)
selDVs = c("obeseTri1", "obeseTri2")
twinData[, selDVs] <- mxFactor(twinData[, selDVs], levels = obesityLevels)
mzData <- subset(twinData, zyg == "MZFF", selDVs)
str(mzData)
umxThresholdMatrix(mzData, suffixes = 1:2)
umxThresholdMatrix(mzData, suffixes = 1:2, verbose = FALSE)

# ========================================================
# = Mix of all three kinds example (and a 4-level trait) =
# ========================================================

cutPoints <- quantile(twinData[, "bmi1"], probs = c(.25, .4, .7), na.rm = TRUE)
obesityLevels = c('underWeight', 'normal', 'overweight', 'obese')
twinData$obeseQuad1 <- cut(twinData$bmi1, breaks = c(-Inf, cutPoints, Inf), labels = obesityLevels)
twinData$obeseQuad2 <- cut(twinData$bmi2, breaks = c(-Inf, cutPoints, Inf), labels = obesityLevels)
selDVs = c("obeseQuad1", "obeseQuad2")
twinData[, selDVs] <- mxFactor(twinData[, selDVs], levels = obesityLevels)

selDVs = umx_paste_names(c("bmi", "obese", "obeseTri", "obeseQuad"), "", 1:2)
mzData <- subset(twinData, zyg == "MZFF", selDVs)
str(mzData)
umxThresholdMatrix(mzData, suffixes = 1:2, verbose = FALSE)
}
\references{
- \url{https://github.com/tbates/umx}, \url{tbates.github.io}, \url{http://openmx.psyc.virginia.edu}
}
\seealso{
- \code{\link{umxOrdinalObjective}}

Other umx.twin model builder, umx build functions: \code{\link{umxOrdinalObjective}}
}
