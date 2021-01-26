#' @title Fiscal Management Report
#' @description Access the Fiscal Management Report
#' @param year is a numeric vector
#' @param freq is a character, periodicity of publication of the report,
#' \code{"S"} is semiannual, \code{"Q"} is four-month period. The semiannual
#' periodicity (\code{"S"}) applies only to municipalities with less than 50
#' thousand inhabitants that opted for simplified publication. Default is
#' \code{"Q"}
#' @param period is a numeric vector, period of the year, if the parameter
#' \code{freq} is \code{"Q"} then it will be an integer between 1 and 3.
#' If \code{freq} is \code{"S"} then it will be an integer between 1 and 2.
#' @param annex is a numeric vector, an integer between 1 and 6.
#' The default value is \code{NULL}, it will get all attachments.
#' @param power is a character vector, an acronym for each power,
#' executive \code{"E"}, legislative \code{"L"}, judiciary \code{"J"},
#' public ministry \code{"M"}, Public defense \code{"D"}.
#' Default is \code{c("E", "L", "J", "M", "D")}
#' @param id is a numeric vector. Brazilian Institute of Geography and
#' Statistics (IBGE) code assigned to each municipality and state.
#' @return \code{tibble}
#' @details
#' For more details on the parameter \code{id} see the column \code{cod_ibge}
#' of the function \code{get_entes()}
#' @examples
#' get_rgf(year = 2020, period = 1, id = 17)
#' get_rgf(year = 2019, period = 1:3, id = 35, power = "E")
#' get_rgf(year = 2017, period = 2, annex = 1, power = c("E", "L", "J"))
#' @note
#' Brazilian Public Sector Accounting and Tax Information System (Siconfi):
#' http://apidatalake.tesouro.gov.br/docs/siconfi/
#' @export

get_rgf <- function(year,
                    freq = "Q",
                    period,
                    annex = NULL,
                    power = c("E", "L", "J", "M", "D"),
                    id) {
  get(
    type = "rgf",
    an_exercicio = year,
    in_periodicidade = freq,
    nr_periodo = period,
    co_tipo_demonstrativo = if (freq == "Q") "RGF" else "RGF Simplificado",
    no_anexo = if (!is.null(annex)) paste0("RGF-Anexo 0", annex) else annex,
    co_poder = power,
    id_ente = id
  )
}