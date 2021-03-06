% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/misc_and_utility.r
\name{umx_rename}
\alias{umx_rename}
\title{umx_rename}
\usage{
umx_rename(x, replace = NULL, old = NULL, grep = NULL,
  test = FALSE)
}
\arguments{
\item{x}{the dataframe in which to rename variables}

\item{replace}{If used alone, a named collection of c(oldName = "newName") pairs
OR, if "old" is a list of existing names, the list of new names)
OR, if "grep" is a regular expression, the replace string)}

\item{old}{Optional list of old names that will be found and replaced by the contents of replace. Defaults to NULL.}

\item{grep}{Optional grep string. Matches will be replaced using replace as the replace string. Defaults to NULL.}

\item{test}{whether to report a "dry run" - and not actually change anything. Defaults to FALSE.}
}
\value{
\itemize{
\item dataframe with columns renamed.
}
}
\description{
Returns a dataframe with variables renamed as desired.
}
\details{
Unlike similar functions in other packages, it checks that the variables exist, and that the new names do not.

Importantly, it also supports \link[=regex]{regular expressions}. This allows you to find and replace
text based on patterns and replacements. so to change "replacement" to "in place",
\code{grep=re(place)ment}, \code{replace= in \\1}.

\emph{note}: to use replace list, you must say c(old = "new"), not c(old -> "new")
}
\examples{
# Re-name "cyl" to "cylinder"
x = mtcars
x = umx_rename(x, replace = c(cyl = "cylinder"))
# alternate style
x = umx_rename(x, old = c("disp"), replace = c("displacement"))
umx_check_names("displacement", data = x, die = TRUE)
# This will warn that "disp" does not exist (anymore)
x = umx_rename(x, old = c("disp"), replace = c("displacement"))
x = umx_rename(x, grep = "lacement", replace = "") # using grep to revert to disp
umx_names(x, "^d") # all names begining with a d
}
\seealso{
\link{namez} to filter (and replace) names, Also \link{umx_check_names} to check for existence of names in a dataframe.

Other Data Functions: \code{\link{umxCovData}},
  \code{\link{umxHetCor}},
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
  \code{\link{umx_read_lower}}, \code{\link{umx_reorder}},
  \code{\link{umx_stack}}, \code{\link{umx_swap_a_block}},
  \code{\link{umx}}
}
\concept{Data Functions}
