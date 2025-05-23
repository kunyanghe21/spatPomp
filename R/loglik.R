##' Log likelihood extractor 
##'
##' Extracts the estimated log likelihood from a fitted model
##'
##' @name logLik
##' @rdname loglik
##' @include girf.R bpfilter.R abf.R iubf.R abfir.R igirf.R
##'
##' @param object fitted model object
##'
##' @return a numeric which is the estimated log likelihood
NULL

##' @name logLik-girfd_spatPomp
##' @aliases logLik,girfd_spatPomp-method
##' @rdname loglik
##' @export
setMethod(
  "logLik",
  signature=signature(object="girfd_spatPomp"),
  definition=function(object)object@loglik
)

##' @name logLik-bpfilterd_spatPomp
##' @aliases logLik,bpfilterd_spatPomp-method
##' @rdname loglik
##' @export
setMethod(
  "logLik",
  signature=signature(object="bpfilterd_spatPomp"),
  definition=function(object)object@loglik
)


##' @name logLik-abfd_spatPomp
##' @aliases logLik,abfd_spatPomp-method
##' @rdname loglik
##' @export
setMethod(
  "logLik",
  signature=signature(object="abfd_spatPomp"),
  definition=function(object)object@loglik
)

##' @name logLik-iubfd_spatPomp
##' @aliases logLik,iubfd_spatPomp-method
##' @rdname loglik
##' @export
setMethod(
  "logLik",
  signature=signature(object="iubfd_spatPomp"),
  definition=function(object)object@loglik
)


##' @name logLik-abfird_spatPomp
##' @aliases logLik,abfird_spatPomp-method
##' @rdname loglik
##' @export
setMethod(
  "logLik",
  signature=signature(object="abfird_spatPomp"),
  definition=function(object)object@loglik
)

##' @name logLik-igirfd_spatPomp
##' @aliases logLik,igirfd_spatPomp-method
##' @rdname loglik
##' @export
setMethod(
  "logLik",
  signature=signature(object="igirfd_spatPomp"),
  definition=function(object)object@loglik
)
