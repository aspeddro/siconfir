#' @importFrom tidyr unnest
#' @importFrom dplyr transmute
#' @importFrom purrr map_lgl pmap cross_df

get <- function(type, ...) {
  rest <- list(...)
  querys <- rest[!purrr::map_lgl(rest, is.null)]
  
  purrr::cross_df(querys) %>% 
    dplyr::transmute(
      data = purrr::pmap(.,
        ~ with(list(...), req(type = type, query = list(...)))
      )
    ) %>% 
    tidyr::unnest(cols = "data")
}