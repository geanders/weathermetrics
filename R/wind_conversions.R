#' Convert between standard units of measure for wind speed
#'
#' \code{speed.to.knots} creates a numeric vector of speed in knots from a
#'   numeric vector of speed in the specified unit.
#'
#' @param x Numeric vector of speeds in specified unit
#' @param round Integer indicating the number of decimal places to
#'     round converted value. Default value is 1.
#' @param unit Character specifying the speed unit for x. Possible values are
#'   \code{mph}, \code{mps}, \code{ftps}, and \code{kmph} where
#'   \code{mph} is miles per hour, \code{mps} is meters per second,
#'   \code{ftps} is feet per second, and \code{kmph} is kilometers per hour.
#'
#' @return A numeric vector of speeds (in knots)
#'
#'@details The numeric vector specified for x must be in the units provided as a
#'  character specified by unit.
#'
#' @notes Equations are from the source code for the National Oceanic and
#'    and Atmospheric Administration's
#'    \href{http://www.srh.noaa.gov/epz/?n=wxcalc_windconvert}{online wind speed
#'    converter}
#'
#' @author
#' Brooke Anderson \email{brooke.anderson@@colostate.edu},
#' Joshua Ferreri \email{joshua.m.ferreri@gmail.com}
#'
#' @references
#'\url{http://www.srh.noaa.gov/epz/?n=wxcalc_windconvert}
#'
#' @examples
#'
#' @export
speed.to.knots <-
        function(x, round = 1, unit)
        {
                if(unit == "mph"){
                        knots = x * 0.8689762
                        return(round(knots, round))
                }
                if(unit == "mps"){
                        knots = x * 1.9438445
                        return(round(knots, round))
                }
                if(unit == "ftps"){
                        knots = x * 0.5924838
                        return(round(knots, round))
                }
                if(unit == "kmph"){
                        knots = kmph * 0.539593
                        return(round(knots, round))
                }
        }

#' Convert from knots to standard units of wind speed
#'
#' \code{knots.to.speed} creates a numeric vector of speed in a specified unit
#'   from a numeric vector of speed in knots.
#'
#' @param knots Numeric vector of speeds in knots
#' @param round Integer indicating the number of decimal places to
#'     round converted value. Default value is 1.
#' @param unit Character specifying the speed unit to convert to from knots.
#'   Possible values are \code{mph}, \code{mps}, \code{ftps}, and \code{kmph}
#'   where \code{mph} is miles per hour, \code{mps} is meters per second,
#'   \code{ftps} is feet per second, and \code{kmph} is kilometers per hour.
#' @return A numeric vector of speeds (in the specified unit)
#'
#' @details Output will be in the speed units specified by unit.
#'
#' @notes Equations are from the source code for the National Oceanic and
#'   and Atmospheric Administration's
#'   \href{http://www.srh.noaa.gov/epz/?n=wxcalc_windconvert}{online wind speed
#'   converter}
#'
#' @author
#' Brooke Anderson \email{brooke.anderson@@colostate.edu},
#' Joshua Ferreri \email{joshua.m.ferreri@gmail.com}
#'
#' @references
#'\url{http://www.srh.noaa.gov/epz/?n=wxcalc_windconvert}
#'
#' @examples
#'
#' @export
knots.to.speed <-
        function(knots, round = 1, unit)
        {
                if(unit == "mph"){
                        mph = round(knots * 1.1507794, round)
                        return(mph)
                }
                if(unit == "mps"){
                        mps = round(knots * 0.5144444, round)
                        return(mps)
                }
                if(unit == "ftps"){
                        ftps = round(knots * 1.6878099, round)
                        return(ftps)
                }
                if(unit == "kmph"){
                        kmph = round(knots * 1.85325, round)
                        return(kmph)
                }
        }

