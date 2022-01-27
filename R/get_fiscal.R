#' @title Fiscal management report
#' @description The fiscal management report will contain comparative
#' statements with the limits referred to in the fiscal responsibility law, of
#' the following amounts: total personnel expenses, showing expenses with
#' assets, inactive and pensioners, net consolidated debt, granting of
#' guarantees and counter-guarantees and operation credit.
#' @seealso \url{https://conteudo.tesouro.gov.br/manuais/index.php?option=com_content&view=article&id=1344:04-00-01-01-conteudo-do-relatorio&catid=677&Itemid=675}
#' @param year is a numeric vector
#' @param period is a numeric vector, period of the year, if the parameter
#' \code{freq} is \code{"Q"} then it will be an integer between 1 and 3.
#' If \code{freq} is \code{"S"} then it will be an integer between 1 and 2.
#' @param cod is a numeric vector. Brazilian Institute of Geography and
#' Statistics (IBGE) code assigned to each municipality and state.
#' @param freq is a character, periodicity of publication of the report,
#' \code{"S"} is semiannual, \code{"Q"} is four-month period. The semiannual
#' periodicity (\code{"S"}) applies only to municipalities with less than 50
#' thousand inhabitants that opted for simplified publication. Default is
#' \code{"Q"}
#' @param annex is a numeric vector, an integer between 1 and 6.
#' Default is \code{NULL}, it will get all attachments.
#' @param power is a character vector, an acronym for each power,
#' executive \code{"E"}, legislative \code{"L"}, judiciary \code{"J"},
#' public ministry \code{"M"}, Public defense \code{"D"}.
#' Default is \code{c("E", "L", "J", "M", "D")}
#' @param sphere is a string vector. Sphere filter "M" = Municipalities, "E" = States and "DF", "U" = Union and "C" = Consortium. Default is \code{NULL}
#' @param verbose is a logical. Enable verbose mode. Default is \code{FALSE}
#' @return \code{tibble}
#' @details
#' For more details on the parameter \code{cod} see the column \code{cod_ibge}
#' of the function \code{\link{get_info}}
#' @examples
#' \donttest{
#' get_fiscal(year = 2019, period = 1:3, cod = 35, power = "E")
#' }
#' \donttest{
#' get_fiscal(year = 2017, period = 2, annex = 1, cod = 1)
#' }
#' @note
#' Brazilian Public Sector Accounting and Tax Information System (Siconfi):
#' \url{http://apidatalake.tesouro.gov.br/docs/siconfi/}
#' @importFrom rlang is_null
#' @export

get_fiscal <- function(year,
                       period,
                       cod,
                       freq = "Q",
                       annex = NULL,
                       power = c("E", "L", "J", "M", "D"),
                       sphere = NULL,
                       verbose = FALSE) {
  get(
    type = "rgf",
    an_exercicio = year,
    nr_periodo = period,
    id_ente = cod,
    in_periodicidade = freq,
    co_tipo_demonstrativo = if (freq == "Q") "RGF" else "RGF Simplificado",
    no_anexo = if (!rlang::is_null(annex)) {
      paste0("RGF-Anexo 0", annex)
    } else {
      annex
    },
    co_poder = power,
    co_esfera = sphere,
    verbose = verbose
  )
}