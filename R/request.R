#' @importFrom httr GET status_code http_status content config
#' @importFrom rlang abort is_null inform
http_request <- function(url, query, verbose) {
  # API has 1 second limit per request
  Sys.sleep(1)

  response <- httr::GET(
    url = url,
    query = query,
    httr::accept_json(),
    httr::config(verbose = verbose)
  )

  if (httr::status_code(response) != 200) {
    rlang::abort(httr::http_status(response)$message)
  }

  content <- httr::content(response)

  if (length(content$items) == 0 && !rlang::is_null(query)) {
    rlang::inform("Not found data")
  }

  list(
    items = content$items,
    hasMore = content$hasMore,
    offset = content$limit + content$offset
  )
}

#' @importFrom purrr prepend
fetch_recursive <- function(url, query, verbose, new_data = NULL) {
  data <- http_request(url, query, verbose)

  if (data$hasMore) {
    return(
      fetch_recursive(
        url = url,
        query = purrr::prepend(query, list(offset = data$offset)),
        new_data = c(data$items, new_data),
        verbose = verbose
      )
    )
  }

  c(data$items, new_data)
}

#' @importFrom utils URLencode
#' @importFrom tibble tibble
#' @importFrom tidyr unnest_wider
request <- function(type, query, verbose) {
  fetch_recursive(api(type), query, verbose) %>%
    tibble::tibble() %>%
    tidyr::unnest_wider(col = ".")
}
