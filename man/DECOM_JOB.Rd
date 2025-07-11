% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/GCAM_JOB.R
\name{DECOM_JOB}
\alias{DECOM_JOB}
\title{DECOM_JOB}
\usage{
DECOM_JOB(GW_activity, method = NULL)
}
\arguments{
\item{GW_activity}{Output from GCAM_GW()}

\item{method}{Specify method for construction job.
"Net": in a given year, a technology pre-mature retirement and newly installed net out.
"Total": in a given year, a technology pre-mature retirement and newly installed can happen at the same time.}
}
\value{
A data frame of decommission job by subsector
}
\description{
DECOM_JOB
}
\examples{
job.DECOM <- DECOM_JOB(GW_activity, "Net")
job.DECOM <- DECOM_JOB(GW_activity)
}
