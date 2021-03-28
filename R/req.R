#' @importFrom purrr map
#' @importFrom tibble tibble
#' @importFrom tidyr unnest_wider
#' @importFrom httr GET status_code http_status content

http_request <- function(url, query, verbose) {

  alert <- function() {
    paste(
      purrr::map(
        names(query), ~ paste0(substring(., 4), ": ", query[[.]], "\n")
      )
    )
  }

  Sys.sleep(1)

  if (!is.null(query)) {
    response <- httr::GET(
      url = url,
      query = query
    )
  } else {
    response <- httr::GET(url = url)
  }
  
  if (httr::status_code(response) != 200) {
    stop(httr::http_status(response)$message)
  }

  if (verbose) {
    print(response)
  }

  content <- httr::content(response)

  if (length(content$items) == 0 && !is.null(query)) {
    message("Not found data for:\n", alert())
  }

  has_offset <- ifelse(content$hasMore, 
    purrr::map(content$links, ~ .[["href"]][.[[1]] == "next"]) %>% 
      .[purrr::map_lgl(., ~ length(.) > 0)] %>% .[[1]],
    FALSE
  )

  list(items = content$items, hasMore = content$hasMore, offset = has_offset)
}

fetch_rec <- function(url, query = NULL, verbose, old = NULL) {

  df <- http_request(url = url, query = query, verbose = verbose)
  
  if (df$hasMore) {
    return(fetch_rec(url = df$offset, old = c(df$items, old), verbose = verbose))
  }

  c(df$items, old)
}

req <- function(type, query, verbose) {

  df <- fetch_rec(url = utils::URLencode(api(type)), query = query, verbose = verbose)

  tibble::tibble(data = df) %>% 
    tidyr::unnest_wider(col = "data")
}