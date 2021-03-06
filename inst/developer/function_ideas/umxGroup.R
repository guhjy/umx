Several different types of measurement invariance can be distinguished in the common factor model for continuous outcomes: Assuming a CFA with factor-means estimated, one
1) Equal form: The number of factors and the pattern of factor-indicator relationships are identical across groups (also known as configural invariance).
2) Equal loadings: Factor loadings are equal across groups.
3) Equal intercepts: When observed scores are regressed on each factor, the intercepts are equal across groups.
4) Equal residual variances: The residual variances of the observed scores not accounted for by the factors are equal across groups.

1. add a group column to your data set
2. add a group column to your data set
1. Make the model
library(psych)
Aitems = paste0("A", 1:5)
m1 = umxRAM("base", data = bfi,
	umxPath("A", Aitems, firstAt = 1),
	umxPath(v.m. = c("A", Aitems))
)
m2 = umxGroup(model = m1, data = bfi, groupColumn = "gender", name= "sex_test")

umxGroup <- function(model, data, groupColumn = NULL, name = "group_test") {
	# 1. get each level of the grouping column
	groupLevels = levels(data[,groupColumn])
	modelList = list()
	n = 1
	# 2. create a list of model copies, each with a subset of the data.
	# 3. decide what to do about path labels and how to equate them by default.
	for (thisLevel in groupLevels) {
		thisModel = model
		thisData = subset(data, groupColumn == thisLevel)
		thisModel$data = mxData(thisData[,thisModel$manifestVars])
		thisModel$name = paste0(thisModel$name)
		modelList[n]= thisModel
		n = n+1
	}
	m1 = umxSuperModel(modelList, name = name)
	return(m1)
}

umxInvariance(m2)

f1 ~ y1+y2+y3

 F1 =~ x1+x2  # "is measured by" 11 characters
 umxPath(f1 ~ y1+y2+y3) # 20 characters
(f1  y1+y2+y3)
 umxPath(c("y1", "y2", "y3"), to = "f1") # 30 characters
 y1 ~~ y1  # variance
 y1 ~~ y2  # covariance
 f1 ~~ f2  # covariance
 y1 ~ 1 # mean/intercept

HS.paths <- '  visual =~ x1 + x2 + x3
              textual =~ x4 + x5 + x6
              speed   =~ x7 + x8 + x9 '

fit <- cfa(HS.model, data = HolzingerSwineford1939, group = "school",
	group.equal = c("loadings", "intercepts"),
	group.partial = c("visual=~x2", "x7~1")
)

fit <- cfa(HS.model, 
           data = HolzingerSwineford1939, 
           group = "school",
           group.equal = c("loadings"))
summary(fit)


### Sunthud Pornprasertmanit & Yves Rosseel
### Last updated: 3 April 2017


