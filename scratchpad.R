# created readme file 
file.create("README.md")

#create cleaning file 
file.create("R/01_clean_data.R")

# create eda file 
file.create("R/02_eda_functions.R")

# create plot file 
file.create("R/04_plot_functions.R")

# create model file
file.create("R/03_model_functions.R")

# create database file 
file.create("R/05_database.R")

# create automation file 
file.create("automation/render_report.R")

# create shiny app file 
file.create("app/app.R")

# downloaded file 
download.file(
  url = "https://raw.githubusercontent.com/allisonhorst/palmerpenguins/master/inst/extdata/penguins.csv",
  destfile = "data/raw/penguins.csv",
  mode = "wb"
)

