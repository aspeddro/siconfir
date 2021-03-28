#' @title Annual Statement of Accounts
#' @description Access the Annual Statement of Accounts
#' @param year is a numeric vector
#' @param annex is a character vector. Default is \code{NULL},
#' it will get all attachments.
#' @param cod is a numeric vector. Brazilian Institute of Geography and
#' Statistics (IBGE) code assigned to each municipality and state.
#' @param verbose is a logical. Enable verbose mode. Default is \code{FALSE}
#' @return \code{tibble}
#' @details
#' Possible values for the \code{annex} parameter are: \code{"Anexo I-AB",
#' "Anexo I-C", "Anexo I-D", "Anexo I-E", "Anexo I-F", "Anexo I-G",
#' "Anexo I-HI", "DCA-Anexo I-AB", "DCA-Anexo I-C", "DCA-Anexo I-D",
#' "DCA-Anexo I-E", "DCA-Anexo I-F", "DCA-Anexo I-G", "DCA-Anexo I-HI"}
#' For more details on the parameter \code{cod} see the column \code{cod_ibge}
#' of the function \code{get_info()}
#' @examples
#' get_annual_acc(year = 2019, cod = 35)
#' @note
#' Brazilian Public Sector Accounting and Tax Information System (Siconfi):
#' http://apidatalake.tesouro.gov.br/docs/siconfi/
#' @export

get_annual_acc <- function(year, annex = NULL, cod, verbose = FALSE) {
  get(
    type = "dca",
    an_exercicio = year,
    no_anexo = annex,
    id_ente = cod,
    verbose = verbose
  )
}