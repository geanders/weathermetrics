<!-- README.md is generated from README.Rmd. Please edit that file -->
Package contents
----------------

The `weathermetrics` package provides the following functions to calculate or convert between several weather metrics:

-   Temperature conversions:
    -   **`convert_temperature`:** A wrapper function that allows the user to convert a vector of temperatures in degrees Celsius, Fahrenheit, or Kelvins, to another temperature measure.
    -   **`celsius.to.fahrenheit`:** Convert a vector of temperatures in degrees Celsius to degrees Fahrenheit
    -   **`fahrenheit.to.celsius`:** Convert a vector of temperatures in degrees Fahrenheit to degrees Celsius
    -   **`celsius.to.kelvin`:** Convert a vector of temperatures in degrees Celsius to Kelvins
    -   **`kelvin.to.celsius`:** Convert a vector of temperatures in Kelvins to degrees Celsius
    -   **`fahrenheit.to.kelvin`:** Convert a vector of temperatures in degrees Fahrenheit to Kelvins
    -   **`kelvin.to.fahrenheit`:** Convert a vector of temperatures in Kelvins to degrees Fahrenheit
-   Air moisture conversions
    -   **`dewpoint.to.humidity`:** Calculate a vector of relative humidity values from vectors of air temperature and dew point temperature
    -   **`humidity.to.dewpoint`:** Calculate a vector of dew point temperatures from vectors of air temperature and relative humidity
-   Heat index calculation
    -   **`heat.index`:** Calculate a vector of heat index values from vectors of air temperature and either dew point temperature or relative humidity
-   Wind speed conversions
    -   **`convert_wind_speed`**: A wrapper function for wind speed conversions. Convert a vector of wind speed values between specified wind speed units
    -   **`speed_to_knots`:** Convert a vector of wind speed values to knots
    -   **`knots_to_speed`:** Convert a vector of wind speed values in knots to a specified wind speed unit
-   Precipitation conversions
    -   **`inches_to_metric`:** Convert a vector of precipitation measurements in inches to measures in metric units (millimeters or centimeters)
    -   **`metric_to_inches`:** Convert a vector of precipitation measurements in metric units to measures in inches

