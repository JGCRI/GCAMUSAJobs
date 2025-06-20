% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plots.R
\name{PLOT_GW}
\alias{PLOT_GW}
\title{PLOT_GW}
\usage{
PLOT_GW(GW_activity, state = NULL, method = NULL)
}
\arguments{
\item{GW_activity}{Output from GCAM_GW()}

\item{method}{"Net" or "Total"}
}
\value{
A trend plot of capacity activity by fuel technology at the national level
}
\description{
PLOT_GW
}
\examples{
PLOT_GW(GW_activity, "Net")
PLOT_GW(GW_activity, "Total")
}
