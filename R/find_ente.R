#' @title find city or state information
#' @param query is a character
#' @param v is a logical, \code{TRUE} open Data Viewer. Default is \code{FALSE}
#' @examples
#' find_ente("rio de janeiro")
#' find_ente("bahia")
#' @return \code{tibble}
#' @import dplyr
#' @importFrom purrr map
#' @importFrom utils View
#' @export

find_ente <- function(query = NULL, v = FALSE) {

  df <- siconfir::entes_br

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
    if (v) utils::View(df)
    return(df)
  }

  results <- purrr::map(
    df$ente,
    ~ grep(pattern = as.character(query), x = ., value = T, ignore.case = T)
  ) %>% unlist()

  df_results <- dplyr::filter(df, df$ente %in% unlist(results))
  if (v) {
    View(df_results)
  }
  df_results
}