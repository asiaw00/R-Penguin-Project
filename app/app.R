# libraries ---------------------------------------------------------------
library(shiny)
library(tidyverse)
library(DT)
library(scales)
library(here)
# -------------------------------------------------------------------------
# Read cleaned penguin data
penguins <- read_csv(
  here("data", "processed", "penguins_clean.csv")
)

# User interface
ui <- fluidPage(
  
  titlePanel("Penguins Data Explorer"),
  
  sidebarLayout(
    
    sidebarPanel(
      
      selectInput(
        "species",
        "Select Species:",
        choices = c("All", unique(penguins$species))
      ),
      
      selectInput(
        "island",
        "Select Island:",
        choices = c("All", unique(penguins$island))
      )
      
    ),
    
    mainPanel(
      
      h3("Summary"),
      tableOutput("summary"),
      
      h3("Body Mass Distribution"),
      plotOutput("body_mass_plot"),
      
      h3("Flipper Length vs. Body Mass"),
      plotOutput("scatter_plot"),
      
      h3("Filtered Penguin Records"),
      DTOutput("data_table")
      
    )
  )
)

# Server
server <- function(input, output) {
  
  # Filter data
  filtered_data <- reactive({
    
    data <- penguins
    
    if (input$species != "All") {
      data <- data |>
        filter(species == input$species)
    }
    
    if (input$island != "All") {
      data <- data |>
        filter(island == input$island)
    }
    
    data
  })
  
  
  # Summary table
  output$summary <- renderTable({
    
    filtered_data() |>
      summarise(
        Number_of_Penguins = n(),
        Average_Body_Mass = mean(body_mass_g, na.rm = TRUE),
        Minimum_Body_Mass = min(body_mass_g, na.rm = TRUE),
        Maximum_Body_Mass = max(body_mass_g, na.rm = TRUE)
      )
    
  })
  
  
  # Body mass distribution
  output$body_mass_plot <- renderPlot({
    
    ggplot(filtered_data(), aes(x = body_mass_g)) +
      geom_histogram(bins = 20) +
      labs(
        title = "Body Mass Distribution",
        x = "Body Mass (g)",
        y = "Number of Penguins"
      ) +
      theme_minimal()
    
  })
  
  
  # Flipper length vs body mass
  output$scatter_plot <- renderPlot({
    
    ggplot(
      filtered_data(),
      aes(
        x = flipper_length_mm,
        y = body_mass_g,
        color = species
      )
    ) +
      geom_point() +
      labs(
        title = "Flipper Length vs. Body Mass",
        x = "Flipper Length (mm)",
        y = "Body Mass (g)",
        color = "Species"
      ) +
      theme_minimal()
    
  })
  
  
  # Filtered data table
  output$data_table <- renderDT({
    
    datatable(
      filtered_data(),
      options = list(
        pageLength = 10
      )
    )
    
  })
  
}

# Run the application
shinyApp(ui = ui, server = server)