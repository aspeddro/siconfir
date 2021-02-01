siconfir
================

<!-- badges: start -->

[![Lifecycle:
maturing](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
![GitHub
release](https://img.shields.io/github/v/release/pedrocastroo/siconfir.svg?include_prereleases)
<!-- badges: end -->

`siconfir` é um pacote `R` para acessar dados do Sistema de Informações
Contábeis e Tributárias do Setor Público Brasileiro (Siconfi/Tesouro
Nacional). Relatórios fiscais, relatórios de execução orçamentária,
balanços e declaração de contas anuais.

## Instalação

``` r
# install.packages("devtools")
devtools::install_github("pedrocastroo/siconfir")
```

## Uso

``` r
library(siconfir)
```

O pacote fornece cinco funções:

-   `get_rreo()`: Relatório Resumido de Execução Orçamentária (RREO)
-   `get_rgf()`: Relatório de Gestão Fiscal (RGF)
-   `get_dca()`: Declaração de Contas Anuais (DCA)
-   `get_entes()`: Informações básicas de todos os entes da federação
-   `find_ente()`: Busca informação pelo nome do ente

### `get_rreo`

Relatório Resumido de Execução Orçamentária (RREO)

Argumentos:

-   `year`: ano

    > `numeric vector`

-   `period`: bimestre de referência do relatório dentro de um
    exercício.

    > `numeric vector`

-   `simple`: especifica o tipo do relatório (RREO), `TRUE` aplica-se
    apenas aos municípios com menos de 50 mil habitantes que optaram
    pela publicação simplificada.

    > `logical` \| Padrão é `TRUE`

-   `annex`: nome do anexo no demonstrativo

    > `character vector` \| Padrão é `NULL`

    Se nenhum valor for fornecido todos os anexos disponíveis serão
    retornados

    Valores possíveis:
    `"01", "02", "03", "04", "04 - RGPS", "04 - RPPS", "04.0 - RGPS", "04.1", "04.2", "04.3 - RGPS", "05", "06", "07", "09", "10 - RGPS", "10 - RPPS", "11", "13", "14"`

-   `id`: código IBGE do ente

    > `numeric vector`

``` r
# acessando RREO do 4 bimestre de 2020 do Estado de São Paulo
get_rreo(year = 2020, period = 4, id = 35)
```

    ## # A tibble: 3,953 x 14
    ##    exercicio demonstrativo periodo periodicidade instituicao cod_ibge uf   
    ##        <int> <chr>           <int> <chr>         <chr>          <int> <chr>
    ##  1      2020 RREO                4 B             Governo do…       35 SP   
    ##  2      2020 RREO                4 B             Governo do…       35 SP   
    ##  3      2020 RREO                4 B             Governo do…       35 SP   
    ##  4      2020 RREO                4 B             Governo do…       35 SP   
    ##  5      2020 RREO                4 B             Governo do…       35 SP   
    ##  6      2020 RREO                4 B             Governo do…       35 SP   
    ##  7      2020 RREO                4 B             Governo do…       35 SP   
    ##  8      2020 RREO                4 B             Governo do…       35 SP   
    ##  9      2020 RREO                4 B             Governo do…       35 SP   
    ## 10      2020 RREO                4 B             Governo do…       35 SP   
    ## # … with 3,943 more rows, and 7 more variables: populacao <int>, anexo <chr>,
    ## #   rotulo <chr>, coluna <chr>, cod_conta <chr>, conta <chr>, valor <dbl>

<details>
<summary>
Mais Exemplos
</summary>

``` r
# acessando o anexo "01" do RREO da cidade de São Paulo
get_rreo(year = 2019, period = 4, annex = "01", id = 3550308)

# acessando o anexo "01" do RREO do 4ªbimestre de 2020 e 2019 da cidade de SP
get_rreo(year = 2019:2020, period = 4, anexo = "01", id = 3550308)

# acessando todos os bimestres de 2019 do RREO do DF
get_rreo(year = 2019, period = 1:6, id = 53)

# acsessando RREO de Serra da Saudade - MG, município com população estimada (2020) em 776 pessoas
get_rreo(year = 2020, simple = TRUE, period = 1, id = 3166600)
```

</details>

### `get_rgf`

Relatório de Gestão Fiscal (RGF)

Argumentos:

-   `year`: ano

    > `numeric vector`

-   `freq`: periodicidade da publicação do relatório, `"S"` (semestral)
    ou `"Q"` (quadrimestral). A periodicidade semestral aplica-se apenas
    aos municípios com menos de 50 mil habitantes que optaram pela
    publicação simplificada.

    > `character` \| Padrão é `"Q"`

-   `period`: quadrimestre ou semestre de referência do relatório dentro
    de um exercício.

    > `numeric vector`

-   `annex`: número do anexo

    > `numeric vector` \| Padrão é `NULL`

    Valores possíveis: `1, 2, 3, 4, 5, 6`

    Se nenhum valor for fornecido todos os anexos disponíveis serão
    retornados

-   `power`: abreviação do poder/orgão. Executivo `"E"`, Legislativo
    `"L"`, Judiciário `"J"`, Ministério Público `"M"` e Defensoria
    Pública `"D"`

    > `character vector` \| Padrão é `c("E", "L", "J", "M", "D")`

    Se nenhum valor for passado a função retorna dados para todos os
    poderes/orgãos disponíveis.

-   `id`: código IBGE do ente

    > `numeric vector`

``` r
# acessando RGF do 2 quadrimestre de 2020 do Estado de Sergipe (todos os poderes inclusos)
get_rgf(year = 2020, period = 2, id = 28)
```

    ## # A tibble: 854 x 14
    ##    exercicio periodo periodicidade instituicao cod_ibge uf    co_poder populacao
    ##        <int>   <int> <chr>         <chr>          <int> <chr> <chr>        <int>
    ##  1      2020       2 Q             Governo do…       28 SE    E          2298696
    ##  2      2020       2 Q             Governo do…       28 SE    E          2298696
    ##  3      2020       2 Q             Governo do…       28 SE    E          2298696
    ##  4      2020       2 Q             Governo do…       28 SE    E          2298696
    ##  5      2020       2 Q             Governo do…       28 SE    E          2298696
    ##  6      2020       2 Q             Governo do…       28 SE    E          2298696
    ##  7      2020       2 Q             Governo do…       28 SE    E          2298696
    ##  8      2020       2 Q             Governo do…       28 SE    E          2298696
    ##  9      2020       2 Q             Governo do…       28 SE    E          2298696
    ## 10      2020       2 Q             Governo do…       28 SE    E          2298696
    ## # … with 844 more rows, and 6 more variables: anexo <chr>, rotulo <chr>,
    ## #   coluna <chr>, cod_conta <chr>, conta <chr>, valor <dbl>

``` r
# acessando RGF do 3 quadrimestre de 2018 da cidade de Palmas-TO, apenas RGF do executivo, legislativo e judiciário
get_rgf(year = 2018, period = 3, id = 1721000, power = c("E", "L", "J"))
```

    ## Not found data for the following request:
    ## exercicio: 2018
    ## periodicidade: Q
    ## periodo: 3
    ## tipo_demonstrativo: RGF
    ## poder: J
    ## ente: 1721000

    ## # A tibble: 563 x 14
    ##    exercicio periodo periodicidade instituicao cod_ibge uf    co_poder populacao
    ##        <int>   <int> <chr>         <chr>          <int> <chr> <chr>        <int>
    ##  1      2018       3 Q             Prefeitura…  1721000 TO    E           279856
    ##  2      2018       3 Q             Prefeitura…  1721000 TO    E           279856
    ##  3      2018       3 Q             Prefeitura…  1721000 TO    E           279856
    ##  4      2018       3 Q             Prefeitura…  1721000 TO    E           279856
    ##  5      2018       3 Q             Prefeitura…  1721000 TO    E           279856
    ##  6      2018       3 Q             Prefeitura…  1721000 TO    E           279856
    ##  7      2018       3 Q             Prefeitura…  1721000 TO    E           279856
    ##  8      2018       3 Q             Prefeitura…  1721000 TO    E           279856
    ##  9      2018       3 Q             Prefeitura…  1721000 TO    E           279856
    ## 10      2018       3 Q             Prefeitura…  1721000 TO    E           279856
    ## # … with 553 more rows, and 6 more variables: anexo <chr>, rotulo <chr>,
    ## #   coluna <chr>, cod_conta <chr>, conta <chr>, valor <dbl>

<sub>⚠️ Palmas - TO não possui dados do RGF para o poder `"J"`</sub>

<details>
<summary>
Mais Exemplos
</summary>

``` r
# acessando RGF do primeiro semestre de 2015 de Bocaina-SP, cidade com população estimada (2020) igual a 12452
get_rgf(year = 2015, freq = "S", period = 1, id = 3506805)

# acessando RGF da União de 2019 para todos os quadrimestre e poderes, apenas o anexo 1 (Demonstrativo da Despesas com Pessoal)
get_rgf(year = 2019, period = 1:3, annex = 1, id = 1)
```

</details>

### `get_dca`

Declaração de Contas Anuais (DCA)

Argumentos:

-   `year`: ano

    > `numeric vector`

-   `annex`: nome do anexo

    > `character vector`

    Valores possíveis:
    `"Anexo I-AB", "Anexo I-C", "Anexo I-D", "Anexo I-E", "Anexo I-F", "Anexo I-G", "Anexo I-HI", "DCA-Anexo I-AB", "DCA-Anexo I-C", "DCA-Anexo I-D", "DCA-Anexo I-E", "DCA-Anexo I-F", "DCA-Anexo I-G", "DCA-Anexo I-HI"`

    Se nenhum valor for fornecido todos os anexos disponíveis serão
    retornados

    > ⚠️ As contas do exercício de 2013 foram entregues em dois
    > formatos: QDCC para entes que não haviam aderido ao PCASP e DCA
    > para todos os demais. Assim apenas os anexos que possuem o prefixo
    > DCA são referentes a esse relatório, os demais anexos referem-se
    > aos dados do QDCC de 2013. [Siconfi Docs
    > API](http://apidatalake.tesouro.gov.br/docs/siconfi/#/DCA)

-   `id`: código IBGE do ente

    > `numeric vector`

``` r
# acessando Declaração de contas anuais do Tocantins de 2019
get_dca(year = 2019, id = 17)
```

    ## # A tibble: 2,924 x 11
    ##    exercicio instituicao cod_ibge uf    anexo rotulo coluna cod_conta conta
    ##        <int> <chr>          <int> <chr> <chr> <chr>  <chr>  <chr>     <chr>
    ##  1      2019 Governo do…       17 TO    DCA-… Padrão 31/12… P1.0.0.0… 1.0.…
    ##  2      2019 Governo do…       17 TO    DCA-… Padrão 31/12… P1.1.0.0… 1.1.…
    ##  3      2019 Governo do…       17 TO    DCA-… Padrão 31/12… P1.1.1.0… 1.1.…
    ##  4      2019 Governo do…       17 TO    DCA-… Padrão 31/12… P1.1.1.1… 1.1.…
    ##  5      2019 Governo do…       17 TO    DCA-… Padrão 31/12… P1.1.1.1… 1.1.…
    ##  6      2019 Governo do…       17 TO    DCA-… Padrão 31/12… P1.1.1.1… 1.1.…
    ##  7      2019 Governo do…       17 TO    DCA-… Padrão 31/12… P1.1.2.0… 1.1.…
    ##  8      2019 Governo do…       17 TO    DCA-… Padrão 31/12… P1.1.2.3… 1.1.…
    ##  9      2019 Governo do…       17 TO    DCA-… Padrão 31/12… P1.1.2.3… 1.1.…
    ## 10      2019 Governo do…       17 TO    DCA-… Padrão 31/12… P1.1.2.4… 1.1.…
    ## # … with 2,914 more rows, and 2 more variables: valor <dbl>, populacao <int>

<details>
<summary>
Mais Exemplos
</summary>

``` r
# acessando DCA de 2017 a 2019 da União
get_dca(year = 2017:2019, id = 1)

# acessando DCA de 2015 do Estado do Amazonas
get_dca(year = 2015, id = 13)
```

</details>

### `get_entes`

Informações de todos os entes da Federação

A função não possui argumentos. Ela retorna uma `tibble` com as
seguintes colunas:

-   `cod_ibge`: código de identificação do ente

-   `ente`: nome do ente

-   `capital`: um valor binário, se `1` então o ente é capital do
    Estado.

    > ⚠️ `capital` é do tipo `character`

-   `regiao`: abreviação da região do ente. Centro-Oeste `"CO"`, Norte
    `"NO"`, Nordeste `"NE"`, Sudeste `"SU"` e `"BR"` para a União.

-   `uf`: abreviação da Unidade Federativa

-   `esfera`: esfera do ente. Estado `"E"`, Município `"M"`, Distrito
    `"D"` e União `"U"`

-   `exercicio`: ano da requisição

-   `populacao`: população do Município ou Estado/DF

    > ⚠️ Somente a população de Brasília (5300108) e União (1) diverge
    > da estimativa oficial de 2020 feita pelo IBGE. Requer uma
    > verificação

-   `cnpj`: CNPJ do ente

    > Requer uma verificação

``` r
get_entes()
```

    ## # A tibble: 5,597 x 9
    ##    cod_ibge ente         capital regiao uf    esfera exercicio populacao cnpj   
    ##       <int> <chr>        <chr>   <chr>  <chr> <chr>      <int>     <int> <chr>  
    ##  1  1718659 Rio da Conc… "0  "   CO     TO    M           2021      2171 332625…
    ##  2  1718709 Rio dos Bois "0  "   CO     TO    M           2021      2856 374209…
    ##  3  1718758 Rio Sono     "0  "   CO     TO    M           2021      6488 000007…
    ##  4  1718808 Sampaio      "0  "   CO     TO    M           2021      4794 250868…
    ##  5  1718840 Sandolândia  "0  "   CO     TO    M           2021      3373 373443…
    ##  6  1718865 Santa Fé do… "0  "   CO     TO    M           2021      7595 250639…
    ##  7  1718881 Santa Maria… "0  "   CO     TO    M           2021      3486 374210…
    ##  8  1718899 Santa Rita … "0  "   CO     TO    M           2021      2386 016131…
    ##  9  1718907 Santa Rosa … "0  "   CO     TO    M           2021      4846 248515…
    ## 10  1719004 Santa Terez… "0  "   CO     TO    M           2021      2897 250868…
    ## # … with 5,587 more rows

### `entes_br` dataset

`entes_br` é um dataset local com algumas correções, veja
[`utils/build_dataset.R`](utils/build_dataset.R)

<details>
<summary>
Mais Exemplos
</summary>

``` r
library(dplyr, warn.conflicts = F)
# somente as capitais
entes_br %>% 
  filter(capital == 1)
```

    ## # A tibble: 27 x 9
    ##    cod_ibge ente      capital regiao uf    esfera exercicio populacao cnpj      
    ##       <int> <chr>       <dbl> <chr>  <chr> <chr>      <int>     <int> <chr>     
    ##  1  1721000 Palmas          1 NO     TO    M           2021    306296 248515110…
    ##  2  1100205 Porto Ve…       1 NO     RO    M           2021    539354 059031250…
    ##  3  1200401 Rio Bran…       1 NO     AC    M           2021    413418 040345830…
    ##  4  1302603 Manaus          1 NO     AM    M           2021   2219580 043653260…
    ##  5  1400100 Boa Vista       1 NO     RR    M           2021    419652 059430300…
    ##  6  1501402 Belém           1 NO     PA    M           2021   1499641 050550090…
    ##  7  1600303 Macapá          1 NO     AP    M           2021    512902 059957660…
    ##  8  2507507 João Pes…       1 NE     PB    M           2021    817511 087783260…
    ##  9  2111300 São Luís        1 NE     MA    M           2021   1108975 063071020…
    ## 10  2211001 Teresina        1 NE     PI    M           2021    868075 065548690…
    ## # … with 17 more rows

``` r
# pegando somente as cidades do Tocantins com populaçao > 50000
entes_br %>% 
  filter(uf == "TO", populacao > 50000)
```

    ## # A tibble: 5 x 9
    ##   cod_ibge ente         capital regiao uf    esfera exercicio populacao cnpj    
    ##      <int> <chr>          <dbl> <chr>  <chr> <chr>      <int>     <int> <chr>   
    ## 1  1721000 Palmas             1 NO     TO    M           2021    306296 2485151…
    ## 2  1702109 Araguaína          0 NO     TO    M           2021    183381 0183079…
    ## 3  1709500 Gurupi             0 NO     TO    M           2021     87545 0180361…
    ## 4  1716109 Paraíso do …       0 NO     TO    M           2021     51891 0029918…
    ## 5  1718204 Porto Nacio…       0 NO     TO    M           2021     53316 0029919…

</details>

### `find_ente`

Busca informações pelo nome do ente

Argumentos:

-   `v`: abre o visualizador de dados

    > `logical` \| Padrão é `FALSE`

``` r
# procurando municípios e estados com a palavra joão
find_ente("joão")
```

    ## # A tibble: 68 x 9
    ##    cod_ibge ente        capital regiao uf    esfera exercicio populacao cnpj    
    ##       <int> <chr>         <dbl> <chr>  <chr> <chr>      <int>     <int> <chr>   
    ##  1  1400506 São João d…       0 NO     RR    M           2021      8348 0405624…
    ##  2  1507466 São João d…       0 NO     PA    M           2021      6217 0161332…
    ##  3  1507474 São João d…       0 NO     PA    M           2021     23244 2298115…
    ##  4  1507508 São João d…       0 NO     PA    M           2021     14051 0585453…
    ##  5  2507507 João Pessoa       1 NE     PB    M           2021    817511 0877832…
    ##  6  2105500 João Lisboa       0 NE     MA    M           2021     23740 0700030…
    ##  7  2111003 São João B…       0 NE     MA    M           2021     20701 3510136…
    ##  8  2111029 São João d…       0 NE     MA    M           2021     15787 0161234…
    ##  9  2111052 São João d…       0 NE     MA    M           2021     11193 0159762…
    ## 10  2111078 São João d…       0 NE     MA    M           2021     18645 0161262…
    ## # … with 58 more rows

## Limitações

A API permite apenas uma requisição por segundo

## TODO

-   [ ] `README` english
-   [ ] Add Matriz de Saldos Contábeis - contas patrimoniais
-   [ ] Add Matriz de Saldos Contábeis - contas orçamentárias
-   [ ] Add Matriz de Saldos Contábeis - contas de controle
-   [ ] Melhorar a documentação

## Contribuições

-   Bugs ou sugestões: abra uma
    [issue](https://github.com/pedrocastroo/siconfir/issues) detalhando
    o problema/sugestão, seja o mais reprodutível possível.

-   Implementação: se você deseja implementar uma função ou melhorar
    algo, abra uma pull.
