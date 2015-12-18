celsius.to.fahrenheit <-
        function (T.celsius, round = 2)
        {
                T.fahrenheit <- (9/5) * T.celsius + 32
                T.fahrenheit <- round(T.fahrenheit, digits = round)
                return(T.fahrenheit)
        }

fahrenheit.to.celsius <-
        function (T.fahrenheit, round = 2)
        {
                T.celsius <- (5/9) * (T.fahrenheit - 32)
                T.celsius <- round(T.celsius, digits = round)
                return(T.celsius)
        }
