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
