context("wind conversion")

data(beijing)
data(foco)

test_that("convert_wind_speed", {
        convertWindSpeedOut = readRDS("data/ConvertWindSpeed_Out.rds")
        expect_equal(convertWindSpeedOut,
                     convert_wind_speed(beijing$kmph,
                                        old_metric = "kmph", new_metric = "knots")
        )
})


test_that("knots_to_speed", {
        KtoSOut = readRDS("data/KtoS_Out.rds")
        expect_equal(KtoSOut,
                     knots_to_speed(foco$knots, unit = "mph", round = 0)
        )
})


test_that("speed_to_knots", {
        StoKOut = readRDS("data/StoK_Out.rds")
        expect_equal(StoKOut,
                     speed_to_knots(beijing$kmph, unit = "kmph", round = 2)
        )
})
