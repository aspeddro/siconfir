expect_errors <- c(
  "Could not resolve host: apidatalake.tesouro.gov.br",
  "Timeout was reached: [apidatalake.tesouro.gov.br] Connection timeout after 10000 ms"
)

library(magrittr, include.only = "%>%")

#' To test functions that might throw an error
expect_with_exception <- function(fn, args = NULL, assert) {
  params_is_null <- rlang::is_null(args)
  result <- tryCatch(
    if (params_is_null) {
      rlang::inject(fn())
    } else {
      rlang::inject(fn(!!!args))
    },
    error = function(e) e
  )
  if (rlang::is_error(result)) {
    error_message <- if (params_is_null) {
      result$message
    } else {
      result$parent$message
    }

    error <- character()

    for (e in expect_errors) {
      if (e == error_message) {
        error <- e
      }
    }

    testthat::expect_equal(error, error_message)
  } else {
    testthat::expect_true(assert(result))
  }
}

test_that("find_cod for 35", {
  find_cod("São Paulo") %>%
    nrow() %>%
    expect_equal(5)
})

test_that("find_cod error", {
  find_cod(1) %>%
    expect_error()
})

test_that("get_annex", {
  get_annex %>%
    expect_with_exception(
      assert = function(df) (df %>% nrow()) > 0
    )
})

test_that("get_annual_acc", {
  get_annual_acc %>%
    expect_with_exception(
      args = list(year = 2019, cod = 17),
      assert = function(df) (df %>% nrow()) > 0
    )

  get_annual_acc %>%
    expect_with_exception(
      args = list(year = 2018, cod = 35),
      assert = function(df) (df %>% nrow()) > 0
    )

  get_annual_acc %>%
    expect_with_exception(
      args = list(
        year = 2017,
        cod = 11,
        annex = c("DCA-Anexo I-C", "DCA-Anexo I-D")
      ),
      assert = function(df) (df %>% nrow()) > 0
    )
})

test_that("get_budget", {
  get_budget %>%
    expect_with_exception(
      args = list(
        year = 2020,
        period = 1,
        annex = "01",
        cod = 29,
        sphere = "E"
      ),
      assert = function(df) (df %>% nrow()) > 0
    )
})

test_that("get_fiscal", {
  get_fiscal %>%
    expect_with_exception(
      args = list(
        year = 2020,
        period = 1,
        cod = 1,
        power = "E"
      ),
      assert = function(df) (df %>% nrow()) > 0
    )

  expect_error(get_fiscal(year = 2020, period = 4))
})

test_that("get_info", {
  get_info %>%
    expect_with_exception(
      assert = function(df) (df %>% nrow()) == 5597
    )
})

test_that("msc_budget", {
  msc_budget %>%
    expect_with_exception(
      args = list(
        year = 2020,
        month = 1,
        cod = 1,
        matrix_type = "MSCC",
        class = 5,
        value = "period_change"
      ),
      assert = function(df) (df %>% nrow()) > 0
    )
})

test_that("msc_control", {
  msc_control %>%
    expect_with_exception(
      args = list(
        year = 2020,
        month = 1,
        cod = 53,
        matrix_type = "MSCC",
        class = 7,
        value = "ending_balance"
      ),
      assert = function(df) (df %>% nrow()) > 0
    )
})

test_that("msc_equity", {
  msc_equity %>%
    expect_with_exception(
      args = list(
        year = 2020,
        month = 1:2,
        cod = 17,
        matrix_type = "MSCC",
        class = 1,
        value = "beginning_balance"
      ),
      assert = function(df) (df %>% nrow()) > 0
    )
})

test_that("report_status", {
  report_status %>%
    expect_with_exception(
      args = list(year = 2018, cod = 53),
      assert = function(df) (df %>% nrow()) > 0
    )
})
