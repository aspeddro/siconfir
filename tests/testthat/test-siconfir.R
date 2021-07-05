test_that("find_cod for 35", {
  expect_equal(nrow(find_cod("São Paulo")), 5)
})

test_that("find_cod error", {
  expect_error(find_cod(1))
})

test_that("get_annex", {
  expect_s3_class(get_annex(), "data.frame")
})

test_that("get_annual_acc", {
  expect_s3_class(get_annual_acc(year = 2020, cod = 17), "data.frame")
  expect_s3_class(
    get_annual_acc(year = 2018, cod = 35, annex = "Anexo I-AB"),
    "data.frame"
  )
  expect_s3_class(
    get_annual_acc(year = 2017, cod = 11, annex = c("DCA-Anexo I-C", "DCA-Anexo I-D")),
    "data.frame"
  )
})

test_that("get_budget", {
  expect_s3_class(get_budget(year = 2020, period = 3, cod = 29), "data.frame")
})

test_that("get_fiscal", {
  expect_s3_class(get_fiscal(year = 2020, period = 1, cod = 1, power = "E"), "data.frame")
  expect_error(get_fiscal(year = 2020, period = 4))
})

test_that("get_info", {
  expect_s3_class(get_info(), "data.frame")
})

test_that("msc_budget", {
  expect_s3_class(
    msc_budget(year = 2020, month = 1, cod = 1, matrix_type = "MSCC", class = 5, value = "period_change"),
    "data.frame"
  )
})

test_that("msc_control", {
  expect_s3_class(
    msc_control(year = 2020, month = 1, cod = 53, matrix_type = "MSCC", class = 7, value = "ending_balance"),
    "data.frame"
  )
})

test_that("msc_equity", {
  expect_s3_class(
    msc_equity(year = 2020, month = 1:2, cod = 17, matrix_type = "MSCC", class = 1, value = "beginning_balance"),
    "data.frame"
  )
})

test_that("report_status", {
  expect_s3_class(report_status(year = 2018, cod = 53), "data.frame")
})