#' Measurement Invariance Tests
#'
#' Testing measurement invariance across groups using a typical sequence of
#' model comparison tests.
#'
#' If \code{strict = FALSE}, the following four models are tested in order:
#' \enumerate{
#'  \item Model 1: Configural invariance. The same factor structure is imposed on all groups.
#'  \item Model 2: Weak invariance. The factor loadings are constrained to be equal across groups.
#'  \item Model 3: Strong invariance. The factor loadings and intercepts are constrained to be equal across groups.
#'  \item Model 4: The factor loadings, intercepts and means are constrained to be equal across groups.
#' }
#'
#' Each time a more restricted model is fitted, a \eqn{\Delta\chi^2} test is
#' reported, comparing the current model with the previous one, and comparing
#' the current model to the baseline model (Model 1). In addition, the
#' difference in CFI is also reported (\eqn{\Delta}CFI).
#'
#' If \code{strict = TRUE}, the following five models are tested in order:
#' \enumerate{
#'  \item Model 1: configural invariance. The same factor structure
#'    is imposed on all groups.
#'  \item Model 2: weak invariance. The factor loadings are constrained to be
#'    equal across groups.
#'  \item Model 3: strong invariance. The factor loadings and intercepts are
#'    constrained to be equal across groups.
#'  \item Model 4: strict invariance. The factor loadings, intercepts and
#'    residual variances are constrained to be equal across groups.
#'  \item Model 5: The factor loadings, intercepts, residual variances and means
#'    are constrained to be equal across groups.
#' }
#'
#' Note that if the \eqn{\chi^2} test statistic is scaled (e.g., a Satorra-Bentler
#' or Yuan-Bentler test statistic), a special version of the \eqn{\Delta\chi^2}
#' test is used as described in \url{http://www.statmodel.com/chidiff.shtml}
#'
#' @importFrom lavaan parTable
#' @aliases measurementInvariance measurementinvariance
#' @param ... The same arguments as for any lavaan model.  See
#' \code{\link{cfa}} for more information.
#' @param std.lv If \code{TRUE}, the fixed-factor method of scale
#' identification is used. If \code{FALSE}, the first variable for each factor
#' is used as marker variable.
#' @param strict If \code{TRUE}, the sequence requires `strict' invariance.
#' See details for more information.
#' @param quiet If \code{FALSE} (default), a summary is printed out containing
#' an overview of the different models that are fitted, together with some
#' model comparison tests. If \code{TRUE}, no summary is printed.
#' @param fit.measures Fit measures used to calculate the differences between
#' nested models.
#' @param method The method used to calculate likelihood ratio test. See
#' \code{\link[lavaan]{lavTestLRT}} for available options
#' @return Invisibly, all model fits in the sequence are returned as a list.
#' @author Yves Rosseel (Ghent University; \email{Yves.Rosseel@@UGent.be})
#'
#' Sunthud Pornprasertmanit (\email{psunthud@@gmail.com})
#'
#' Terrence D. Jorgensen (University of Amsterdam; \email{TJorgensen314@gmail.com})
#' @seealso \code{\link{longInvariance}} for the measurement invariance test
#' within person; \code{partialInvariance} for the automated function for
#' finding partial invariance models
#' @references Vandenberg, R. J., and Lance, C. E. (2000). A review and
#' synthesis of the measurement invariance literature: Suggestions, practices,
#' and recommendations for organizational research. \emph{Organizational
#' Research Methods, 3,} 4-70.
#' @examples
#'
#' HW.model <- ' visual =~ x1 + x2 + x3
#'               textual =~ x4 + x5 + x6
#'               speed =~ x7 + x8 + x9 '
#'
#' measurementInvariance(HW.model, data = HolzingerSwineford1939,
#'                       group = "school", fit.measures = c("cfi","aic"))
#'
#' @export
umxMeasurementInvariance <- function(model, std.lv = FALSE, strict = FALSE, quiet = FALSE, fit.measures = "default", method = "satorra.bentler.2001") {

	lavaancfa <- function(...) {
		lavaan::cfa(...)
	}
  res <- list()
  ## base-line model: configural invariance

	configural <- model
	configural$group.equal <- ""
	template <- try(do.call(lavaancfa, configural), silent = TRUE)
	if (class(template) == "try-error") stop('Configural model did not converge.')

	pttemplate <- parTable(template)
	varnames <- unique(pttemplate$rhs[pttemplate$op == "=~"])
	facnames <- unique(pttemplate$lhs[(pttemplate$op == "=~") & (pttemplate$rhs %in% varnames)])
	ngroups <- max(pttemplate$group)
	if (ngroups <= 1) stop("Well, the number of groups is 1. Measurement",
	                       " invariance across 'groups' cannot be done.")

	if (std.lv) {
		for (i in facnames) {
			pttemplate <- fixParTable(pttemplate, i, "~~", i, 1:ngroups, 1)
		}
		fixloadings <- which(pttemplate$op == "=~" & pttemplate$free == 0)
		for (i in fixloadings) {
			pttemplate <- freeParTable(pttemplate, pttemplate$lhs[i], "=~",
			                           pttemplate$rhs[i], pttemplate$group[i])
		}
		res$fit.configural <- try(do.call(pttemplate, template), silent = TRUE)
	} else {
		res$fit.configural <- template
	}

  ## fix loadings across groups
	if (std.lv) {
		findloadings <- which(pttemplate$op == "=~" & pttemplate$free != 0 & pttemplate$group == 1)
		for (i in findloadings) {
			pttemplate <- constrainParTable(pttemplate, pttemplate$lhs[i],
			                                "=~", pttemplate$rhs[i], 1:ngroups)
		}
		for (i in facnames) {
			pttemplate <- freeParTable(pttemplate, i, "~~", i, 2:ngroups)
		}
		res$fit.loadings <- try(do.call(pttemplate, template), silent = TRUE)
	} else {
		loadings <- dotdotdot
		loadings$group.equal <- c("loadings")
		res$fit.loadings <- try(do.call("cfa", loadings), silent = TRUE)
	}

  ## fix loadings + intercepts across groups
	if (std.lv) {
		findintcepts <- which(pttemplate$op == "~1" & pttemplate$lhs %in% varnames &
		                        pttemplate$free != 0 & pttemplate$group == 1)
		for (i in findintcepts) {
			pttemplate <- constrainParTable(pttemplate,
			                                pttemplate$lhs[i], "~1", "", 1:ngroups)
		}
		for (i in facnames) {
			pttemplate <- freeParTable(pttemplate, i, "~1", "", 2:ngroups)
		}
		res$fit.intercepts <- try(do.call(pttemplate, template), silent = TRUE)
	} else {
		intercepts <- dotdotdot
		intercepts$group.equal <- c("loadings", "intercepts")
		res$fit.intercepts <- try(do.call(lavaancfa, intercepts), silent = TRUE)
	}

  if (strict) {
		if (std.lv) {
			findresiduals <- which(pttemplate$op == "~~" &
			                         pttemplate$lhs %in% varnames &
			                         pttemplate$rhs == pttemplate$lhs &
			                         pttemplate$free != 0 & pttemplate$group == 1)
			for (i in findresiduals) {
				pttemplate <- constrainParTable(pttemplate, pttemplate$lhs[i], "~~",
				                                pttemplate$rhs[i], 1:ngroups)
			}
			res$fit.residuals <- try(do.call(pttemplate, template), silent = TRUE)
			for (i in facnames) {
				pttemplate <- fixParTable(pttemplate, i, "~1", "", 1:ngroups, 0)
			}
			res$fit.means <- try(do.call(pttemplate, template), silent = TRUE)
		} else {
			# fix loadings + intercepts + residuals
			residuals <- dotdotdot
			residuals$group.equal <- c("loadings", "intercepts", "residuals")
			res$fit.residuals <- try(do.call(lavaancfa, residuals), silent = TRUE)

			# fix loadings + residuals + intercepts + means
			means <- dotdotdot
			means$group.equal <- c("loadings", "intercepts", "residuals", "means")
			res$fit.means <- try(do.call(lavaancfa, means), silent = TRUE)
		}
  } else {
		if (std.lv) {
			for (i in facnames) {
				pttemplate <- fixParTable(pttemplate, i, "~1", "", 1:ngroups, 0)
			}
			res$fit.means <- try(do.call(pttemplate, template), silent = TRUE)
		} else {
			# fix loadings + intercepts + means
			means <- dotdotdot
			means$group.equal <- c("loadings", "intercepts", "means")
			res$fit.means <- try(do.call(lavaancfa, means), silent = TRUE)
		}
  }

	if (!quiet) printInvarianceResult(res, fit.measures, method)
  invisible(res)
}



