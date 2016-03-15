#' Convert from Celsius to Fahrenheit.
#'
#' \code{celsius.to.fahrenheit} creates a numeric vector of temperatures in
#'    Fahrenheit from a numeric vector of temperatures in Celsius.
#'
#' @param T.celsius Numeric vector of temperatures in Celsius.
#' @param round Integer indicating the number of decimal places to
#'     round converted value.
#'
#' @return A numeric vector of temperature values in Fahrenheit.
#'
#' @note Equations are from the source code for the US National Weather
#'     Service's
#'     \href{http://www.wpc.ncep.noaa.gov/html/heatindex.shtml}{online heat index calculator}.
#'
#' @author
#' Brooke Anderson \email{brooke.anderson@@colostate.edu},
#' Roger Peng \email{rdpeng@@gmail.com}
#'
#' @seealso \code{\link{fahrenheit.to.celsius}}
#'
#' @examples # Convert from Celsius to Fahrenheit.
#' data(lyon)
#' lyon$TemperatureF <- celsius.to.fahrenheit(lyon$TemperatureC)
#' lyon
#'
#' @export
celsius.to.fahrenheit <-
        function (T.celsius, round = 2)
        {
                T.fahrenheit <- (9/5) * T.celsius + 32
                T.fahrenheit <- round(T.fahrenheit, digits = round)
                return(T.fahrenheit)
        }

#' Convert from Fahrenheit to Celsius.
#'
#' \code{fahrenheit.to.celsius} creates a numeric vector of temperatures in
#'    Celsius from a numeric vector of temperatures in Fahrenheit.
#'
#' @param T.fahrenheit Numeric vector of temperatures in Fahrenheit.
#' @param round Integer indicating the number of decimal places to
#'     round converted value.
#'
#' @return A numeric vector of temperature values in Celsius.
#'
#' @note Equations are from the source code for the US National Weather
#'     Service's
#'     \href{http://www.wpc.ncep.noaa.gov/html/heatindex.shtml}{online heat index calculator}.
#'
#' @author
#' Brooke Anderson \email{brooke.anderson@@colostate.edu},
#' Roger Peng \email{rdpeng@@gmail.com}
#'
#' @seealso \code{\link{celsius.to.fahrenheit}}
#'
#' @examples # Convert from Fahrenheit to Celsius.
#' data(norfolk)
#' norfolk$TempC <- fahrenheit.to.celsius(norfolk$TemperatureF)
#' norfolk
#'
#' @export
fahrenheit.to.celsius <-
        function (T.fahrenheit, round = 2)
        {
                T.celsius <- (5/9) * (T.fahrenheit - 32)
                T.celsius <- round(T.celsius, digits = round)
                return(T.celsius)
        }

#' Convert from Celsius to Kelvin.
#'
#' \code{celsius.to.kelvin} creates a numeric vector of temperatures in
#'    Kelvin from a numeric vector of temperatures in Celsius.
#'
#' @param T.celsius Numeric vector of temperatures in Celsius.
#' @param round Integer indicating the number of decimal places to
#'     round converted value.
#'
#' @return A numeric vector of temperature values in Kelvin.
#'
#' @note Equations are from the source code for the National Oceanic and
#'      Atmospheric Association's
#'     \href{http://www.srh.noaa.gov/epz/?n=wxcalc_tempconvert}{online
#'     temperature converter}.
#'
#' @author
#' Brooke Anderson \email{brooke.anderson@@colostate.edu},
#' Joshua Ferreri \email{joshua.m.ferreri@@gmail.com}
#'
#' @seealso \code{\link{kelvin.to.celsius}}
#'
#' @examples # Convert from Celsius to Kelvin.
#' data(lyon)
#' lyon$TemperatureK <- celsius.to.kelvin(lyon$TemperatureC)
#' lyon
#'
#' @export
celsius.to.kelvin <-
        function (T.celsius, round = 2)
        {
                T.kelvin <- T.celsius + 273.15
                T.kelvin <- round(T.kelvin, digits = round)
                return(T.kelvin)
        }

