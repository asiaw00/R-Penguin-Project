# libraries ---------------------------------------------------------------
library(tidyverse)
# -------------------------------------------------------------------------

# Summary of numeric variables
summarize_numeric_var <- function(data) {
  summary(data)
}


# Summary of missing values
summarize_missing_values <- function(data) {
  data |>
    dplyr::summarise(
      dplyr::across(
        dplyr::everything(),
        ~ sum(is.na(.x))
      )
    ) |>
    tidyr::pivot_longer(
      cols = dplyr::everything(),
      names_to = "variable",
      values_to = "missing_count"
    ) |>
    dplyr::mutate(
      missing_percent = missing_count / nrow(data)
    )
}


# Summary of average body mass by species
summarize_average_bodymass <- function(data) {
  data |>
    dplyr::group_by(species) |>
    dplyr::summarise(
      average_bm = mean(body_mass_g)
    )
}


# Summary of average flipper length by species
summarize_flipper_length <- function(data) {
  data |>
    dplyr::group_by(species) |>
    dplyr::summarise(
      average_flipper_length = mean(flipper_length_mm)
    )
}


# Summary of species count by island
summarize_island_count <- function(data) {
  data |>
    dplyr::group_by(species, island) |>
    dplyr::summarise(
      count = dplyr::n()
    )
}
