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
Create the Required Tables: You will need to create tables for co2_emissions, temperature_data, and population_data. Below is a sample structure for each:
[https://github.com/AndrewSobiech/Project_2/blob/7af1d1033f4546974df93ca165466a631e29b135/Project/Emission_Data.sql]