#' Convert from Kelvin to Celsius.
#'
#' \code{kelvin.to.celsius} creates a numeric vector of temperatures in
#'    Celsius from a numeric vector of temperatures in Kelvin.
#'
#' @param T.kelvin Numeric vector of temperatures in Kelvin.
#' @param round Integer indicating the number of decimal places to
#'     round converted value.
#'
#' @return A numeric vector of temperature values in Celsius.
#'
#' @note Equations are from the source code for the National Oceanic and
#'      Atmospheric Association's
#'     \href{http://www.srh.noaa.gov/epz/?n=wxcalc_tempconvert}{online
#'     temperature converter}.
#'
#' @author
#' Brooke Anderson \email{brooke.anderson@@colostate.edu},
#' Joshua Ferreri \email{joshua.m.ferreri@@gmail.com}
#'
#' @seealso \code{\link{celsius.to.kelvin}}
#'
#' @examples # Convert from Kelvin to Celsius.
#' data(angeles)
#' angeles$TemperatureC <- kelvin.to.celsius(angeles$TemperatureK)
#' angeles
#'
#' @export
kelvin.to.celsius <-
        function (T.kelvin, round = 2)
        {
                T.celsius <- T.kelvin - 273.15
                T.celsius <- round(T.celsius, digits = round)
                return(T.celsius)
        }

#' Convert from Fahrenheit to Kelvin.
#'
#' \code{fahrenheit.to.kelvin} creates a numeric vector of temperatures in
#'    Kelvin from a numeric vector of temperatures in Fahrenheit.
#'
#' @param T.fahrenheit Numeric vector of temperatures in Fahrenheit.
#' @param round Integer indicating the number of decimal places to
#'     round converted value.
#'
#' @return A numeric vector of temperature values in Kelvin.
#'
#' @note Equations are from the source code for the National Oceanic and
#'      Atmospheric Association's
#'     \href{http://www.srh.noaa.gov/epz/?n=wxcalc_tempconvert}{online
#'     temperature converter}.
#'
#' @author
#' Brooke Anderson \email{brooke.anderson@@colostate.edu},
#' Joshua Ferreri \email{joshua.m.ferreri@@gmail.com}
#'
#' @seealso \code{\link{kelvin.to.fahrenheit}}
#'
#' @examples # Convert from Fahrenheit to Kelvin.
#' data(norfolk)
#' norfolk$TempuratureK <- fahrenheit.to.kelvin(norfolk$TemperatureF)
#' norfolk
#'
#' @export
fahrenheit.to.kelvin <-
        function (T.fahrenheit, round = 2)
        {
                T.kelvin <- (.5556 * (T.fahrenheit - 32)) + 273.15
                T.kelvin <- round(T.kelvin, digits = round)
                return(T.kelvin)
        }

#' Convert from Kelvin to Fahrenheit.
#'
#' \code{kelvin.to.fahrenheit} creates a numeric vector of temperatures in
#'    Fahrenheit from a numeric vector of temperatures in Kelvin.
#'
#' @param T.kelvin Numeric vector of temperatures in Kelvin.
#' @param round Integer indicating the number of decimal places to
#'     round converted value.
#'
#' @return A numeric vector of temperature values in Fahrenheit.
#'
#' @note Equations are from the source code for the National Oceanic and
#'      Atmospheric Association's
#'     \href{http://www.srh.noaa.gov/epz/?n=wxcalc_tempconvert}{online
#'     temperature converter}.
#'
#' @author
#' Brooke Anderson \email{brooke.anderson@@colostate.edu},
#' Joshua Ferreri \email{joshua.m.ferreri@@gmail.com}
#'
#' @seealso \code{\link{fahrenheit.to.kelvin}}
#'
#' @examples # Convert from Kelvin to Fahrenheit.
#' data(angeles)
#' angeles$TemperatureF <- kelvin.to.fahrenheit(angeles$TemperatureK)
#' angeles
#'
#' @export
kelvin.to.fahrenheit <-
        function (T.kelvin, round = 2)
        {
                T.fahrenheit <- (1.8 * (T.kelvin - 273.15)) + 32
                T.fahrenheit <- round(T.fahrenheit, digits = round)
                return(T.fahrenheit)
        }
