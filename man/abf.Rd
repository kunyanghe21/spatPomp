% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/abf.R
\name{abf}
\alias{abf}
\alias{abf-spatPomp}
\alias{abf,spatPomp-method}
\alias{abf-abfd_spatPomp}
\alias{abf,abfd_spatPomp-method}
\title{Adapted Bagged Filter (ABF)}
\usage{
\S4method{abf}{spatPomp}(
  object,
  Nrep,
  Np,
  nbhd,
  params,
  tol = 1e-100,
  ...,
  verbose = getOption("spatPomp_verbose", FALSE)
)

\S4method{abf}{abfd_spatPomp}(
  object,
  Nrep,
  Np,
  nbhd,
  tol,
  ...,
  verbose = getOption("spatPomp_verbose", FALSE)
)
}
\arguments{
\item{object}{A \code{spatPomp} object.}

\item{Nrep}{The number of bootstrap replicates for the adapted simulations.}

\item{Np}{The number of particles used within each replicate for the adapted simulations.}

\item{nbhd}{A neighborhood function with three arguments: \code{object}, \code{time} and \code{unit}.
The function should return a \code{list} of two-element vectors that represent space-time
neighbors of \eqn{(u,n)}, which is represented by \code{c(unit,time)}.
See example below for more details.}

\item{params}{Parameter vector, required if not available from the spatPomp model object.}

\item{tol}{If the resampling weight for a particle is zero due to floating-point precision issues, it is set to the value of \code{tol} since resampling has to be done.}

\item{\dots}{Additional arguments can be used to replace model components.}

\item{verbose}{logical; if \code{TRUE}, messages updating the user on progress will be printed to the console.}
}
\value{
Upon successful completion, \code{abf()} returns an object of class
\sQuote{abfd_spatPomp} containing the algorithmic parameters used to run \code{abf()}
and the estimated likelihood.
}
\description{
An algorithm for estimating the likelihood of a spatiotemporal partially-observed Markov process model.
Running \code{abf} causes the algorithm to run bootstrap replicate jobs which each yield an imperfect adapted simulation. Simulating from the "adapted filter"
distribution runs into a curse of dimensionality (COD) problem, which is mitigated by keeping particles in each replicate close to each other through resampling down
to one particle per replicate at each observation time point.
The adapted simulations are then weighted in a way that mitigates COD by making a weak coupling assumption to get an approximate filter distribution.
As a by-product, we also get an estimate of the likelihood of the data.
}
\section{Methods}{

The following methods are available for such an object:
\describe{
\item{\code{\link{logLik}}}{ yields an estimate of the log-likelihood of the data under the model. }
}
}

\examples{
# Complete examples are provided in the package tests
\dontrun{
# Create a simulation of a Brownian motion
b <- bm(U=2, N=5)

# Create a neighborhood function mapping a point in space-time
# to a list of neighboring points in space-time
bm_nbhd <- function(object, time, unit) {
  nbhd_list = list()
  if(time > 1 && unit > 1){
    nbhd_list = c(nbhd_list, list(c(unit-1, time-1)))
  }
  return(nbhd_list)
}

# Run ABF specified number of Monte Carlo replicates and particles per replicate
abfd_bm <- abf(b, Nrep=2, Np=10, nbhd=bm_nbhd)

# Get the likelihood estimate from ABF
logLik(abfd_bm)
}
}
\references{
\ionides2021
}
\seealso{
likelihood maximization algorithms: \code{ienkf()}, \code{igirf}, \code{iubf}, \code{ibpf}

Other likelihood evaluation algorithms: 
\code{\link{abfir}()},
\code{\link{bpfilter}()},
\code{\link{enkf}()},
\code{\link{girf}()}
}
\author{
Kidus Asfaw
}
\concept{likelihood evaluation algorithms}
