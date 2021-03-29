#' @title Report status
#' @description Information on approved and corrected reports as well as
#' matrices delivered to SICONFI.
#' @param year is a numeric vector
#' @param cod is a numeric vector. Brazilian Institute of Geography and
#' Statistics (IBGE) code assigned to each municipality and state.
#' @param verbose is a logical. Enable verbose mode. Default is \code{FALSE}
#' @return \code{tibble}
#' @examples
#' report_status(year = 2020, cod = 35)
#' @note
#' Brazilian Public Sector Accounting and Tax Information System (Siconfi):
#' \url{http://apidatalake.tesouro.gov.br/docs/siconfi/}
#' @export

report_status <- function(year, cod, verbose = FALSE) {
  get(
    type = "extrato_entregas",
    an_referencia = year,
    id_ente = cod,
    verbose = verbose
  )
}