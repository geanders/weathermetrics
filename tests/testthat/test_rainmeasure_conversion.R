context("rainmeasure conversion")

data(breck)
data(loveland)

test_that("convert_precip", {
        convertPrecipOut = readRDS("data/ConvertPrecip_Out.rds")
        expect_equal(convertPrecipOut,
                     convert_precip(breck$Precip.in,
                                    old_metric = "inches",
                                    new_metric = "mm",
                                    round = 2)

        )
})


test_that("inches_to_metric", {
        ItoMOut = readRDS("data/ItoM_Out.rds")
        expect_equal(ItoMOut,
                     inches_to_metric(breck$Precip.in,
                                      unit = "mm",
                                      round = 2)

        )
})


test_that("metric_to_inches", {
        MtoIOut = readRDS("data/MtoI_Out.rds")
        expect_equal(MtoIOut,
                     metric_to_inches(loveland$Precip.mm,
                                      unit.from = "mm",
                                      round = 2)
        )
})

