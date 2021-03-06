% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/weathermetrics.R
\docType{package}
\name{weathermetrics}
\alias{weathermetrics}
\alias{weathermetrics-package}
\title{weathermetrics: Functions to convert between weather metrics}
\description{
The weathermetics package provides functions to convert between Celsius
    and Fahrenheit, to convert between dew point temperature and relative
    humidity, and to calculate heat index.
}
\section{weathermetrics functions}{

This package includes the following functions to calculate vectors of
   weather metrics: \code{\link{celsius.to.fahrenheit}},
   \code{\link{fahrenheit.to.celsius}},
   \code{\link{dewpoint.to.humidity}},
   \code{\link{humidity.to.dewpoint}}, and
   \code{\link{heat.index}}.
}

\references{
Anderson GB, Bell ML, Peng RD. 2013. Methods to calculate the heat index
   as an exposure Metric in environmental health research.
   Environmental Health Perspectives 121(10):1111-1119.

National Weather Service Hydrometeorological Prediction
   Center Web Team. Heat Index Calculator. 30 Jan 2015.
   \url{http://www.wpc.ncep.noaa.gov/html/heatindex.shtml}.
   Accessed 18 Dec 2015.
}
\author{
Brooke Anderson \email{brooke.anderson@colostate.edu},
Joshua Ferreri \email{joshua.m.ferreri@gmail.com},
Roger Peng \email{rdpeng@gmail.com}
}
