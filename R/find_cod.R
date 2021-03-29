#' @title Find state or municipality information
#' @param query is a character
#' @param view is a logical, \code{TRUE} open Data Viewer. Default is
#' \code{FALSE}
#' @examples
#' find_cod("rio de janeiro")
#' find_cod("bahia")
#' @return \code{tibble}
#' @importFrom dplyr filter
#' @importFrom purrr map
#' @importFrom utils View
#' @export

find_cod <- function(query, view = FALSE) {

  df <- siconfir::br_cods

  if (!is.character(query)) {
    stop("Argument query must be character")
  }

  if (grepl("^\\s*$", query, ignore.case = TRUE)) {
    stop("Empty query")
  }

  results <- purrr::map(
    df$ente,
    ~ grep(pattern = as.character(query), x = ., value = T, ignore.case = T)
  ) %>% unlist()

  df_results <- dplyr::filter(df, df$ente %in% unlist(results))

  if (nrow(df_results) == 0) {
    stop(paste("No city or state found with name", query))
  }

  if (view) {
    utils::View(df_results)
  }
  df_results
}