# libraries ---------------------------------------------------------------
library(DBI)
library(RSQLite)
library(dplyr)
library(dbplyr)
library(here)
# -------------------------------------------------------------------------
# connect to database
con <- dbConnect(
  RSQLite::SQLite(),
  here("data", "processed", "penguins.sqlite")
)

# write to another table
dbWriteTable(
  con,
  "penguins",
  penguins_clean,
  overwrite = TRUE
)

# connect to table
penguins_tbl <- tbl(con, "penguins")

# Query: number of penguins and avg. body mass by species
penguins_tbl |>
  group_by(species) |>
  summarise(
    n = n(),
    avg_body_mass = mean(body_mass_g, na.rm = TRUE)
  ) |>
  collect()

# Query: 10 heaviest penguins weighing less than 5000g
penguins_tbl |>
  filter(body_mass_g >= 5000) |>
  select(species, sex, flipper_length_mm, body_mass_g) |>
  arrange(desc(body_mass_g)) |>
  head(10) |>
  collect()

dbDisconnect(con)
