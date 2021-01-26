#' Basic information of Brazilian municipalities and states
#'
#' A data set containing some information about all Municipalities,
#' States and the Federal District
#'
#' @format A data frame with 5597 rows and 9 variables:
#' \describe{
#'   \item{cod_ibge}{City or State id}
#'   \item{ente}{name of the City or State}
#'   \item{capital}{if (1), then it is state capital, if (0) is not capital}
#'   \item{regiao}{abbreviation of the location of the State or City
#'   Midwest ("CO"), North ("NO"), Northeast ("NE"), Southeast ("SU") and ("BR")
#'   for the Union.}
#'   \item{uf}{abbreviation of the name of the state where the city is located}
#'   \item{esfera}{scope of the municipality, state or district.
#'   District ("D"), State ("E"), City ("M"), Union ("U")}
#'   \item{exercicio}{year the data was downloaded}
#'   \item{populacao}{population}
#'   \item{cnpj}{id used by companies/entities, called the National Register
#'   of Legal Entities}
#' }
#' @source
#' \url{http://apidatalake.tesouro.gov.br/docs/siconfi/#/Entes/get_entes}
"entes_br"