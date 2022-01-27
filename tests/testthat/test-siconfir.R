test_that("find_cod for 35", {
  expect_true(nrow(find_cod("São Paulo")) == 5)
})

test_that("find_cod error", {
  expect_error(find_cod(1))
})

test_that("get_annex", {
  expect_true(nrow(get_annex()) > 0)
})

test_that("get_annual_acc", {
  expect_true(
    nrow(get_annual_acc(
      year = 2019,
      cod = 17
    )) > 0
  )
  expect_true(
    nrow(get_annual_acc(year = 2018, cod = 35)) > 0
  )
  expect_true(
    nrow(get_annual_acc(
      year = 2017,
      cod = 11,
      annex = c("DCA-Anexo I-C", "DCA-Anexo I-D")
    )) > 0
  )
})

test_that("get_budget", {
  expect_true(
    nrow(get_budget(
      year = 2020,
      period = 1,
      annex = "01",
      cod = 29,
      sphere = "E"
    )) > 0
  )
})

test_that("get_fiscal", {
  expect_true(
    nrow(get_fiscal(
      year = 2020,
      period = 1,
      cod = 1,
      power = "E"
    )) > 0
  )
  expect_error(get_fiscal(year = 2020, period = 4))
})

test_that("get_info", {
  expect_true(nrow(get_info()) > 0)
})

test_that("msc_budget", {
  expect_true(
    nrow(
      msc_budget(
        year = 2020,
        month = 1,
        cod = 1,
        matrix_type = "MSCC",
        class = 5,
        value = "period_change"
      )
    ) > 0
  )
})

test_that("msc_control", {
  expect_true(
    nrow(
      msc_control(
        year = 2020,
        month = 1,
        cod = 53,
        matrix_type = "MSCC",
        class = 7,
        value = "ending_balance"
      )
    ) > 0
  )
})

test_that("msc_equity", {
  expect_true(
    nrow(
      msc_equity(
        year = 2020,
        month = 1:2,
        cod = 17,
        matrix_type = "MSCC",
        class = 1,
        value = "beginning_balance"
      )
    ) > 0
  )
})

test_that("report_status", {
  expect_true(nrow(report_status(year = 2018, cod = 53)) > 0)
})
