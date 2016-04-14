#' Convert between standard units of measure for wind speed
#'
#' \code{wind_speed} creates a numeric vector of speed in a specified unit of
#'    speed measurement from a numeric vector of speed in knots or a specified
#'    unit including miles per hour, meters per second, feet per second, or
#'    kilometers per hour.
#'
#' @param df Numeric vector of wind speeds
#' @param unit Character specifying the speed unit to convert from to knots, or
#'        convert to from knots.
#'   Possible values are:
#'     \itemize{
#'       \item \code{mph}: Miles per hour
#'       \item \code{mps}: Meters per second
#'       \item \code{ftps}: Feet per second
#'       \item \code{kmph}: Kilometers per hour
#'     }
#' @param to.knots Variable indicating whether values should be converted to, or
#'     from knots. Possible values are \code{TRUE} or \code{FALSE}. A value of
#'     \code{TRUE} indicates values designated by \code{df} should be converted
#'     to knots from the speed unit identified by \code{unit}. A value of
#'     \code{FALSE} indicates values designated by \code{df} should be converted
#'     from knots to the speed unit identified by \code{unit}.
#' @param round Variable indicating whether or not to round results. Possible
#'     values are \code{TRUE} or \code{FALSE}. Default value is \code{TRUE}.
#'     Values are rounded to 1 decimal place.
#'
#' @return A numeric vector of speeds (in knots, mph, mps, ftps, or kmph)
#'
#' @details The numeric vector specified for df must be in the unit knots, or
#'   as a character specified by \code{unit}.
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
#' @references
#'\url{http://www.srh.noaa.gov/epz/?n=wxcalc_windconvert}
#'
#' @examples
#' data(beijing)
#' beijing$knots <- wind_speed(beijing$kmph,
#'                      unit = "kmph",
#'                      to.knots = TRUE,
#'                      round = TRUE)
#' beijing
#' data(foco)
#' foco$mph <- wind_speed(foco$knots,
#'                       unit = "mph",
#'                       to.knots = FALSE,
#'                       round = TRUE)
#' foco
#' @export
wind_speed <-
        function(df, unit, to.knots = TRUE, round = TRUE)
        {
                if(length(df[df < 0])){
                        df[df < 0] <- NA
                        warning("For some observations, wind speed was a negative value. Since wind speed cannot have a negative value, wind speed for these observations were set to 'NA'.")
                }
                if(unit == "mph" & to.knots == TRUE & round == TRUE){
                        knots = df * 0.8689762
                        return(round(knots, 1))
                } else if(unit == "mps" & to.knots == TRUE & round == TRUE){
                        knots = df * 1.9438445
                        return(round(knots, 1))
                } else if(unit == "ftps" & to.knots == TRUE & round == TRUE){
                        knots = df * 0.5924838
                        return(round(knots, 1))
                } else if(unit == "kmph" & to.knots == TRUE & round == TRUE){
                        knots = df * 0.539593
                        return(round(knots, 1))
                } else if(unit == "mph" & to.knots == TRUE & round == FALSE){
                        knots = df * 0.8689762
                        return(knots)
                } else if(unit == "mps" & to.knots == TRUE & round == FALSE){
                        knots = df * 1.9438445
                        return(knots)
                } else if(unit == "ftps" & to.knots == TRUE & round == FALSE){
                        knots = df * 0.5924838
                        return(knots)
                } else if(unit == "kmph" & to.knots == TRUE & round == FALSE){
                        knots = df * 0.539593
                        return(knots)
                } else if(unit == "mph" & to.knots == FALSE & round ==TRUE){
                        mph = round(df * 1.1507794, 1)
                        return(mph)
                } else if(unit == "mps" & to.knots == FALSE & round == TRUE){
                        mps = round(df * 0.5144444, 1)
                        return(mps)
                } else if(unit == "ftps" & to.knots == FALSE & round == TRUE){
                        ftps = round(df * 1.6878099, 1)
                        return(ftps)
                } else if(unit == "kmph" & to.knots == FALSE & round == TRUE){
                        kmph = round(knots * 1.85325, 1)
                        return(kmph)
                } else if(unit == "mph" & to.knots == FALSE & round == FALSE){
                        mph = df * 1.1507794
                        return(mph)
                } else if(unit == "mps" & to.knots == FALSE & round == FALSE){
                        mps = df * 0.5144444
                        return(mps)
                } else if(unit == "ftps" & to.knots == FALSE & round == FALSE){
                        ftps = df * 1.6878099
                        return(ftps)
                } else if(unit == "kmph" & to.knots == FALSE & round == FALSE){
                        kmph = df * 1.85325
                        return(kmph)
                } else{
                        stop("Unit must be one of the specified units for wind
                             speed")
                }
        }
