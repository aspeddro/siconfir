#' @title Find state or municipality information
#' @param query is a character
#' @param view is a logical, \code{TRUE} open Data Viewer. Default is \code{FALSE}
#' @examples
#' find_cod("rio de janeiro")
#' find_cod("bahia")
#' @return \code{tibble}
#' @importFrom dplyr filter
#' @importFrom purrr map
#' @importFrom utils View
#' @export

find_cod <- function(query = NULL, view = FALSE) {

  df <- siconfir::br_cods

  if (!is.null(query) && !is.character(query) || length(query) > 1) {
    stop("Invalid type, use character")
  }
  if (!is.null(query) &&
      is.character(query) &&
      grepl("^\\s*$", query, ignore.case = T)
    ) {
    stop("Empty query")
  }
  if (is.null(query)) {
    if (view) {
      utils::View(df)
    }
    return(df)
  }

  results <- purrr::map(
    df$ente,
    ~ grep(pattern = as.character(query), x = ., value = T, ignore.case = T)
  ) %>% unlist()

  df_results <- dplyr::filter(df, df$ente %in% unlist(results))
  if (view) {
    View(df_results)
  }
  df_results
}