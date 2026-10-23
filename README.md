# Penguin Analysis with R

Week8_Industry_R_Portfolio/
├── README.md
├── industry_r_workflow.qmd
├── renv.lock
├── renv/
│ └── activate.R
├── data/
│ ├── raw/
│ │ └── insurance.csv
│ └── processed/
├── R/
│ ├── 01_clean_data.R
│ ├── 02_eda_functions.R
│ ├── 03_model_functions.R
│ └── 04_plot_functions.R
├── output/
│ ├── figures/
│ └── tables/
├── app/
│ └── app.R
└── automation/
└── render_report.R

## Project goal

The goal of this project is to use the PalmerPenguins dataset to perform analysis and evualuate the relationship between variables.

## Analytical Question

How can body measurements and location information help us understand differences among penguin species, and how can we communicate these results in a professional, reproducible R portfolio project?

## Dataset

This dataset contains collected information on penguins observed in Antarctica. Originally there are 300 observations and 8 variables. Variables included are: species, island, bill_length_mm, bill_depth_mm, flipper_length_mm, body_mass_g, sex, and year.

## Tools

- palmerpenguins
- tidyverse
- janitor
- skimr
- broom
- here
- gt
- scales
- DBI
- RSQLite
- dbplyr
- shiny
- DT
- styler
- lintr

## Workflow

- Load the raw penguin dataset.
- Clean column names and remove missing observations.
- Convert categorical variables to factors.
- Create derived variables such as body mass in kilograms and bill ratio.
- Save the cleaned dataset as a CSV file.
- Perform exploratory data analysis.
- Create reusable analysis and visualization functions.
- Develop a multiple linear regression model to predict body mass.
- Evaluate model performance.
- Store the cleaned dataset in a SQLite database.
- Query the database using dbplyr.
- Build an interactive Shiny dashboard.
- Generate a final Quarto HTML report.

## Key Findings

The regression model explained approximately **87.5% of the variation in penguin body mass.**

- Flipper length had a positive relationship with body mass.

- Male penguins had higher predicted body mass than female penguins.

- Gentoo penguins had substantially higher predicted body mass than the reference species.

- Bill depth and bill length were also positively associated with body mass.

## How to Run

1.  Open R project file.

2.  Restore the package environment with 'renv::restore'.

3.  Place csv into raw data file.

4.  Open .qmd file.

5.  Render Quarto report.

## Portfolio Summary

This project demonstrates a complete R-based analytics workflow from raw data to an interactive analytical application. It combines data cleaning, exploratory analysis, visualization, statistical modeling, database management, and Shiny development.

The project also demonstrates the use of reusable R functions, structured project organization, reproducible file paths, and automated reporting with Quarto.
