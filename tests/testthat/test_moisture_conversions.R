context("moisture conversion")

data(newhaven)

test_that("dewpoint.to.humidity", {
        DtoHOut = readRDS("data/DtoH_Out.rds")
        expect_equal(DtoHOut,
                     dewpoint.to.humidity(t = lyon$TemperatureC,
                                          dp = lyon$DewpointC,
                                          temperature.metric = 'celsius')

        )
})


test_that("humidity.to.dewpoint", {
        HtoDOut = readRDS("data/HtoD_Out.rds")
        expect_equal(HtoDOut,
                     humidity.to.dewpoint(t = newhaven$TemperatureF,
                                          rh = newhaven$Relative.Humidity,
                                          temperature.metric = 'fahrenheit')

        )
})

