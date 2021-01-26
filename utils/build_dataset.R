# Make Data sets
library(devtools)
devtools::load_all()

library(tidyverse)

# FIX
## `capital` to numeric type
## for `uf` == 'TO' replace `regiao` to `NO`
entes_br <- get_entes() %>%
  dplyr::mutate(
    capital = as.numeric(capital),
    regiao = ifelse(uf == "TO", "NO", regiao)
  )

usethis::use_data(entes_br, entes_br, overwrite = T)