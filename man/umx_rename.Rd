\name{umx_rename}
\alias{umx_rename}
\title{umx_rename}
\usage{
umx_rename(x, replace, old = NULL)
}
\arguments{
  \item{x}{the dataframe in which to rename variables}

  \item{replace}{a named list of oldName = "newName" pairs
  OR a list of new names}

  \item{old}{Optional: a list of names that will be
  replaced by the contents of replace. defaults to NULL in
  which case replace must be paired list}
}
\value{
- the renamed dataframe
}
\description{
Returns a dataframe with variables renamed as desired. Checks that the variables exist, and that the new neames are not already used.
}
\examples{
# rename ages to "age"
x = mtcars
x = umx_rename(x, replace = c(cyl = "cylinder"))
# alternate style
x = umx_rename(x, old = c("disp"), replace = c("displacement"))
umx_check_names("displacement", data = x, die = T)
}
\seealso{
- \code{\link{umx_rename_file}}

Other umx utility functions: \code{\link{\%>\%}},
  \code{\link{\%>\%}}, \code{\link{umx_greater_than}};
  \code{\link{qm}}; \code{\link{umx.as.numeric}};
  \code{\link{umx_find_object}}; \code{\link{umx_grep}};
  \code{\link{umx_move_file}};
  \code{\link{umx_rename_file}}; \code{\link{umx_round}};
  \code{\link{umx_swap_a_block}}
}
