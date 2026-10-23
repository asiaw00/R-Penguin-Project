# libraries  --------------------------------------------------------------
library(tidyverse)
library(scales)
library(ggplot2)
# -------------------------------------------------------------------------
# histogram of body mass
bodymass_histo <- function(data) {
  ggplot(data, aes(x = body_mass_g)) +
    geom_histogram(bins = 30, fill = "violet", color = "white") +
    labs(
      title = "Body Mass",
      x = "Body Mass",
      y = "Count"
    ) +
    theme_minimal()
}
penguin_histogram <- bodymass_histo(penguins_clean)

# boxplot of body mass per species
boxplot_bodymass <- function(data) {
  ggplot(data, aes(x = species, y = body_mass_g)) +
    geom_boxplot(fill = "lightblue") +
    labs(
      title = "Body Mass per Species",
      x = "Species",
      y = "Body Mass (g)"
    ) +
    theme_minimal()
}
penguin_boxplot <- boxplot_bodymass(penguins_clean)

# scatterplot of flipper length vs body mass by species
scatter_flipper_mass <- function(data) {
  ggplot(data, aes(x = flipper_length_mm, y = body_mass_g, color = species)) +
    geom_point(alpha = 0.6) +
    geom_smooth(method = "lm", se = FALSE) +
    scale_y_continuous() +
    labs(
      title = "Scatterplot of Flipper Length and Body Mass by Species",
      x = "Flipper Length",
      y = "Body Mass",
      color = "Species"
    ) +
    theme_minimal()
}
flipperlength_bodymass_scatter <- scatter_flipper_mass(penguins_clean)

# scatterplot of bill length and bill depth
scatter_of_bill <- function(data) {
  ggplot(data, aes(x = bill_length_mm, y = bill_depth_mm, color = species)) +
    geom_point(alpha = 0.6) +
    geom_smooth(method = "lm", se = FALSE) +
    scale_y_continuous() +
    labs(
      title = "Scatterplot of Bill Length and Bill Depth",
      x = "Bill Length",
      y = "Bill Depth",
      color = "Species"
    ) +
    theme_minimal()
}
bill_scatter <- scatter_of_bill(penguins_clean)

# -------------------------------------------------------------------------
ggsave("output/figures/billscatter.png", plot = bill_scatter)
ggsave("output/figures/flipperlength_bodymass.png", plot = flipperlength_bodymass_scatter)
ggsave("output/figures/penguinboxplot.png", plot = penguin_boxplot)
ggsave("output/figures/penguinhistogram.png", plot = penguin_histogram)
