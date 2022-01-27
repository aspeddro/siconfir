# Build Datasets
devtools::load_all()

# FIX:
# `capital` to numeric type
# for `uf` == 'TO' replace `regiao` to `NO`
# for `cod_ibge` == 17 replace `regiao` to `NO`
get_info() %>%
  dplyr::mutate(
    capital = as.numeric(capital),
    regiao = dplyr::case_when(
      uf == "TO" ~ "NO",
      cod_ibge == 17 ~ "NO",
      TRUE ~ as.character(regiao)
    )
  ) %>%
  usethis::use_data(br_cods, overwrite = TRUE)