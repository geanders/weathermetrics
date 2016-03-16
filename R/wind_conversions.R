#' Convert between standard units of measure for wind speed
#'
#' \code{speed.to.knots} creates a numeric vector of speed in knots from a
#'   numeric vector of speed in the specified unit.
#'
#' @param x Numeric vector of wind speeds, in units specified by \code{unit}
#' @param unit Character specifying the speed unit to convert to from knots.
#'   Possible values are:
#'     \itemize{
#'       \item \code{mph}: Miles per hour
#'       \item \code{mps}: Meters per second
#'       \item \code{ftps}: Feet per second
#'       \item \code{kmph}: Kilometers per hour
#'     }
#' @param round Variable with the indicating whether or not to round results.
#'     Possible values are TRUE or FALSE. Default value is TRUE.
#' @param y Integer indicating the number of decimal places to
#'     round converted value. Default value is 1.
#'
#' @return A numeric vector of speeds (in knots)
#'
#' @details The numeric vector specified for x must be in the units provided as a
#'   character specified by unit.
#'
#' @note Equations are from the source code for the National Oceanic and
#'    and Atmospheric Administration's
#'    \href{http://www.srh.noaa.gov/epz/?n=wxcalc_windconvert}{online wind speed
#'    converter}
#'
#' @author
#' Brooke Anderson \email{brooke.anderson@@colostate.edu},
#' Joshua Ferreri \email{joshua.m.ferreri@@gmail.com}
#'
#' @seealso \code{\link{knots.to.speed}}
#'
#' @references
#'\url{http://www.srh.noaa.gov/epz/?n=wxcalc_windconvert}
#'
#' @examples
#' data(beijing)
#' beijing$knots <- speed.to.knots(beijing$kmph, "kmph", round = TRUE)
#' beijing
#'
#' @export
speed.to.knots <-
        function(x, unit, round = TRUE, y = 1)
        {
                if(unit == "mph" & round == TRUE){
                        knots = x * 0.8689762
                        return(round(knots, y))
                } else if(unit == "mps" & round == TRUE){
                        knots = x * 1.9438445
                        return(round(knots, y))
                } else if(unit == "ftps" & round == TRUE){
                        knots = x * 0.5924838
                        return(round(knots, y))
                } else if(unit == "kmph" & round == TRUE){
                        knots = x * 0.539593
                        return(round(knots, y))
                } else if(unit == "kmph" & round == TRUE){
                        knots = kmph * 0.539593
                        return(round(knots, y))
                } else if(unit == "mph" & round == FALSE){
                        knots = x * 0.8689762
                        return(knots)
                } else if(unit == "mps" & round == FALSE){
                        knots = x * 1.9438445
                        return(knots)
                } else if(unit == "ftps" & round == FALSE){
                        knots = x * 0.5924838
                        return(knots)
                } else if(unit == "kmph" & round == FALSE){
                        knots = x * 0.539593
                        return(knots)
                } else {
                        stop("Unit must be one of the specified units for wind
                             speed")
                }
        }

#' Convert from knots to standard units of wind speed
#'
#' \code{knots.to.speed} creates a numeric vector of speed, in units
#'    specified by \code{unit},
#'   from a numeric vector of speed in knots.
#'
#' @param knots Numeric vector of speeds in knots
#' @param unit Character specifying the speed unit to convert to from knots.
#'   Possible values are:
#'     \itemize{
#'       \item \code{mph}: Miles per hour
#'       \item \code{mps}: Meters per second
#'       \item \code{ftps}: Feet per second
#'       \item \code{kmph}: Kilometers per hour
#'     }
#' @param round Variable with the indicating whether or not to round results.
#'     Possible values are TRUE or FALSE. Default value is TRUE.
#' @param y Integer indicating the number of decimal places to
#'     round converted value. Default value is 1.
#'
#' @return A numeric vector of speeds (in the specified unit)
#'
#' @details Output will be in the speed units specified by unit.
#'
#' @note Equations are from the source code for the National Oceanic and
#'   and Atmospheric Administration's
#'   \href{http://www.srh.noaa.gov/epz/?n=wxcalc_windconvert}{online wind speed
#'   converter}
#'
#' @author
#' Brooke Anderson \email{brooke.anderson@@colostate.edu},
#' Joshua Ferreri \email{joshua.m.ferreri@@gmail.com}
#'
#' @seealso \code{\link{speed.to.knots}}
#'
#' @references
#'\url{http://www.srh.noaa.gov/epz/?n=wxcalc_windconvert}
#'
#' @examples
#' data(foco)
#' foco$mph <- knots.to.speed(foco$knots, "mph", round = TRUE)
#' foco$mps <- knots.to.speed(foco$knots, "mps", round = TRUE)
#' foco$ftps <- knots.to.speed(foco$knots, "ftps", round = TRUE)
#' foco$kmph <- knots.to.speed(foco$knots, "kmph", round = TRUE)
#' foco
#'
#' @export

knots.to.speed <-
        function(knots, unit, round = TRUE, y = 1)
        {
                if(unit == "mph" & round ==TRUE){
                        mph = round(knots * 1.1507794, y)
                        return(mph)
                } else if(unit == "mps" & round == TRUE){
                        mps = round(knots * 0.5144444, y)
                        return(mps)
                } else if(unit == "ftps" & round == TRUE){
                        ftps = round(knots * 1.6878099, y)
                        return(ftps)
                } else if(unit == "kmph" & round == TRUE){
                        kmph = round(knots * 1.85325, y)
                        return(kmph)
                } else if(unit == "mph" & round == FALSE){
                        mph = knots * 1.1507794
                        return(mph)
                } else if(unit == "mps" & round == FALSE){
                        mps = knots * 0.5144444
                        return(mps)
                } else if(unit == "ftps" & round == FALSE){
                        ftps = knots * 1.6878099
                        return(ftps)
                } else if(unit == "kmph" & round == FALSE){
                        kmph = knots * 1.85325
                        return(kmph)
                } else{
                        stop("Unit must be one of the specified units for wind
                             speed")
                }
        }

