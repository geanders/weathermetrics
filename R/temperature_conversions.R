#' Convert from Celsius to Fahrenheit.
#'
#' \code{celsius.to.fahrenheit} creates a vector of temperatures in
#'    Fahrenheit from a vector of temperatures in Celsius.
#'
#' @param T.celsius Numeric vector of temperatures in Celsius.
#' @param round Integer indicating the number of decimal places to
#'     round converted value.
#'
#' @return A vector of temperature values in Fahrenheit.
#'
#' @note Equations are from the source code for the US National Weather
#'     Service's
#'     \href{http://www.wpc.ncep.noaa.gov/html/heatindex.shtml}{online heat index calculator}.
#' @seealso \code{\link{fahrenheit.to.celsius}}
#'
celsius.to.fahrenheit <-
        function (T.celsius, round = 2)
        {
                T.fahrenheit <- (9/5) * T.celsius + 32
                T.fahrenheit <- round(T.fahrenheit, digits = round)
                return(T.fahrenheit)
        }

#' Convert from Fahrenheit to Celsius.
#'
#' \code{fahrenheit.to.celsius} creates a vector of temperatures in
#'    Celsius from a vector of temperatures in Fahrenheit.
#'
#' @param T.fahrenheit Numeric vector of temperatures in Fahrenheit.
#' @param round Integer indicating the number of decimal places to
#'     round converted value.
#'
#' @return A vector of temperature values in Celsius.
#'
#' @note Equations are from the source code for the US National Weather
#'     Service's
#'     \href{http://www.wpc.ncep.noaa.gov/html/heatindex.shtml}{online heat index calculator}.
#' @seealso \code{\link{celsius.to.fahrenheit}}
#'
fahrenheit.to.celsius <-
        function (T.fahrenheit, round = 2)
        {
                T.celsius <- (5/9) * (T.fahrenheit - 32)
                T.celsius <- round(T.celsius, digits = round)
                return(T.celsius)
        }
