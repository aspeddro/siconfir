#' @title Equity accounts, accounting balances matrix
#' @description Details of the records informed in the accounting accounts that
#' receive entries of an equity nature.
#' @param year is a numeric vector
#' @param month is a numeric vector
#' @param cod is a numeric vector. Brazilian Institute of Geography and
#' Statistics (IBGE) code assigned to each municipality and state.
#' @param matrix_type is a character. Matrix type, monthly or aggregate
#' \code{"MSCC"} or year-end \code{"MSCE"}
#' @param class is a numeric vector, integer between 1 and 4. Class of
#' accounting accounts that receive entries of an equity nature
#' @param value is a character. The detailed values can be of three types:
#' opening balance \code{"beginning_balance"}, movement \code{"period_change"}
#' or ending balance \code{"ending_balance"}
#' @param verbose is a logical. Enable verbose mode. Default is \code{FALSE}
#' @note
#' It refers to the accounting accounts for assets (class 1), liabilities
#' (class 2), diminishing equity variations (class 3) and augmenting equity
#' variations (class 4) as well as their respective complementary information.
#' @return \code{tibble}
#' @export

msc_equity <- function(year,
                       month,
                       cod,
                       matrix_type,
                       class,
                       value,
                       verbose = FALSE) {

  get(
    type = "msc_patrimonial",
    an_referencia = year,
    me_referencia = month,
    id_ente = cod,
    co_tipo_matriz = matrix_type,
    classe_conta = class,
    id_tv = value,
    verbose = verbose
  )
}