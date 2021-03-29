#' @title Attachments of reports by sphere of government
#' @description Refers to the annexes to each of the reports/statements grouped
#' by sphere of government
#' @param verbose is a logical. Enable verbose mode. Default is \code{FALSE}
#' @return \code{tibble}
#' @examples
#' get_annex()
#' @export

get_annex <- function(verbose = FALSE) {
  req(type = "anexos-relatorios", query = NULL, verbose = verbose)
}