#' Convert from inches to standard metric units of measure for precipitation
#'
#' \code{inches_to_metric} creates a numeric vector of precipitation in
#'   common metric units (millimeters or centimeters) from a numeric vector of
#'   precipitation in inches.
#'
#' @param inches Numeric vector of precipitation (in inches)
#' @param unit Character specifying the metric precipitation unit to convert to
#'   from inches.
#'   Possible values are:
#'     \itemize{
#'       \item \code{mm}: Millimeters
#'       \item \code{cm}: Centimeters
#'     }
#' @param round Variable indicating whether or not to round results.
#'     Possible values are \code{TRUE} or \code{FALSE}. Default value is
#'     \code{TRUE}. If \code{TRUE}, then the value will be rounded 2 spaces.
#'
#' @return A numeric vector of precipitation (in specified metric unit)
#'
#' @details The numeric vector specified for unit must be in the units provided
#'    as a character specified by unit.
#'
#' @note Equations are from the source code for the National Weather Service
#'    Forecast Office \url{http://www.srh.noaa.gov/ama/?n=conversions}
#'
#' @author
#' Brooke Anderson \email{brooke.anderson@@colostate.edu},
#' Joshua Ferreri \email{joshua.m.ferreri@@gmail.com}
#'
#' @seealso \code{\link{metric_to_inches}}
#'
#' @references
#'\url{http://www.srh.noaa.gov/ama/?n=conversions}
#'
#' @examples
#' data(breck)
#' breck$Precip.mm <- inches_to_metric(breck$Precip.in,
#'                                     unit = "mm",
#'                                     round = TRUE)
#' breck
#'
#' @export
inches_to_metric <-
        function(inches, unit, round = TRUE)
        {
                if(length(inches[inches < 0])){
                        inches[inches < 0] <- NA
                        warning("For some observations, precipitation was a negative value. Since precipitation cannot have a negative value, precipitation for these observations were set to 'NA'.")
                }
                if(unit == "mm" & round == TRUE){
                        mm <- inches * 25.4
                        return(round(mm, 2))
                } else if(unit == "cm" & round == TRUE){
                        cm <- inches * 2.54
                        return(round(cm, 2))
                } else if(unit == "mm" & round == FALSE){
                        mm <- inches * 25.4
                        return(mm)
                } else if(unit == "cm" & round == FALSE){
                        cm <- inches * 2.54
                        return(cm)
                } else{
                        stop("unit must be in mm or cm")
                }
        }

#' Convert between standard metric units of measure for precipitation to inches
#'
#' \code{metric_to_inches} creates a numeric vector of precipitation measures in
#'   inches from a numeric vector of precipitation in common metric units
#'   (millimeters or centimeters).
#'
#' @param metric Numeric vector of precipitation (in millimeters or centimeters)
#' @param unit.from Character specifying the metric precipitation unit convert
#'   from to inches.
#'   Possible values are:
#'     \itemize{
#'       \item \code{mm}: Millimeters
#'       \item \code{cm}: Centimeters
#'     }
#' @param round Variable indicating whether or not to round results.
#'     Possible values are \code{TRUE} or \code{FALSE}. Default value is
#'     \code{TRUE}. If \code{TRUE}, then the value will be rounded 2 spaces.
#'
#' @return A numeric vector of precipitation in inches.
#'
#' @details The numeric vector specified for unit.from must be in the units
#'    provided as a character specified by unit.from.
#'
#' @note Equations are from the source code for the National Weather Service
#'    Forecast Office \url{http://www.srh.noaa.gov/ama/?n=conversions}
#'
#' @author
#' Brooke Anderson \email{brooke.anderson@@colostate.edu},
#' Joshua Ferreri \email{joshua.m.ferreri@@gmail.com}
#'
#' @seealso \code{\link{inches_to_metric}}
#'
#' @references
#'\url{http://www.srh.noaa.gov/ama/?n=conversions}
#'
#' @examples
#' data(loveland)
#' loveland$Precip.in <- metric_to_inches(loveland$Precip.mm,
#'                                        unit.from = "mm",
#'                                        round = TRUE)
#' loveland
#'
#' @export
metric_to_inches <-
        function(metric, unit.from, round = TRUE)
        {
                if(length(metric[metric < 0])){
                        metric[metric < 0] <- NA
                        warning("For some observations, precipitation was a negative value. Since precipitation cannot have a negative value, precipitation for these observations were set to 'NA'.")
                }
                if(unit.from == "mm" & round == TRUE){
                        inches <- metric / 25.4
                        return(round(inches, 2))
                } else if(unit.from == "cm" & round == TRUE){
                        inches <- metric / 2.54
                        return(round(inches, 2))
                } else if(unit.from == "mm" & round == FALSE){
                        inches <- metric / 25.4
                        return(inches)
                } else if(unit.from == "cm" & round == FALSE){
                        inches <- metric / 2.54
                        return(inches)
                } else{
                        stop("unit.from must be in mm or cm")
                }
        }