All algorithms for heat index and wind speed are adapted for R from the algorithms used by the United States National Weather Service's [online heat index calculator](http://www.wpc.ncep.noaa.gov/html/heatindex.shtml) (accessed December 18, 2015) and the National Oceanic and Atmospheric Administration's [online wind speed conversion](http://www.srh.noaa.gov/epz/?n=wxcalc_windconvert) (accessed February 22, 2016).

Converting or calculating weather metrics
-----------------------------------------

### Converting between temperature measurements

This package includes a function, `convert_temperature`, that allows you to convert between common temperature measures including degrees Celsius, Fahrenheit, and Kelvin. As examples, the `lyon` data set (air temperatures `lyon$TemperatureC` and dew point temperature `lyon$DewpointC`, both in degrees Celsius) for Lyon, France, for the week of June 18, 2000, the `norfolk`data set (air temperatures `norfolk$TemperatureF` and dew point temperature `norfolk$DewpointF`, both in degrees Fahrenheit) for Norfok, VA, for the week of March 12, 2006, and the `angeles` data (air temperature `angeles$TemperatureK` and dew point temperature `angeles$DewpointK`, both in degrees Kelvin) in Los Angeles, CA, for the week of December 19, 2010, included with this package.

To convert between degrees Celsius, Fahrenheit, and Kelvin, use the `convert_temperature` function:

``` r
#Convert from degrees Celsius to degress Fahrenheit
data(lyon)
lyon$TemperatureF <- convert_temperature(lyon$TemperatureC,
   old_metric = "c", new_metric = "f")
lyon$DewpointF <- convert_temperature(lyon$DewpointC, 
   old_metric = "c", new_metric = "f")
lyon
#>         Date TemperatureC DewpointC TemperatureF DewpointF
#> 1 2000-06-18           22        13         71.6      55.4
#> 2 2000-06-19           24        13         75.2      55.4
#> 3 2000-06-20           24         9         75.2      48.2
#> 4 2000-06-21           21        10         69.8      50.0
#> 5 2000-06-22           23        13         73.4      55.4
#> 6 2000-06-23           20         8         68.0      46.4
#> 7 2000-06-24           16        11         60.8      51.8
#Convert from degrees Fahrenheit to degrees Celsius
data(norfolk)
norfolk$TemperatureC <- convert_temperature(norfolk$TemperatureF,
   old_metric = "f", new_metric = "c")
norfolk$DewpointC <- convert_temperature(norfolk$DewpointF, 
   old_metric = "f", new_metric = "c")
norfolk
#>         Date TemperatureF DewpointF TemperatureC DewpointC
#> 1 2006-03-12           70        56        21.11     13.33
#> 2 2006-03-13           74        59        23.33     15.00
#> 3 2006-03-14           63        40        17.22      4.44
#> 4 2006-03-15           50        19        10.00     -7.22
#> 5 2006-03-16           47        32         8.33      0.00
#> 6 2006-03-17           45        39         7.22      3.89
#> 7 2006-03-18           44        16         6.67     -8.89
#Convert from degrees Kelvin to degrees Celsius
data(angeles)
angeles$TemperatureC <- convert_temperature(angeles$TemperatureK,
   old_metric = "kelvin", new_metric = "celsius")
angeles$DewpointC <- convert_temperature(angeles$DewpointK, 
   old_metric = "kelvin", new_metric = "celsius")
angeles
#>         date TemperatureK DewpointK TemperatureC DewpointC
#> 1 2010-12-19       288.71    287.04        15.56     13.89
#> 2 2010-12-20       287.60    285.37        14.45     12.22
#> 3 2010-12-21       286.48    284.82        13.33     11.67
#> 4 2010-12-22       287.04    284.82        13.89     11.67
#> 5 2010-12-23       286.48    283.15        13.33     10.00
#> 6 2010-12-24       287.60    282.04        14.45      8.89
#> 7 2010-12-25       285.93    283.15        12.78     10.00
```

You can specify whether air temperature and dew point temperature inputs are in degrees Celsius, Fahrenheit, or Kelvin using the `old_metric` and `new_metric` options (possible values are `'celsius'`, `'fahrenheit'`, `'kelvin'`, or `'c'`, `'f'`, and `'k'` for the same). The input for `old_metric` should be the temperature measure that you want to convert from, and the input for `new_metric` should be the temperature measure you wish to convert to. These inputs must be different.

The `convert_temperature` function is a wrapper function for a variety of individual temperature conversion functions, including: `celsius.to.fahrenheit`, `fahrenheit.to.celsius`, `celsius.to.kelvin`, `kelvin.to.celsius`, `fahrenheit.to.kelvin`, and `kelvin.to.fahrenheit` functions, which you can use individually if you would like.

### Calculating relative humidity and dew point temperature

The `weathermetrics` package includes two functions for converting between air temperature, dew point temperature, and relative humidity: `dewpoint.to.humidity` and `humidity.to.dewpoint`.

For example, the `lyon` data set includes daily values of both air temperature (`lyon\TemperatureC`) and dew point temperature (`lyon$DewpointC`) in Lyon, France, for the week of June 18, 2000. Since this data set includes both air temperature and dew point temperature, you can calculate relative humidity using the `dewpoint.to.humidity` function:

``` r
data(lyon)
lyon$RH <- dewpoint.to.humidity(t = lyon$TemperatureC,
                                dp = lyon$DewpointC,
                                temperature.metric = "celsius")
lyon
#>         Date TemperatureC DewpointC       RH
#> 1 2000-06-18           22        13 56.78893
#> 2 2000-06-19           24        13 50.28890
#> 3 2000-06-20           24         9 38.56789
#> 4 2000-06-21           21        10 49.54916
#> 5 2000-06-22           23        13 53.43049
#> 6 2000-06-23           20         8 46.07966
#> 7 2000-06-24           16        11 72.40572
```

You can specify whether air temperature and dew point temperature inputs are in degrees Fahrenheit or Celsius using the `temperature.metric` option (possible values are `'fahrenheit'` and `'celsius'`). If input values for temperature and dew point temperature are in different metrics (i.e., one is in degrees Fahrenheit and the other in degrees Celsius), you must convert one of the inputs using either `celsius.to.fahrenheit` or `fahrenheit.to.celsius` before you can input the values to the `dewpoint.to.humidity` function.

As an example of calculating dew point temperature, the `newhaven` data set gives daily values of air temperature in degrees Fahrenheit (`newhaven$TemperatureF`) and relative humidity in % (`newhaven$Relative.Humidity`) for New Haven, CT, for the week of October 19, 2008. Since this data set includes values for both temperature and relative humidity, you can calculate dew point temperature using the `humidity.to.dewpoint` function:

``` r
data(newhaven)
newhaven$DP <- humidity.to.dewpoint(t = newhaven$TemperatureF,
                                    rh = newhaven$Relative.Humidity,
                                    temperature.metric = "fahrenheit")
newhaven
#>         Date TemperatureF Relative.Humidity    DP
#> 1 2008-10-19           46                57 31.47
#> 2 2008-10-20           48                55 32.45
#> 3 2008-10-21           48                68 37.84
#> 4 2008-10-22           46                60 32.75
#> 5 2008-10-23           44                64 32.48
#> 6 2008-10-24           44                67 33.63
#> 7 2008-10-25           56                84 51.18
```

Relative humidity must be input as %, and you must specify the metric of air temperature using the `temperature.metric` option (possible values: `'fahrenheit'` or `'celsius'`). The dew point temperature will be calculated using the same metric as the air temperature input to the function. If you wish to get dew point temperature in a different metric than air temperature, you can use on of the functions that converts between Celsius and Fahrenheit. For example:

``` r
data(newhaven)
newhaven$DP <- humidity.to.dewpoint(t = newhaven$TemperatureF,
                                    rh = newhaven$Relative.Humidity,
                                    temperature.metric = "fahrenheit")
newhaven$DP_C <- fahrenheit.to.celsius(newhaven$DP)
newhaven
#>         Date TemperatureF Relative.Humidity    DP  DP_C
#> 1 2008-10-19           46                57 31.47 -0.29
#> 2 2008-10-20           48                55 32.45  0.25
#> 3 2008-10-21           48                68 37.84  3.24
#> 4 2008-10-22           46                60 32.75  0.42
#> 5 2008-10-23           44                64 32.48  0.27
#> 6 2008-10-24           44                67 33.63  0.91
#> 7 2008-10-25           56                84 51.18 10.66
```

Calculations between air temperature, relative humidity, and dew point temperature are based on algorithms used by the United States National Weather Service's [online heat index calculator](http://www.wpc.ncep.noaa.gov/html/heatindex.shtml) (accessed December 18, 2015). These are approximations rather than exact conversions.

### Calculating heat index

The `weathermetrics` package includes a function, `heat.index`, that allows you to calculate a vector of heat index values from vectors of air temperature and either dew point temperature or relative humidity. For example, the `suffolk` data set gives daily values of air temperature in degrees Fahrenheit (`suffolk$TemperatureF`) and relative humidity in % (`suffolk$Relative.Humidity`) for Suffolk, VA, for the week of July 12, 1998. To calculate daily heat index values for this data set, use the `heat.index` function:

``` r
data(suffolk)
suffolk$HI <- heat.index(t = suffolk$TemperatureF,
                         rh = suffolk$Relative.Humidity,
                         temperature.metric = "fahrenheit",
                         output.metric = "fahrenheit")
suffolk
#>         Date TemperatureF Relative.Humidity HI
#> 1 1998-07-12           72                69 72
#> 2 1998-07-13           73                66 73
#> 3 1998-07-14           74                74 75
#> 4 1998-07-15           78                86 80
#> 5 1998-07-16           78               100 81
#> 6 1998-07-17           80                98 89
#> 7 1998-07-18           81                78 86
```

You must specify whether the air temperature input to the function is in degrees Celsius or Fahrenheit using the `temperature.metric` option (possible values: `'fahrenheit'` or `'celsius'`). You can choose which metric for heat index to be calculated in using using the `output.metric` option (the default is to give heat index in the same metric as the air temperature values input to the function).

As another example, the `lyon` data set gives daily values of air temperature (`lyon$TemperatureC`) and dew point temperature (`lyon$DewpointC`), both in degrees Celsius, for Lyon, France, for the week of June 18, 2000. You can use this data to calculate daily heat index values in degrees Fahrenheit using:

``` r
data(lyon)
lyon$HI_F <- heat.index(t = lyon$TemperatureC,
                      dp = lyon$DewpointC,
                      temperature.metric = "celsius",
                      output.metric = "fahrenheit")
lyon
#>         Date TemperatureC DewpointC HI_F
#> 1 2000-06-18           22        13   71
#> 2 2000-06-19           24        13   75
#> 3 2000-06-20           24         9   74
#> 4 2000-06-21           21        10   69
#> 5 2000-06-22           23        13   73
#> 6 2000-06-23           20         8   67
#> 7 2000-06-24           16        11   60
```

When calculating heat index from air temperature and dew point temperature, both must be in the same metric (either degrees Fahrenheit or degrees Celsius) when they are input to the `heat.index` function. If this is not the case, you can use either `celsius.to.fahrenheit` or `fahrenheit.to.celsius` to convert one of the metrics before using `heat.index`.

The algorithm for the function is adapted for R from the algorithms used by the United States National Weather Service's [online heat index calculator](http://www.wpc.ncep.noaa.gov/html/heatindex.shtml) (accessed December 18, 2015). Therefore, results will agree with results from the US National Weather Service online calculator. However, heat index is sometimes calculated using a simpler algorithm. Therefore, heat index values from the function will sometimes differ by one or two degrees compared to other heat index calculators or charts.

### Converting between units of wind speed

The `weathermetrics` package includes a function, `convert_wind_speed`, that allows you to convert a vector of wind speed values in a specific unit between common units of wind speed measure including: knots (`'knots'`), miles per hour(`'mph'`), meters per second (`'mps'`), feet per second (`'ftps'`), and kilometers per hour (`'kmph'`). For example, the `beijing` data set included with this package gives daily values of wind speed in: miles per hour (`beijing$MPH`), meters per second (`beijing$mps`), feet per second (`beijing$ftps`), and kilometers per hour (`beijing$kmph`) for Beijing, China, for the week of January 10, 2015. Also, the `foco` data set included with this package gives daily values of wind speed in knots (`foco$knots`) for Fort Collins, Colorado, for the week of October 11, 2015. Using these data sets, you can convert between common units of wind speed measure using the `convert_wind_speed` funciton:

``` r
data(beijing)
beijing$knots <- convert_wind_speed(beijing$kmph,
   old_metric = "kmph", new_metric = "knots")
beijing
#>         date TemperatureF MPH mps ftps kmph knots
#> 1 2016-01-10           24   4 1.8  5.9  6.5   3.5
#> 2 2016-01-11           21   9 4.0 13.2 14.5   7.8
#> 3 2016-01-12           18  11 4.9 16.2 17.8   9.6
#> 4 2016-01-13           26  11 4.9 16.2 17.8   9.6
#> 5 2016-01-14           26   4 1.8  5.9  6.5   3.5
#> 6 2016-01-15           28   3 1.3  4.4  4.8   2.6
#> 7 2016-01-16           27   5 2.2  7.3  8.0   4.3

data(foco)
foco$mph <- convert_wind_speed(foco$knots, old_metric = "knots",
   new_metric = "mph", round = 0)
foco$mph <- convert_wind_speed(foco$knots, old_metric = "knots",
   new_metric = "mps", round = NULL)
foco$kmph <- convert_wind_speed(foco$mph, old_metric = "mph",
   new_metric = "kmph")
foco
#>         date TemperatureF knots      mph kmph
#> 1 2015-10-11           65   4.3 2.212111  3.6
#> 2 2015-10-12           59   9.6 4.938666  8.0
#> 3 2015-10-13           64   2.6 1.337555  2.2
#> 4 2015-10-14           63   2.6 1.337555  2.2
#> 5 2015-10-15           54   5.2 2.675111  4.3
#> 6 2015-10-16           51   5.2 2.675111  4.3
#> 7 2015-10-17           59   3.5 1.800555  2.9
```

You must specify the unit of wind speed that you wish to convert from using the `old_metric` option, and the unit of wind speed you wish to convert to using the `new_metric` option (possible values: `'knots'`, `'mph'`, `'mps'`, `'ftps'`, or `'kmph'`). The unit for `old_metric` cannot be the same as the unit for `new_metric`. You can specify the number of decimal places you wish to round to using the `round` argument. The default value for `round` is 1, consistant with the algorithms used by the National Oceanic and Atmospheric Administration's [online wind speed conversion](http://www.srh.noaa.gov/epz/?n=wxcalc_windconvert) (accessed February 22, 2016). When `round` is set to `NULL`, the output value will not be rounded.

### Converting between precipitation measurements

The `weathermetrics` package includes a function, `convert_precip`, that allows you to convert a vector of precipitation measurement values between inches (`'inches'`), millimeters (`'mm'`), and centimeters (`'cm'`).

For example, the `breck` data set included with this package gives daily values of precipitation in inches (`breck$Precip.in`) for Breckenridge, CO, for the week of June 28, 2015. Also, the `loveland` data set included with this package gives daily values of precipitation in millimeters (`loveland$Precip.mm`) for Loveland, CO, for the week of September 08, 2013.

To convert daily precipitation values between inches, millimeters, and centimeters, use the `convert_precip` function:

``` r
data(breck)
breck$Precip.mm <- convert_precip(breck$Precip.in,
   old_metric = "inches", new_metric = "mm", round = 2)
breck
#>         date Precip.in Precip.mm
#> 1 2015-06-28      0.04      1.02
#> 2 2015-06-29      0.00      0.00
#> 3 2015-06-30      0.07      1.78
#> 4 2015-07-01      0.00      0.00
#> 5 2015-07-02      0.05      1.27
#> 6 2015-07-03      0.01      0.25
#> 7 2015-07-04      0.01      0.25

data(loveland)
loveland$Precip.in <- convert_precip(loveland$Precip.mm,
   old_metric = "mm", new_metric = "inches", round = NULL)
loveland$Precip.cm <- convert_precip(loveland$Precip.mm,
   old_metric = "mm", new_metric = "cm", round = 3)
loveland
#>         date Precip.mm Precip.in Precip.cm
#> 1 2013-09-08      0.00 0.0000000     0.000
#> 2 2013-09-09      6.86 0.2700787     0.686
#> 3 2013-09-10     12.95 0.5098425     1.295
#> 4 2013-09-11     13.21 0.5200787     1.321
#> 5 2013-09-12     19.56 0.7700787     1.956
#> 6 2013-09-13      4.57 0.1799213     0.457
#> 7 2013-09-14      6.60 0.2598425     0.660
```

You must specify the unit of precipitation measure that you wish to convert from using the `old_metric` option, and the unit of precipitation measure you wish to convert to using the `new_metric` option (possible values: `'inches'`, `'mm'`, and `'cm'`). The unit for `old_metric` cannot be the same as the unit for `new_metric`. You can specify the number of decimal places you wish to round to using the `round` argument. The default value for `round` is 2. When `round` is set to `NULL`, the output value will not be rounded.

Calculations between inches and metric units for precipitation measures are based on algorithms used by the United States National Weather Service's [Meteorological Conversions](http://www.srh.noaa.gov/ama/?n=conversions) (accessed March 20, 2016). These are approximations rather than exact conversions.

Handling missing or impossible weather values
---------------------------------------------

When any of the functions in this package encounter a missing value (`NA`) within any of the input vectors, the output weather metric for that observation will also be set as `NA`. For example:

``` r
df <- data.frame(T = c(NA, 90, 85),
                 DP = c(80, NA, 70))
df$RH <- dewpoint.to.humidity(t = df$T, dp = df$DP,
                              temperature.metric = "fahrenheit")
df
#>    T DP       RH
#> 1 NA 80       NA
#> 2 90 NA       NA
#> 3 85 70 60.88112
```

Certain values of dew point temperature or relative humidity are impossible. Relative humidity cannot be lower than 0% or higher than 100%. Dew point temperature cannot be higher than air temperature (except in the case of supersaturation) . When any of these functions encounter an impossible weather metric in an input vector, it returns `NA` as the output weather metric for that observation. For example:

``` r
df <- data.frame(T = c(90, 90, 85),
                 DP = c(80, 95, 70))
df$heat.index <- heat.index(t = df$T, dp = df$DP,
                            temperature.metric = 'fahrenheit')
#> Warning in dewpoint.to.humidity(t = t, dp = dp, temperature.metric =
#> temperature.metric): For some observations, dew point temperature was
#> higher than temperature. Since dew point temperature cannot be higher than
#> air temperature, relative humidty for these observations was set to 'NA'.
df
#>    T DP heat.index
#> 1 90 80        108
#> 2 90 95         NA
#> 3 85 70         90
```

Additionally, the function returns a warning to alert the user that the input data includes impossible values for some observations.

Rounding output values
----------------------

All functions have defaults for rounding that are consistent with the algorithms used by the United States National Weather Service's [online heat index calculator](http://www.wpc.ncep.noaa.gov/html/heatindex.shtml) (accessed December 18, 2015). For several of the functions, you may also specify that outputs are rounded to a different number of digits using the `round` option. For example:

``` r
data(suffolk)
suffolk$TempC <- fahrenheit.to.celsius(suffolk$TemperatureF,
                                       round = 5)
suffolk$HI <- heat.index(t = suffolk$TemperatureF, 
                         rh = suffolk$Relative.Humidity,
                         round = 3)
suffolk
#>         Date TemperatureF Relative.Humidity    TempC     HI
#> 1 1998-07-12           72                69 22.22222 72.143
#> 2 1998-07-13           73                66 22.77778 73.102
#> 3 1998-07-14           74                74 23.33333 74.578
#> 4 1998-07-15           78                86 25.55556 80.426
#> 5 1998-07-16           78               100 25.55556 80.605
#> 6 1998-07-17           80                98 26.66667 88.688
#> 7 1998-07-18           81                78 27.22222 86.051
```

Citation for package
--------------------

For conversions other than heat index, cite this package as:

G. Brooke Anderson, Roger D. Peng, and Joshua M. Ferreri. 2016. `weathermetrics`: Functions to Convert Between Weather Metrics. R package version 1.2.1.9000.

To cite this package when calculating the heat index, use:

Anderson GB, Bell ML, Peng RD. 2013. Methods to calculate the heat index as an exposure metric in environmental health research. Environmental Health Perspectives 121(10):1111-1119.
