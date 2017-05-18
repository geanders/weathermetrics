context("temperature conversion")

data(lyon)
data(norfolk)
data(angeles)

test_that("convert_temperature", {
        convertTempOut = readRDS("data/ConvertTemp_Out.rds")
        expect_equal(convertTempOut,
                     convert_temperature(lyon$TemperatureC,
                                         old_metric = "c", new_metric = "f")
        )
})

test_that("celsius.to.fahrenheit", {
        CtoFOut = readRDS("data/CtoF_Out.rds")
        expect_equal(CtoFOut,
                     celsius.to.fahrenheit(lyon$TemperatureC)
        )
})


test_that("celsius.to.kelvin", {
        CtoKOut = readRDS("data/CtoK_Out.rds")
        expect_equal(CtoKOut,
                     celsius.to.kelvin(lyon$TemperatureC)
        )
})


test_that("fahrenheit.to.celsius", {
        FtoCOut = readRDS("data/FtoC_Out.rds")
        expect_equal(FtoCOut,
                     fahrenheit.to.celsius(norfolk$TemperatureF)
        )
})


test_that("fahrenheit.to.kelvin", {
        FtoKOut = readRDS("data/FtoK_Out.rds")
        expect_equal(FtoKOut,
                     fahrenheit.to.kelvin(norfolk$TemperatureF)
        )
})


test_that("kelvin.to.celsius", {
        KtoCOut = readRDS("data/KtoC_Out.rds")
        expect_equal(KtoCOut,
                     kelvin.to.celsius(angeles$TemperatureK)
        )
})


test_that("kelvin.to.fahrenheit", {
        KtoFOut = readRDS("data/KtoF_Out.rds")
        expect_equal(KtoFOut,
                     kelvin.to.fahrenheit(angeles$TemperatureK)
        )
})


