# libraries -------------------------------------------------------------------------
library(quarto)
library(here)
library(tidyverse)
# -------------------------------------------------------------------------
quarto::quarto_render(
  input = here("penguins_workflow.qmd"),
  output_format = "html"
)

