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
  Returns a dataframe with variables renamed as desired.
  Checks that the variables exist, and that the new neames
  are not already used.
}
\examples{
\dontrun{
rename ages to "age"
x = rename(x, replace = c(ages = "age"))
alternate style
x = rename(x, old = c("ages"), replace = c("age"))
}
}
\references{
  -
}
\seealso{
  - \code{\link{umx_rename_file}}
}
