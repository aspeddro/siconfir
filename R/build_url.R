#' @import purrr
#' @import magrittr

build_url <- function(type, query) {
  purrr::map(names(query), ~ paste0(., "=", query[[.]])) %>%
  paste(., collapse = "&") %>%
  paste0(api(type), .)
}