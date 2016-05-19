#' Convert between precipitation metrics
#'
#' This function allows you to convert among the following precipitation metrics:
#' inches, millimeters, and centimeters.
#'
#' @param precip A numerical vector of precipitation to be converted.
#' @param old_metric The metric from which you want to convert. Possible options
#' are:
#' \itemize{
#'       \item \code{inches}: Inches
#'       \item \code{mm}: Millimeters
#'       \item \code{cm}: Centimeters
#' }
#' @inheritParams convert_temperature
#'
#' @return A numeric vector with precipitation converted to the metric specified
#'    by the argument \code{new_metric}.
#'
#' @author
#' Joshua Ferreri \email{joshua.m.ferreri@@gmail.com},
#' Brooke Anderson \email{brooke.anderson@@colostate.edu}
#'
#' @examples
#'
#' data(breck)
#' breck$Precip.mm <- convert_precip(breck$Precip.in,
#'    old_metric = "inches", new_metric = "mm", round = 2)
#' breck
#'
#' data(loveland)
#' loveland$Precip.in <- convert_precip(loveland$Precip.mm,
#'    old_metric = "mm", new_metric = "inches", round = NULL)
#' loveland$Precip.cm <- convert_precip(loveland$Precip.mm,
#'    old_metric = "mm", new_metric = "cm", round = 3)
#' loveland
#' @export
convert_precip <- function(precip, old_metric, new_metric, round = 2){
        if(length(precip[precip < 0])){
                precip[precip < 0] <- NA
                warning(paste("Some of the observations in the data gave",
                              "negative precipitation. Since precipitation",
                              "cannot have a negative value, these",
                              "observations were set to 'NA'."))
        }
        if(old_metric == new_metric){
                stop("`old_metric` and `new_metric` must be different.")
        }
        if(old_metric == "inches"){
                out <- inches_to_metric(precip, unit = new_metric, round = round)
        } else if (new_metric == "inches"){
                out <- metric_to_inches(precip, unit.from = old_metric, round = round)
        } else {
                mid <- metric_to_inches(precip, unit.from = old_metric, round = NULL)
                out <- inches_to_metric(mid, unit = new_metric, round = round)
        }
        return(out)
}

#' Convert from inches to standard metric units of measure for precipitation
#'
#' \code{inches_to_metric} creates a numeric vector of precipitation in
#'   common metric units (millimeters or centimeters) from a numeric vector of
#'   precipitation in inches.
#'
#' @param inches Numeric vector of precipitation (in inches)
#' @param unit Character specifying the metric precipitation unit besides inches.
#'   Possible values are:
#'     \itemize{
#'       \item \code{mm}: Millimeters
#'       \item \code{cm}: Centimeters
#'     }
#' @inheritParams convert_temperature
#'
#' @return A numeric vector of precipitation (in specified metric unit)
#'
#' @note Equations are from the source code for the National Weather Service
#'    Forecast Office \url{http://www.srh.noaa.gov/ama/?n=conversions}
#'
#' @author
#' Joshua Ferreri \email{joshua.m.ferreri@@gmail.com},
#' Brooke Anderson \email{brooke.anderson@@colostate.edu}
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
#'                                     round = 2)
#' breck
#'
#' @export
inches_to_metric <- function(inches, unit, round = 2) {
                if(length(inches[inches < 0])){
                        inches[inches < 0] <- NA
                        warning(paste("Some of the observations in the data gave",
                                "negative precipitation. Since precipitation",
                                "cannot have a negative value, these",
                                "observations were set to 'NA'."))
                }
                if(unit == "mm"){
                        metric <- inches * 25.4
                } else if(unit == "cm"){
                        metric <- inches * 2.54
                } else{
                        stop("`unit` must be `mm` or `cm`")
                }
        if(!is.null(round)){
                metric <- round(metric, digits = round)
        }
        return(metric)
}

#' Convert between standard metric units of measure for precipitation to inches
#'
#' \code{metric_to_inches} creates a numeric vector of precipitation measures in
#'   inches from a numeric vector of precipitation in common metric units
#'   (millimeters or centimeters).
#'
#' @param metric Numeric vector of precipitation (in millimeters or centimeters)
#' @param unit.from A character string with the current units of the
#'    observations (i.e., the units from which you want to convert)
#' @inheritParams inches_to_metric
#' @inheritParams convert_temperature
#'
#' @return A numeric vector of precipitation in inches.
#'
#' @note Equations are from the source code for the National Weather Service
#'    Forecast Office \url{http://www.srh.noaa.gov/ama/?n=conversions}
#'
#' @author
#' Joshua Ferreri \email{joshua.m.ferreri@@gmail.com},
#' Brooke Anderson \email{brooke.anderson@@colostate.edu}
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
#'                                        round = 2)
#' loveland
#'
#' @export
metric_to_inches <- function(metric, unit.from, round = 2) {
                if(length(metric[metric < 0])){
                        metric[metric < 0] <- NA
                        warning(paste("Some of the observations in the data gave",
                                "negative precipitation. Since precipitation",
                                "cannot have a negative value, these",
                                "observations were set to 'NA'."))
                }
                if(unit.from == "mm"){
                        inches <- metric / 25.4
                } else if(unit.from == "cm"){
                        inches <- metric / 2.54
                } else{
                        stop("`unit.from` must be `mm` or `cm`")
                }
        if(!is.null(round)){
                inches <- round(inches, digits = round)
        }
        return(inches)
}
