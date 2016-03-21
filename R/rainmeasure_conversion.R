#' Convert from inches to standard metric units of measure for precipitation
#'
#' \code{inches.to.metric} creates a numeric vector of precipitation in
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
#' @param round.out Variable indicating whether or not to round results.
#'     Possible values are TRUE or FALSE. Default value is TRUE.
#' @param round Integer indicating the number of decimal places to
#'     round converted value. Default value is 1.
#'
#' @return A numeric vector of precipitation (in specified metric unit)
#'
#' @details The numeric vector specified for unit must be in the units provided
#'    as a character specified by unit.
#'
#' @note Equations are from the source code for the National Weather Service
#'    Forecast Office \href{http://www.srh.noaa.gov/ama/?n=conversions}
#'
#' @author
#' Brooke Anderson \email{brooke.anderson@@colostate.edu},
#' Joshua Ferreri \email{joshua.m.ferreri@@gmail.com}
#'
#' @seealso \code{\link{metric.to.inches}}
#'
#' @references
#'\url{http://www.srh.noaa.gov/ama/?n=conversions}
#'
#' @examples
#' data(breck)
#' breck$Precip.mm <- inches.to.metric(breck$Precip.in,
#'                                     unit = "mm",
#'                                     round.out = TRUE,
#'                                     2)
#' breck
#'
#' @export
inches.to.metric <-
        function(inches, unit, round.out = TRUE, round = 2)
        {
                if(unit == "mm" & round.out == TRUE){
                        mm <- inches * 25.4
                        return(round(mm, round))
                } else if(unit == "cm" & round.out == TRUE){
                        cm <- inches * 2.54
                        return(round(cm, round))
                } else if(unit == "mm" & round.out == FALSE){
                        mm <- inches * 25.4
                        return(mm)
                } else if(unit == "cm" & round.out == FALSE){
                        cm <- inches * 2.54
                        return(cm)
                } else{
                        stop("unit must be in mm or cm")
                }
        }

#' Convert between standard metric units of measure for precipitation to inches
#'
#' \code{metric.to.inches} creates a numeric vector of precipitation measures in
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
#' @param round.out Variable indicating whether or not to round results.
#'     Possible values are TRUE or FALSE. Default value is TRUE.
#' @param round Integer indicating the number of decimal places to
#'     round converted value. Default value is 1.
#'
#' @return A numeric vector of precipitation in inches.
#'
#' @details The numeric vector specified for unit.from must be in the units
#'    provided as a character specified by unit.from.
#'
#' @note Equations are from the source code for the National Weather Service
#'    Forecast Office \href{http://www.srh.noaa.gov/ama/?n=conversions}
#'
#' @author
#' Brooke Anderson \email{brooke.anderson@@colostate.edu},
#' Joshua Ferreri \email{joshua.m.ferreri@@gmail.com}
#'
#' @seealso \code{\link{inches.to.metric}}
#'
#' @references
#'\url{http://www.srh.noaa.gov/ama/?n=conversions}
#'
#' @examples

#'
#' @export
metric.to.inches <-
        function(metric, unit.from, round.out = TRUE, round = 2)
        {
                if(unit.from == "mm" & round.out == TRUE){
                        inches <- metric / 25.4
                        return(round(inches, round))
                } else if(unit.from == "cm" & round.out == TRUE){
                        inches <- metric / 2.54
                        return(round(inches, round))
                } else if(unit.from == "mm" & round.out == FALSE){
                        inches <- metric / 25.4
                        return(inches)
                } else if(unit == "cm" & round.out == FALSE){
                        inches <- metric / 2.54
                        return(inches)
                } else{
                        stop("unit.from must be in mm or cm")
                }
        }
