#' @title Annual statement of accounts
#' @description set of tables of patrimonial and budgetary data: balance sheet,
#' statement of budgetary revenue. statement of budgetary expenses by nature,
#' statement of budgetary expenses by function, statement of execution of
#' remains payable - budgetary expenses by nature, statement of execution of
#' remains payable - budgetary expenses by function, statement of equity
#' variations
#' @seealso \url{https://www.gov.br/secretariadegoverno/pt-br/portalfederativo/guiainicio/prefeito/trilhas-100-dias-de-governo/dca-declaracao-de-contas-anuais}
#' @param year is a numeric vector
#' @param cod is a numeric vector. Brazilian Institute of Geography and
#' Statistics (IBGE) code assigned to each municipality and state.
#' @param annex is a character vector. Default is \code{NULL},
#' it will get all attachments.
#' @param verbose is a logical. Enable verbose mode. Default is \code{FALSE}
#' @return \code{tibble}
#' @details
#' Possible values for the \code{annex} parameter are: \code{"Anexo I-AB",
#' "Anexo I-C", "Anexo I-D", "Anexo I-E", "Anexo I-F", "Anexo I-G",
#' "Anexo I-HI", "DCA-Anexo I-AB", "DCA-Anexo I-C", "DCA-Anexo I-D",
#' "DCA-Anexo I-E", "DCA-Anexo I-F", "DCA-Anexo I-G", "DCA-Anexo I-HI"}
#' For more details on the parameter \code{cod} see the column \code{cod_ibge}
#' of the function \code{\link{get_info}}
#' @examples
#' \dontrun{
#' get_annual_acc(year = 2019, cod = 35)
#' }
#' @note
#' Brazilian Public Sector Accounting and Tax Information System (Siconfi):
#' \url{http://apidatalake.tesouro.gov.br/docs/siconfi/}
#' @export

get_annual_acc <- function(year, cod, annex = NULL, verbose = FALSE) {
  get(
    type = "dca",
    an_exercicio = year,
    id_ente = cod,
    no_anexo = annex,
    verbose = verbose
  )
}