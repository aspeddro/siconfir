#' @importFrom purrr map

build_url <- function(type, query) {
  params <- purrr::map(names(query), function(n) paste0(n, "=", query[[n]]))
  paste0(api(type), paste(params, collapse = "&"))
}