## ----------------
## Hidden Functions
## ----------------

#' @importFrom lavaan lavInspect
printInvarianceResult <- function(FIT, fit.measures, method) {
  ## check whether models converged
  NAMES <- names(FIT)
  nonconv <- which(sapply(FIT, class) == "try-error")
  if (length(nonconv)) {
    message('The following model(s) did not converge: \n', paste(NAMES[nonconv], sep = "\n"))
    FIT <- FIT[-nonconv]
    NAMES <- NAMES[-nonconv]
  }
	names(FIT) <- NULL
	## compare models
	lavaanLavTestLRT <- function(...) lavaan::lavTestLRT(...)
	TABLE <- do.call(lavaanLavTestLRT, c(FIT, list(model.names = NAMES,
	                                               method = method)))

	if (length(fit.measures) == 1L && fit.measures == "default") {
		## scaled test statistic?
		if (length(lavInspect(FIT[[1]], "test")) > 1L) {
			fit.measures <- c("cfi.scaled", "rmsea.scaled")
		} else {
			fit.measures <- c("cfi", "rmsea")
		}
	}

	## add some fit measures
	if (length(fit.measures)) {

		FM <- lapply(FIT, lavaan::fitMeasures, fit.measures)
		FM.table1 <- sapply(fit.measures, function(x) sapply(FM, "[[", x))
		if (length(FM) == 1L) {
			FM.table1 <- rbind( rep(as.numeric(NA), length(fit.measures)), FM.table1)
		}
		if (length(FM) > 1L) {
			FM.table2 <- rbind(as.numeric(NA),
							   abs(apply(FM.table1, 2, diff)))
			colnames(FM.table2) <- paste(colnames(FM.table2), ".delta", sep = "")
			FM.TABLE <- as.data.frame(cbind(FM.table1, FM.table2))
		} else {
			FM.TABLE <- as.data.frame(FM.table1)
		}
		rownames(FM.TABLE) <- rownames(TABLE)
		class(FM.TABLE) <- c("lavaan.data.frame", "data.frame")
	}
	cat("\n")
	cat("Measurement invariance models:\n\n")
	cat(paste(paste("Model", seq_along(FIT), ":", NAMES), collapse = "\n"))
	cat("\n\n")

	print(TABLE)
	if (length(fit.measures)) {
		cat("\n\n")
		cat("Fit measures:\n\n")
		print(FM.TABLE)
		cat("\n")
	}
}

