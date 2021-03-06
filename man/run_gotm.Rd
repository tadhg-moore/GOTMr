% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/run_gotm.R
\name{run_gotm}
\alias{run_gotm}
\title{Run the GOTM model}
\usage{
run_gotm(sim_folder = ".", yaml = TRUE, yaml_file = "gotm.yaml",
  verbose = FALSE, args = character())
}
\arguments{
\item{sim_folder}{the directory where simulation files are contained}

\item{yaml}{logical; If true will use 'gotm.yaml' file for set up otherwise it will use namelist files. Defaults to TRUE}

\item{yaml_file}{filepath; to file with GOTM setup. Defaults to 'gotm.yaml'}

\item{verbose}{Save output as character vector. Defaults to FALSE}

\item{args}{Optional arguments to pass to GOTM executable}
}
\description{
This runs the GOTM model on the specific simulation stored in \code{sim_folder}.
The specified \code{sim_folder} must contain valid NML files.
}
\examples{
sim_folder <- system.file('extdata', package = 'GOTMr')
run_gotm(sim_folder)
}
\author{
Tadhg Moore
}
\keyword{methods}
