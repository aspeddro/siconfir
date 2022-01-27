#' @title Basic information on Brazilian states and municipalities
#' @description Get basic information about all the entities of the federation
#' @param verbose is a logical. Enable verbose mode. Default is \code{FALSE}
#' @return \code{tibble}
#' @note
#' Brazilian Public Sector Accounting and Tax Information System (Siconfi):
#' \url{http://apidatalake.tesouro.gov.br/docs/siconfi/}
#' @export

get_info <- function(verbose = FALSE) {
  request(type = "entes", query = NULL, verbose = verbose)
}
