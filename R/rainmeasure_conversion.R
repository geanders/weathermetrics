inches.to.metric <- funciton(inches, unit, round.out = TRUE, round = 2){
        if(unit == "mm" & round.out == TRUE){
                mm <- inches * 25.4
                return(mm, round)
        } else if(unit == "cm" & round.out == TRUE){
                cm <- inches * 2.54
                return(cm, round)
        } else if(unit == "mm" & round.out == FALSE){
                mm <- inches * 25.4
                return(mm)
        } else if(unit == "cm" & round.out == FALSE){
                cm <- inches * 2.54
                return(cm)
        }
        stop("unit must be in mm or cm")
}

metric.to.inches <- function(metric, unit.from, round.out = TRUE, round = 2){
        if(unit.from == "mm" & round.out == TRUE){
                inches <- metric / 25.4
                return(inches, round)
        } else if(unit.from == "cm" & round.out == TRUE){
                inches <- metric / 2.54
                return(inches, round)
        } else if(unit.from == "mm" & round.out == FALSE){
                inches <- metric / 25.4
                return(inches)
        } else if(unit == "cm" & round.out == FALSE){
                inches <- metric / 2.54
                return(inches)
        }
        stop("unit.from must be mm or cm")
}
