% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/wind_conversions.R
\name{speed_to_knots}
\alias{speed_to_knots}
\title{Convert between standard units of measure for wind speed}
\usage{
speed_to_knots(x, unit, round.out = TRUE, round = 1)
}
\arguments{
\item{x}{Numeric vector of wind speeds, in units specified by \code{unit}}

\item{unit}{Character specifying the speed unit to convert to from knots.
Possible values are:
  \itemize{
    \item \code{mph}: Miles per hour
    \item \code{mps}: Meters per second
    \item \code{ftps}: Feet per second
    \item \code{kmph}: Kilometers per hour
  }}

\item{round.out}{Variable with the indicating whether or not to round results.
Possible values are TRUE or FALSE. Default value is TRUE.}

\item{round}{Integer indicating the number of decimal places to
round converted value. Default value is 1.}
}
\value{
A numeric vector of speeds (in knots)
}
\description{
\code{speed_to_knots} creates a numeric vector of speed in knots from a
  numeric vector of speed in the specified unit.
}
\details{
The numeric vector specified for x must be in the units provided as a
  character specified by unit.
}
\note{
Equations are from the source code for the National Oceanic and
   and Atmospheric Administration's
   \href{http://www.srh.noaa.gov/epz/?n=wxcalc_windconvert}{online wind speed
   converter}
}
\examples{
data(beijing)
beijing$knots <- speed_to_knots(beijing$kmph, "kmph", r = TRUE)
beijing

}
\author{
Brooke Anderson \email{brooke.anderson@colostate.edu},
Joshua Ferreri \email{joshua.m.ferreri@gmail.com}
}
\references{
\url{http://www.srh.noaa.gov/epz/?n=wxcalc_windconvert}
}
\seealso{
\code{\link{knots_to_speed}}
}
