#' @importFrom RCurl getURL
#' @importFrom jsonlite validate fromJSON
#' @importFrom purrr map

req <- function(type, query) {
  msm_alert <- function(...) {
    paste(
      ...,
      purrr::map(
        names(query), ~ paste0(substring(., 4), ": ", query[[.]], "\n")
      )
    )
  }
  path <- build_url(type, query)
  Sys.sleep(1)
  response <- RCurl::getURL(utils::URLencode(path), .encoding = "UFT-8")
  if (!jsonlite::validate(response)) {
    stop("Invalid data for the following request:\n", msm_alert())
  }
  content <- jsonlite::fromJSON(response)
  if (length(content$items) == 0) {
    message("Not found data for the following request:\n", msm_alert())
  } else {
    content$items
  }
}