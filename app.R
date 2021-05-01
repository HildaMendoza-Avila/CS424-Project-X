
# Name: Hilda Mendoza-Avila

# Please uncomment the following lines to install all necessary libraries

# install.packages("tigris")
# install.packages("mapview")
# install.packages("tmap")

# link to the assignment specifications: https://www.evl.uic.edu/aej/424/21Sproject3.html
library(shiny)
library(readxl)
library(ggplot2)
library(leaflet)
library(tmap)
options(scipen = 100)
library(readr)
library(dplyr)
library(sjmisc)
library(viridis)
library(tigris)
library(mapview)


options(scipen = 100)
options(tigris_use_cache = TRUE)
mapviewOptions(fgb = TRUE)

# Load data
global_data <- read_csv("global_power_plant_database.csv", col_types = cols(
  country = col_character(), 
  country_long = col_character(), 
  name = col_character(),  
  gppd_idnr = col_character(), 
  capacity_mw = col_double(), 
  latitude = col_double(), 
  longitude = col_double(),
  primary_fuel = col_character(), 
  other_fuel1 = col_character(), 
  other_fuel2 = col_character(), 
  other_fuel3 = col_character(),
  commissioning_year = col_character(), 
  owner = col_character(), 
  source = col_character(), 
  url = col_character(),
  geolocation_source = col_character(),
  wepp_id = col_character(), 
  year_of_capacity_data = col_integer(), 
  generation_gwh_2013 = col_double(), 
  generation_gwh_2014 = col_double(), 
  generation_gwh_2015 = col_double(), 
  generation_gwh_2016 = col_double(), 
  generation_gwh_2017 = col_double(), 
  estimated_generation_gwh = col_double()
))




# Define UI for app
ui <- fluidPage(
  # App title 
  titlePanel("Project X - Power to the People"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Selector for choosing stateDataset ----
      selectInput(inputId = "stateDataset",
                  label = "Choose a continent:",
                  choices = c(
                    "Africa",
                    "Antarctica",
                    "Asia",
                    "Australia/Oceania",
                    "Europe",
                    "North America",
                    "South America"
                  )
      )
    ),
    
    # Main panel for displaying outputs
    mainPanel(
      
      # Output: Formatted text for caption ----
      h3(textOutput("caption", container = span)),
      leafletOutput("mymap")
      
      # Output: Verbatim text for data summary ----
      # verbatimTextOutput("summary"),
      
      # Output: HTML table with requested number of observations ----
      # tableOutput("view")
      
    )
  )
)


# Define server logic required to draw a leaflet Map
server <- function(input, output) {
  # BEGINNING OF DATA CLEANING --------------------------------------
  
  # Remove unnecessary data columns
  columnRemove <- function(x) {
    x <- subset(x, select = -c(country, gppd_idnr, commissioning_year, wepp_id, year_of_capacity_data, generation_gwh_2013, generation_gwh_2014, generation_gwh_2015, generation_gwh_2016, generation_gwh_2017, estimated_generation_gwh))
    x
  }
  global_data <- columnRemove(global_data)
  
  # Remove all NA entries in this range in columns
  global_data <- global_data[complete.cases(global_data[4:6]),]
  
  
  # END OF DATA CLEANING --------------------------------------
  
  # Cook_county <- blocks(state = "IL", county = "Cook", year = 2010)
  # names(Cook_county)[names(Cook_county) == "GEOID10"] <- "CENSUS_BLOCK"
  # 
  # curr_area <- subset(energyData, COMMUNITY_AREA_NAME == "Near West Side")
  
  
  # tmap_mode("view")
  # # data("World")
  # 
  # tm_shape(global_data) +
  #   tm_polygons("primary_fuel")
  
  
  
  
  
  
  
}



# Create Shiny app
shinyApp(ui = ui, server = server)




















































# 
# Abbr = col_character(), 
# Country = col_character(), 
# PlantName = col_character(), 
# GPPD_Idnr = col_character(), 
# Capacity = col_double(), 
# Latitude = col_double(), 
# Longitude = col_double(),
# Primary_Fuel = col_character(), 
# Other_Fuel1 = col_character(), 
# Other_Fuel2 = col_character(), 
# Other_Fuel3 = col_character(),
# Commissioning_Year = col_integer(), 
# Owner = col_character(), 
# Source = col_character(), 
# URL = col_character(),
# Geolocation_Source = col_character(),
# Wepp_ID = col_integer(), 
# Year_Of_Capacity_Data = col_integer(), 
# Generation_GWH_2013 = col_double(), 
# Generation_GWH_2014 = col_double(), 
# Generation_GWH_2015 = col_double(), 
# Generation_GWH_2016 = col_double(), 
# Generation_GWH_2017 = col_double(), 
# Estimated_Generation_GWH = col_double()