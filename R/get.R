#' @importFrom dplyr bind_rows
#' @importFrom purrr map_lgl pmap cross_df reduce

get <- function(type, verbose, ...) {
  rest <- list(...)
  querys <- rest[!purrr::map_lgl(rest, is.null)]
  
  purrr::cross_df(querys) %>% 
    purrr::pmap(., ~req(type = type, query = list(...), verbose = verbose)) %>% 
    purrr::reduce(dplyr::bind_rows)
}