#' @title Basic information of the federation entities
#' @description Get basic information about all the entities of the federation:
#' @return \code{tibble}
#' @note
#' Brazilian Public Sector Accounting and Tax Information System (Siconfi):
#' http://apidatalake.tesouro.gov.br/docs/siconfi/
#' @import RCurl
#' @import tibble
#' @import jsonlite
#' @export

get_entes <- function() {
  response <- RCurl::getURL(utils::URLencode(api("entes")), .encoding = "UTF-8")
  if (!jsonlite::validate(response)) {
    stop("Error, invalid data")
  }
  content <- jsonlite::fromJSON(response)
  tibble::as_tibble(content$items)
}