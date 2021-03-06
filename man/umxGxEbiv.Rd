% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/umx_build_umxGxEbiv.r
\name{umxGxEbiv}
\alias{umxGxEbiv}
\title{Bivariate GxE models where twins differ on the moderator.}
\usage{
umxGxEbiv(name = "GxEbiv", selDVs, selDefs, dzData, mzData, sep = NULL,
  lboundACE = NA, lboundM = NA, dropMissingDef = FALSE,
  autoRun = getOption("umx_auto_run"), tryHard = c("no", "mxTryHard",
  "mxTryHardOrdinal", "mxTryHardWideSearch"), optimizer = NULL)
}
\arguments{
\item{name}{The name of the model (defaults to "GxEbiv")}

\item{selDVs}{The dependent variable (e.g. IQ)}

\item{selDefs}{The definition variable (e.g. socioeconomic status)}

\item{dzData}{The DZ dataframe containing the Twin 1 and Twin 2 DV and moderator (4 columns)}

\item{mzData}{The MZ dataframe containing the Twin 1 and Twin 2 DV and moderator (4 columns)}

\item{sep}{Expand variable base names, i.e., "_T" makes var -> var_T1 and var_T2}

\item{lboundACE}{If !NA, then lbound the main effects at this value (default = NA)}

\item{lboundM}{If !NA, then lbound the moderators at this value (default = NA)}

\item{dropMissingDef}{Whether to automatically drop missing def var rows for the user (gives a warning) default = FALSE}

\item{autoRun}{Whether to run the model, and return that (default), or just to create it and return without running.}

\item{tryHard}{optionally tryHard (default 'no' uses normal mxRun). c("no", "mxTryHard", "mxTryHardOrdinal", "mxTryHardWideSearch")}

\item{optimizer}{Optionally set the optimizer (default NULL does nothing)}
}
\value{
\itemize{
\item GxEbiv \code{\link{mxModel}}
}
}
\description{
GxE interaction models test the hypothesis that the strength
of genetic (or environmental) influence varies parametrically
across levels of environment.
univariate (see \code{\link{umxGxE}}) models assume the twins share the moderator.
umxGxE umxGxEbiv allows testing moderation in cases where twins differ on the moderator,
(Purcell, 2002; van der Sluis et al., 2012).
}
\details{
It supports testing, and visualizing GxE bivariate (or C or E x E) interactions.

The following figure shows the GxE model as a path diagram: \emph{note}: Only Twin 1 is shown.
Twin 1 and twin 2 A, C, and E latent traits are connected in the standard fashion, with the
covariance of the T1 and T2 latent genetic traits set to .5 for DZ and 1.0 for MZ pairs.
For the sake of clarity, C, and E paths are omitted here. These mirror those for A.
\figure{GxEbiv.png}{}
}
\examples{
require(umx)
data(twinData)
selDVs  = "wt"
selDefs = "ht"
df = umx_scale_wide_twin_data(twinData, varsToScale = c("ht", "wt"), sep = "")
mzData  = subset(df, zygosity \%in\%  c("MZFF", "MZMM"))
dzData  = subset(df, zygosity \%in\%  c("DZFF", "DZMM", "DZOS"))

\dontrun{
m1 = umxGxEbiv(selDVs = selDVs, selDefs = selDefs, 
	dzData = dzData, mzData = mzData, sep = "", dropMissingDef = TRUE)

# Plot Moderation
umxSummaryGxEbiv(m1)
umxSummary(m1, location = "topright")
umxSummary(m1, separateGraphs = FALSE)
m2 = umxModify(m1, update = c("cBeta2_r1c1", "eBeta1_r1c1", "eBeta2_r1c1"), comparison = TRUE)
#
# TODO: teach umxReduce to test all relevant hypotheses for umxGxEbiv
umxReduce(m1)
}
}
\references{
\itemize{
\item Purcell, S. (2002). Variance components models for gene-environment interaction in twin analysis. \emph{Twin Research},
\strong{6}, 554-571. doi:\href{https://doi.org/10.1375/twin.5.6.554}{10.1375/twin.5.6.554}.
\item van der Sluis, S., Posthuma, D., & Dolan, C. V. (2012). A note on false positives and
power in G x E modelling of twin data. \emph{Behavior Genetics},
\strong{42}, 170-186. doi:\href{https://doi.org/10.1007/s10519-011-9480-3}{10.1007/s10519-011-9480-3}.
}
}
\seealso{
\itemize{
\item \code{\link{plot}()}, \code{\link{umxSummary}}, \code{\link{umxReduce}}
}

Other Twin Modeling Functions: \code{\link{umxACE_cov_fixed}},
  \code{\link{umxACEcov}}, \code{\link{umxACEnew}},
  \code{\link{umxACEv}}, \code{\link{umxACE}},
  \code{\link{umxCPold}}, \code{\link{umxCP}},
  \code{\link{umxGxE_window}}, \code{\link{umxGxE}},
  \code{\link{umxIPnew}}, \code{\link{umxIP}},
  \code{\link{umxSexLim}}, \code{\link{umxSimplex}},
  \code{\link{umxSummaryACEcov}},
  \code{\link{umxSummaryACEv}},
  \code{\link{umxSummaryACE}}, \code{\link{umxSummaryCP}},
  \code{\link{umxSummaryGxEbiv}},
  \code{\link{umxSummaryGxE}}, \code{\link{umxSummaryIP}},
  \code{\link{umxSummarySexLim}},
  \code{\link{umxSummarySimplex}}, \code{\link{umx}},
  \code{\link{xmu_twin_check}}
}
\concept{Twin Modeling Functions}
