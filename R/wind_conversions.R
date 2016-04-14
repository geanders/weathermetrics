#' Convert between standard units of measure for wind speed
#'
#' \code{speed_to_knots} creates a numeric vector of speed in knots from a
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
#' @param round.out Variable with the indicating whether or not to round results.
#'     Possible values are TRUE or FALSE. Default value is TRUE.
#' @param round Integer indicating the number of decimal places to
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
#' @seealso \code{\link{knots_to_speed}}
#'
#' @references
#'\url{http://www.srh.noaa.gov/epz/?n=wxcalc_windconvert}
#'
#' @examples
#' data(beijing)
#' beijing$knots <- speed_to_knots(beijing$kmph, "kmph", round.out = TRUE)
#' beijing
#'
#' @export
speed_to_knots <-
        function(x, unit, round.out = TRUE, round = 1)
        {
                if(x < 0){
                        knots = NA
                        warning("For some observations, wind speed was a negative value. Since wind speed cannot have a negative value, wind speed for these observations were set to 'NA'.")
                }
                if(unit == "mph" & round.out == TRUE){
                        knots = x * 0.8689762
                        return(round(knots, round))
                } else if(unit == "mps" & round.out == TRUE){
                        knots = x * 1.9438445
                        return(round(knots, round))
                } else if(unit == "ftps" & round.out == TRUE){
                        knots = x * 0.5924838
                        return(round(knots, round))
                } else if(unit == "kmph" & round.out == TRUE){
                        knots = x * 0.539593
                        return(round(knots, round))
                } else if(unit == "kmph" & round.out == TRUE){
                        knots = x * 0.539593
                        return(round(knots, round))
                } else if(unit == "mph" & round.out == FALSE){
                        knots = x * 0.8689762
                        return(knots)
                } else if(unit == "mps" & round.out == FALSE){
                        knots = x * 1.9438445
                        return(knots)
                } else if(unit == "ftps" & round.out == FALSE){
                        knots = x * 0.5924838
                        return(knots)
                } else if(unit == "kmph" & round.out == FALSE){
                        knots = x * 0.539593
                        return(knots)
                } else {
                        stop("Unit must be one of the specified units for wind
                             speed")
                }
        }

#' Convert from knots to standard units of wind speed
#'
#' \code{knots_to_speed} creates a numeric vector of speed, in units
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
#' @param round.out Variable with the indicating whether or not to round results.
#'     Possible values are TRUE or FALSE. Default value is TRUE.
#' @param round Integer indicating the number of decimal places to
#'     round converted value. Default value is 1.
#'
#' @return A numeric vector of speeds (in the specified unit)
#'
#' @details Output will be in the speed units specified by \code{unit}.
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
#' @seealso \code{\link{speed_to_knots}}
#'
#' @references
#'\url{http://www.srh.noaa.gov/epz/?n=wxcalc_windconvert}
#'
#' @examples
#' data(foco)
#' foco$mph <- knots_to_speed(foco$knots, "mph", round.out = TRUE)
#' foco$mps <- knots_to_speed(foco$knots, "mps", round.out = TRUE)
#' foco$ftps <- knots_to_speed(foco$knots, "ftps", round.out = TRUE)
#' foco$kmph <- knots_to_speed(foco$knots, "kmph", round.out = TRUE)
#' foco
#'
#' @export
knots_to_speed <-
        function(knots, unit, round.out = TRUE, round = 1)
        {
                if(unit == "mph" & round.out ==TRUE){
                        mph = round(knots * 1.1507794, round)
                        return(mph)
                } else if(unit == "mps" & round.out == TRUE){
                        mps = round(knots * 0.5144444, round)
                        return(mps)
                } else if(unit == "ftps" & round.out == TRUE){
                        ftps = round(knots * 1.6878099, round)
                        return(ftps)
                } else if(unit == "kmph" & round.out == TRUE){
                        kmph = round(knots * 1.85325, round)
                        return(kmph)
                } else if(unit == "mph" & round.out == FALSE){
                        mph = knots * 1.1507794
                        return(mph)
                } else if(unit == "mps" & round.out == FALSE){
                        mps = knots * 0.5144444
                        return(mps)
                } else if(unit == "ftps" & round.out == FALSE){
                        ftps = knots * 1.6878099
                        return(ftps)
                } else if(unit == "kmph" & round.out == FALSE){
                        kmph = knots * 1.85325
                        return(kmph)
                } else{
                        stop("Unit must be one of the specified units for wind
                             speed")
                }
        }

