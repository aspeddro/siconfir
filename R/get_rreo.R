#' @title Budget Execution Summary Report
#' @description Access the Budget Execution Summary Report
#' @param year is a numeric vector
#' @param period is a numeric vector, bimonth of the year, an integer between
#' 1 and 6
#' @param simple is a logical. \code{TRUE} applies only to municipalities with
#' less than 50 thousand inhabitants that have opted for simplified publication.
#' Default is \code{FALSE}
#' @param annex is a character vector. The default value is \code{NULL},
#' it will get all attachments.
#' @param id is a numeric vector. Brazilian Institute of Geography and
#' Statistics (IBGE) code assigned to each municipality and state.
#' @return \code{tibble}
#' @details
#' Possible values for the \code{annex} parameter are: \code{"01", "02", "03",
#' "04", "04 - RGPS", "04 - RPPS", "04.0 - RGPS", "04.1", "04.2",
#' "04.3 - RGPS", "05", "06", "07", "09", "10 - RGPS", "10 - RPPS", "11",
#' "13", "14"}.
#' For more details on the parameter \code{id} see the column \code{cod_ibge}
#' of the function \code{get_entes()}
#' @examples
#' get_rreo(year = 2020, period = 1, id = 35)
#' get_rreo(year = 2019:2020, period = 2, id = 35)
#' @note
#' Brazilian Public Sector Accounting and Tax Information System (Siconfi): 
#' http://apidatalake.tesouro.gov.br/docs/siconfi/
#' @export

get_rreo <- function(year,
                     period,
                     simple = FALSE,
                     annex = NULL,
                     id) {
  get(
    type = "rreo",
    an_exercicio = year,
    nr_periodo = period,
    co_tipo_demonstrativo = if (simple) "RREO Simplificado" else "RREO",
    no_anexo = annex,
    id_ente = id
  )
}