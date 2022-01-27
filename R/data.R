#' Basic information of Brazilian municipalities and states
#'
#' A data set containing some information about all municipalities,
#' states and the Federal District
#'
#' @format A data frame with 5597 rows and 9 variables:
#' \describe{
#'   \item{cod_ibge}{state or municipality id}
#'   \item{ente}{name of the state or municipality}
#'   \item{capital}{if \code{1}, then it is state capital, if \code{0} is not
#'    capital}
#'   \item{regiao}{abbreviation of the location of the state or municipality,
#'   Midwest ("CO"), North ("NO"), Northeast ("NE"), Southeast ("SU") and ("BR")
#'   for the Union}
#'   \item{uf}{abbreviation of the name of the state where the municipality is
#'   located. For states abbreviation is \code{"BR"}}
#'   \item{esfera}{scope of the municipality, state or district.
#'   District ("D"), State ("E"), Municipality ("M"), Union ("U")}
#'   \item{exercicio}{year the data was downloaded}
#'   \item{populacao}{population}
#'   \item{cnpj}{id used by companies/entities, called the National Register
#'   of Legal Entities}
#' }
#' @source
#' \url{http://apidatalake.tesouro.gov.br/docs/siconfi/#/Entes/get_entes}
"br_cods"
