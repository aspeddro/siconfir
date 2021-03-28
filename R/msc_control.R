#' @title Control accounts, Accounting Balances Matrix
#' @description Details of the records informed in the accounting accounts that 
#' receive entries of a control nature.
#' @param year is a numeric vector
#' @param month is a numeric vector
#' @param cod is a numeric vector. Brazilian Institute of Geography and
#' Statistics (IBGE) code assigned to each municipality and state.
#' @param matrix_type is a character. Matrix type, monthly or aggregate 
#' \code{"MSCC"} or year-end \code{"MSCE"}
#' @param class is a numeric vector 7 or 8. Class of accounting accounts that 
#' receive postings of a control nature. 
#' @param value is a character. The detailed values can be of three types: 
#' opening balance \code{"beginning_balance"}, movement \code{"period_change"}
#' or ending balance \code{"ending_balance"}
#' @param verbose is a logical. Enable verbose mode. Default is \code{FALSE}
#' @note
#' It refers to the control accounting accounts for checking balances of a debtor 
#' nature (class 7) and of a creditor nature (class 8) as well as their respective 
#' complementary information.
#' @export 

msc_control <- function(year, 
                        month,
                        cod,
                        matrix_type,
                        class,
                        value,
                        verbose = FALSE) {

  if (!(matrix_type %in% c("MSCC", "MSCE"))) {
    stop("Argument matrix_type should be 'MSCC' or 'MSCE'")
  }

  if (!(class %in% 7:8)) {
    stop("Argument class should be 7 or 8")
  }

  if (!(value %in% c("beginning_balance", "period_change", "ending_balance"))) {
    stop("Argument matrix_type should be 'beginning_balance', 'period_change' or 'ending_balance'")
  }

  get(
    type = "msc_controle",
    an_referencia = year,
    me_referencia = month,
    id_ente = cod,
    co_tipo_matriz = matrix_type,
    classe_conta = class,
    id_tv = value,
    verbose = verbose
  )
}