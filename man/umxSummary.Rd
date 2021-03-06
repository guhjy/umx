% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fit_and_reporting.r
\name{umxSummary}
\alias{umxSummary}
\title{Shows a compact, publication-style, summary of umx models}
\usage{
umxSummary(model, ...)
}
\arguments{
\item{model}{The \code{\link{mxModel}} whose fit will be reported}

\item{...}{Other parameters to control model summary}
}
\description{
Report the fit of a OpenMx model or specialized model class (such as ACE, CP etc.)
in a compact form suitable for reporting in a journal.

See documentation for RAM models summary here: \code{\link{umxSummary.MxModel}}.

View documentation on the ACE model subclass here: \code{\link{umxSummary.MxModelACE}}.

View documentation on the IP model subclass here: \code{\link{umxSummary.MxModelIP}}.

View documentation on the CP model subclass here: \code{\link{umxSummary.MxModelCP}}.

View documentation on the GxE model subclass here: \code{\link{umxSummary.MxModelGxE}}.
}
\seealso{
Other Reporting Functions: \code{\link{loadings.MxModel}},
  \code{\link{tmx_is.identified}}, \code{\link{umxAPA}},
  \code{\link{umxEval}}, \code{\link{umxFactorScores}},
  \code{\link{umxGetParameters}}, \code{\link{umxReduce}},
  \code{\link{umxWeightedAIC}},
  \code{\link{umx_APA_model_CI}},
  \code{\link{umx_APA_pval}}, \code{\link{umx_aggregate}},
  \code{\link{umx_names}}, \code{\link{umx_parameters}},
  \code{\link{umx_print}},
  \code{\link{umx_show_fit_or_comparison}},
  \code{\link{umx_show}}, \code{\link{umx_time}},
  \code{\link{umx}}
}
\concept{Core Modelling Functions
\url{https://www.github.com/tbates/umx}}
\concept{Reporting Functions}
