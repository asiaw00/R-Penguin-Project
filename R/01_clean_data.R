# libraries --------------------------------------------------------------
library(tidyverse)
library(here)
library(janitor)
# -------------------------------------------------------------------------
penguins_clean <- read.csv(here("data", "raw", "penguins.csv")) |>
  janitor::clean_names() |>
  na.omit() |>
  mutate(
    species = as.factor(species),
    island = as.factor(island),
    sex = as.factor(sex),
    body_mass_kg = body_mass_g / 1000,
    bill_ratio = bill_length_mm / bill_depth_mm
  )

readr::write_csv(
  penguins_clean,
  here("data", "processed", "penguins_clean.csv")
)
