#' @importFrom dplyr bind_rows
#' @importFrom purrr map_lgl pmap cross_df reduce keep
#' @importFrom rlang is_null dots_list

get <- function(type, verbose, ...) {
  purrr::keep(rlang::dots_list(...), ~ !rlang::is_null(.x)) %>%
    purrr::cross() %>%
    purrr::map_df(~ request(type = type, query = .x, verbose = verbose))
}