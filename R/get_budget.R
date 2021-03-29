#' @title Budget execution summary report
#' @description The budget execution summary report will contain the
#' following statements: budget balance sheet, statement of execution of
#' expenses by function/subfunction; statement of current net revenue;
#' statement of social security income and expenses; statement of primary and
#' nominal results; statement of remains payable for power and agency; statement
#' of income and expenses with maintenance and development of education;
#' statement of income and expenses with public health actions and services;
#' statement of public-private partnerships; simplified statement of the budget
#' execution summary report.
#' @seealso \url{https://conteudo.tesouro.gov.br/manuais/index.php?option=com_content&view=article&id=1180:03-00-01-introducao&catid=601&Itemid=675}
#' @param year is a numeric vector
#' @param period is a numeric vector, bimonth of the year, an integer between
#' 1 and 6
#' @param cod is a numeric vector. Brazilian Institute of Geography and
#' Statistics (IBGE) code assigned to each municipality and state.
#' @param simple is a logical. \code{TRUE} applies only to municipalities with
#' less than 50 thousand inhabitants that have opted for simplified publication.
#' Default is \code{FALSE}
#' @param annex is a character vector. Default is \code{NULL},
#' it will get all attachments.
#' @param verbose is a logical. Enable verbose mode. Default is \code{FALSE}
#' @return \code{tibble}
#' @details
#' Possible values for the \code{annex} parameter are: \code{"01", "02", "03",
#' "04", "04 - RGPS", "04 - RPPS", "04.0 - RGPS", "04.1", "04.2",
#' "04.3 - RGPS", "05", "06", "07", "09", "10 - RGPS", "10 - RPPS", "11",
#' "13", "14"}.
#' For more details on the parameter \code{cod} see the column \code{cod_ibge}
#' of the function \code{\link{get_info}}
#' @examples
#' get_budget(year = 2020, period = 1, cod = 29)
#' @note
#' Brazilian Public Sector Accounting and Tax Information System (Siconfi):
#' \url{http://apidatalake.tesouro.gov.br/docs/siconfi/}
#' @export

get_budget <- function(year,
                      period,
                      cod,
                      simple = FALSE,
                      annex = NULL,
                      verbose = FALSE) {
  get(
    type = "rreo",
    an_exercicio = year,
    nr_periodo = period,
    id_ente = cod,
    co_tipo_demonstrativo = if (simple) "RREO Simplificado" else "RREO",
    no_anexo = annex,
    verbose = verbose
  )
}