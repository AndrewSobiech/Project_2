# Emissions Data
This project provides interactive visualizations for CO2 emissions, temperature data, and consumption data. These visualizations use data pulled from PostgreSQL and are rendered using Plotly and Chart.js on a Flask web application.

## Features
Temperature & CO2 Emissions Heatmap: Shows the relationship between temperature and CO2 emissions over different years.
Consumption Stacked Bar Chart: Displays the consumption rates of various countries, grouped by continent.
Interactive Filters: Users can filter data by continent, country, and year. Temperature can be displayed in either Celsius or Fahrenheit.

## Getting Started
### Prerequisites
Before you can run this project, ensure you have the following installed on your local machine:

1. Python 3.7+
     Install Python here.

2. PostgreSQL
     Install PostgreSQL and ensure it's running. You'll need access to a PostgreSQL database where the required tables are stored.

3. Git
     Install Git to clone this repository.

### Installation Steps
#### Step 1: Clone the Repository
Use Git to clone the repository to your local machine:
git clone https://github.com/your-username/your-repo-name.git
cd your-repo-name

#### Step 4: Set Up PostgreSQL Database
Ensure you have PostgreSQL installed and running.
createdb emissions_data

1. Create the Required Tables: You will need to create tables for the database. Below is a sample structure for each please use the following script to create everything:
([https://github.com/AndrewSobiech/Project_2/blob/7af1d1033f4546974df93ca165466a631e29b135/Project/Emission_Data.sql])

2. For your sql tables to work, please create your table and then import the data using the following csv guide:
- co2_emissions = Formatted_Cleaned_Country_Lat_Long.csv
- coal_emissions = Matched_Country_Year.csv
- consumption_emissions = ReStandardized_Consumption_Emissions.csv
- country_lat_long = Standardized_CO2_Emissions.csv
- country_year = Standardized_Coal_Emissions.csv
- gas_emissions = Standardized_Gas_Emissions.csv
- oil_emissions = Standardized_Monthly_Temperature.csv
- population_data = Standardized_Oil_Emissions.csv
- temperature_data = Standardized_Population_Data.csv

#### Step 5: Run Flask Application
use the app.py to run the flask 

1. create a config file where you will provide the following information for the flask to run effectively:
import os

- class Config:
    DB_NAME = 'Emissions Data'
    DB_USER = 'your_username'
    DB_PASSWORD = 'your_password'
    DB_HOST = 'localhost'
    DB_PORT = '5432'
  
2. Then run the Flask app using python app.py. Make sure the files and folders are in the same order structure as they appear in the Emissions Data folder.
   
3. Open your browser to interact with the visuals. 

### Project Structure
app.py: The main Flask application that serves data from the PostgreSQL database.
static/js/visualization2.js: Handles the temperature and CO2 emissions visualizations using Plotly.
static/js/visualization3.js: Handles the consumption stacked bar chart using Chart.js.
templates/index.html: The main HTML file where the visualizations are rendered.
Temperature & CO2 Heatmap: Choose a country and decade to explore how temperatures and CO2 emissions have changed over time.
Consumption Stacked Bar Chart: Explore consumption rates of countries, grouped by continent, over multiple years.

### Works Cited 
All data from: 
Global Carbon Atlas. (10-16-2024). ‘Carbon emissions’. Retrieved October 23, 2024, from https://globalcarbonatlas.org/emissions/carbon-emissions/
Our World in Data. (10-16-2024). ‘Monthly average surface temperatures by year’. Retrieved October 23, 2024, from https://ourworldindata.org/grapher/monthly-average-surface-temperatures-by-year
