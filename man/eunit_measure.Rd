% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/eunit_measure.R
\name{eunit_measure}
\alias{eunit_measure}
\alias{eunit_measure-spatPomp}
\alias{eunit_measure,spatPomp-method}
\title{Expectation of the measurement model for one unit}
\usage{
\S4method{eunit_measure}{spatPomp}(object, x, unit, time, params, Np = 1, log = FALSE)
}
\arguments{
\item{object}{An object of class \code{spatPomp}}

\item{x}{A state vector for all units}

\item{unit}{The unit for which to evaluate the expectation}

\item{time}{The time for which to evaluate the expectation}

\item{params}{parameters at which to evaluate the unit expectation}

\item{Np}{numeric; defaults to 1 and the user need not change this}

\item{log}{logical; should the density be returned on log scale?}
}
\value{
A class \sQuote{matrix} with the unit expected observation for spatial unit \code{unit}
corresponding to the corresponding states in \code{x}.
}
\description{
\code{eunit_measure} evaluates the expectation of a unit's observation given the entire state
}
\examples{
# Complete examples are provided in the package tests
\dontrun{
b <- bm(U=3)
s <- states(b)[,1,drop=FALSE]
rownames(s) -> rn
dim(s) <- c(3,1,1)
dimnames(s) <- list(variable=rn, rep=NULL)
p <- coef(b); names(p) -> rnp
dim(p) <- c(length(p),1); dimnames(p) <- list(param=rnp)
o <- obs(b)[,1,drop=FALSE]
eunit_measure(b, x=s, unit=2, time=1, params=p)
}

}
