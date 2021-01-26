#' @import tibble
#' @import tidyr
#' @import dplyr
#' @import purrr
#' @import magrittr

get <- function(type, ...) {
  rest <- list(...)
  querys <- rest[!purrr::map_lgl(rest, is.null)]

  tidyr::as_tibble(querys) %>%
    tidyr::unnest(cols = c()) %>%
    tidyr::expand_grid() %>%
    dplyr::transmute(
      data = purrr::pmap(.,
        ~ with(list(...), req(type = type, query = list(...)))
      )
    ) %>%
    tidyr::unnest(cols = data)
}