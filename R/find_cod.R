#' @title Find state or municipality information
#' @param query name of city/state, is a character
#' @examples
#' find_cod("rio de janeiro")
#' find_cod("bahia")
#' @return \code{tibble}
#' @importFrom dplyr filter
#' @importFrom stringr str_detect
#' @importFrom rlang is_character abort
#' @export

find_cod <- function(query) {
  if (!rlang::is_character(query)) {
    rlang::abort("Argument `query` must be a character")
  }

  siconfir::br_cods %>%
    dplyr::filter(stringr::str_detect(ente, query))
}
