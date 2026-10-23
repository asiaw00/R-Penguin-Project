# libraries ---------------------------------------------------------------
library(tidyverse)
library(broom)
# -------------------------------------------------------------------------
# Regression model
# Predict penguin body mass
# -------------------------------------------------------------------------
# fit model
fit_bodymass_lm <- function(data) {
  lm(
    body_mass_g ~ flipper_length_mm + bill_length_mm + bill_depth_mm + species + sex,
    data = data
  )
}

# tidy model results
tidy_model_results <- function(model) {
  broom::tidy(model, conf.int = TRUE) |>
    arrange(p.value)
}

# model performance
model_performance <- function(model) {
  broom::glance(model) |>
    select(
      r.squared,
      adj.r.squared,
      sigma,
      statistic,
      p.value,
      AIC,
      BIC
    )
}

# predictions
predictions <- function(data, model) {
  data |>
    mutate(
      predicted_body_mass = predict(model, newdata = data),
      residual = body_mass_g - predicted_body_mass
    )
}
