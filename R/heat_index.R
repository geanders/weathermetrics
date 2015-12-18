heat.index <-
        function (t = NA, dp = c(), rh = c(), temperature.metric = "fahrenheit",
                  output.metric = NULL, round = 0)
        {
                if(length(output.metric) == 0){
                        output.metric <- temperature.metric
                }
                if (length(dp) == 0 & length(rh) == 0) {
                        stop("You must give values for either dew point temperature ('dp') or relative humidity ('rh').")
                }
                else if (length(dp) > 0 & length(rh) > 0) {
                        stop("You can give values for either dew point temperature ('dp') or relative humidity ('rh'), but you cannot specify both to this function.")
                }
                if (length(dp) != length(t) & length(rh) != length(t)) {
                        stop("The vectors for temperature ('t') and moisture (either relative humidity, 'rh', or dew point temperature, 'dp') must be the same length.")
                }
                if (length(dp) > length(rh)) {
                        rh <- dewpoint.to.humidity(t = t, dp = dp, temperature.metric = temperature.metric)
                }
                else if (length(rh[!is.na(rh) & (rh > 100 | rh < 0)]) > 0) {
                        rh[!is.na(rh) & (rh > 100 | rh < 0)] <- NA
                        warning("There were observations with an impossible values for relative humidity (below 0% or above 100%). For these observations, heat index was set to NA.")
                }
                if (temperature.metric == "celsius") {
                        t <- celsius.to.fahrenheit(t)
                }
                hi <- mapply(heat.index.algorithm, t = t, rh = rh)
                if (output.metric == "celsius") {
                        hi <- fahrenheit.to.celsius(hi)
                }
                hi <- round(hi, digits = round)
                return(hi)
        }

heat.index.algorithm <-
        function (t = NA, rh = NA)
        {
                if (is.na(rh) | is.na(t)) {
                        hi <- NA
                } else if (t <= 40) {
                        hi <- t
                } else {
                        alpha <- 61 + ((t - 68) * 1.2) + (rh * 0.094)
                        hi <- 0.5*(alpha + t)
                        if (hi > 79) {
                                hi <- -42.379 + 2.04901523 * t + 10.14333127 * rh -
                                        0.22475541 * t * rh - 6.83783 * 10^-3 * t^2 -
                                        5.481717 * 10^-2 * rh^2 + 1.22874 * 10^-3 * t^2 *
                                        rh + 8.5282 * 10^-4 * t * rh^2 - 1.99 * 10^-6 *
                                        t^2 * rh^2
                                if (rh <= 13 & t >= 80 & t <= 112) {
                                        adjustment1 <- (13 - rh)/4
                                        adjustment2 <- sqrt((17 - abs(t - 95))/17)
                                        total.adjustment <- adjustment1 * adjustment2
                                        hi <- hi - total.adjustment
                                } else if (rh > 85 & t >= 80 & t <= 87) {
                                        adjustment1 <- (rh - 85)/10
                                        adjustment2 <- (87 - t)/5
                                        total.adjustment <- adjustment1 * adjustment2
                                        hi <- hi + total.adjustment
                                }
                        }
                }
                return(hi)
        }
