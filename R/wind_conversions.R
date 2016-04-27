#' Convert between wind speed metrics
#'
#' This function allows you to convert among the following wind speed metrics:
#' knots,  miles per hour, meters per second, feet per second, and kilometers per
#' hour.
#'
#' @param wind_speed A numerical vector of wind speeds to be converted.
#' @param old_metric The metric from which you want to convert. Possible options
#' are:
#' \itemize{
#'       \item \code{knots}: Knots
#'       \item \code{mph}: Miles per hour
#'       \item \code{mps}: Meters per second
#'       \item \code{ftps}: Feet per second
#'       \item \code{kmph}: Kilometers per hour
#' }
#' @inheritParams convert_temperature
#'
#' @return A numeric vector with wind speed converted to the metric specified
#'    by the argument \code{new_metric}.
#'
#' @author
#' Brooke Anderson \email{brooke.anderson@@colostate.edu},
#' Joshua Ferreri \email{joshua.m.ferreri@@gmail.com}
#'
#' @examples
#'
#' data(beijing)
#' beijing$knots <- convert_wind_speed(beijing$kmph,
#'    old_metric = "kmph", new_metric = "knots")
#' beijing
#'
#' data(foco)
#' foco$mph <- convert_wind_speed(foco$knots, old_metric = "knots",
#'    new_metric = "mph", round = 0)
#' foco$mph <- convert_wind_speed(foco$knots, old_metric = "knots",
#'    new_metric = "mps", round = NULL)
#' foco$kmph <- convert_wind_speed(foco$mph, old_metric = "mph",
#'    new_metric = "kmph")
#' foco
#'
#' @export
convert_wind_speed <- function(wind_speed, old_metric, new_metric, round = 1){
        if(length(wind_speed[wind_speed < 0])){
                wind_speed[wind_speed < 0] <- NA
                warning(paste("Some of the observations in the data gave",
                              "negative wind speeds. Since wind speed",
                              "cannot have a negative value, these",
                              "observations were set to 'NA'."))
        }
        if(old_metric == new_metric){
                stop("`old_metric` and `new_metric` must be different.")
        }
        if(old_metric == "knots"){
                out <- knots_to_speed(wind_speed, unit = new_metric, round = round)
        } else if (new_metric == "knots"){
                out <- speed_to_knots(wind_speed, unit = old_metric, round = round)
        } else {
                mid <- speed_to_knots(wind_speed, unit = old_metric, round = NULL)
                out <- knots_to_speed(mid, unit = new_metric, round = round)
        }
        return(out)
}

#' Convert between standard units of measure for wind speed
#'
#' \code{speed_to_knots} creates a numeric vector of speed in knots from a
#'   numeric vector of speed in the specified unit.
#'
#' @param x Numeric vector of wind speeds, in units specified by \code{unit}
#' @param unit Character specifying the speed unit other than knots.
#'   Possible values are:
#'     \itemize{
#'       \item \code{mph}: Miles per hour
#'       \item \code{mps}: Meters per second
#'       \item \code{ftps}: Feet per second
#'       \item \code{kmph}: Kilometers per hour
#'     }
#' @inheritParams convert_temperature
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
#' beijing$knots <- speed_to_knots(beijing$kmph, unit = "kmph", round = 2)
#' beijing
#'
#' @export
speed_to_knots <- function(x, unit, round = 1) {
                if(length(x[x < 0])){
                        x[x < 0] <- NA
                        warning(paste("Some of the observations in the data gave",
                                "negative wind speeds. Since wind speed",
                                "cannot have a negative value, these",
                                "observations were set to 'NA'."))
                }
                if(unit == "mph"){
                        knots <- x * 0.8689762
                } else if(unit == "mps"){
                        knots <- x * 1.9438445
                } else if(unit == "ftps"){
                        knots = x * 0.5924838
                } else if(unit == "kmph"){
                        knots = x * 0.539593
                } else {
                        stop("Unit must be one of the specified units for wind
                             speed")
                }
        if(!is.null(round)){
                knots <- round(knots, digits = round)
        }
        return(knots)
}

#' Convert from knots to standard units of wind speed
#'
#' \code{knots_to_speed} creates a numeric vector of speed, in units
#'    specified by \code{unit}, from a numeric vector of speed in knots.
#'
#' @param knots Numeric vector of speeds in knots
#' @inheritParams speed_to_knots
#' @inheritParams convert_temperature
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
#' foco$mph <- knots_to_speed(foco$knots, unit = "mph", round = 0)
#' foco$mps <- knots_to_speed(foco$knots, unit = "mps", round = NULL)
#' foco$ftps <- knots_to_speed(foco$knots, unit = "ftps")
#' foco$kmph <- knots_to_speed(foco$knots, unit = "kmph")
#' foco
#'
#' @export

knots_to_speed <- function(knots, unit, round = 1) {
                if(length(knots[knots < 0])){
                        knots[knots < 0] <- NA
                        warning(paste("Some of the observations in the data gave",
                                "negative wind speeds. Since wind speed",
                                "cannot have a negative value, these",
                                "observations were set to 'NA'."))
                }
                if(unit == "mph"){
                        x <- knots * 1.1507794
                } else if(unit == "mps"){
                        x <- knots * 0.5144444
                } else if(unit == "ftps"){
                        x <- knots * 1.6878099
                } else if(unit == "kmph"){
                        x <- knots * 1.85325
                } else{
                        stop("Unit must be one of the specified units for wind
                             speed")
                }
        if(!is.null(round)){
                x <- round(x, digits = round)
        }
        return(x)
}


