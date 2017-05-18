context("heat index")

data(suffolk)

test_that("heat.index", {
        heatIndexOut = readRDS("data/HeatIndex_Out.rds")
        expect_equal(heatIndexOut,
                     heat.index(t = suffolk$TemperatureF,
                                rh = suffolk$Relative.Humidity)
        )
})

test_that("heat.index.algorithm", {
        hiaOut = readRDS("data/HeatIndexAlg_Out.rds")
        expect_equal(hiaOut,
                     heat.index.algorithm(t = suffolk$TemperatureF[1],
                                          rh = suffolk$Relative.Humidity[1])

        )
})
