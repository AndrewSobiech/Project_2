-- Drop existing tables in reverse order of dependencies
DROP TABLE IF EXISTS consumption_emissions CASCADE;
DROP TABLE IF EXISTS temperature_data CASCADE;
DROP TABLE IF EXISTS population_data CASCADE;
DROP TABLE IF EXISTS oil_emissions CASCADE;
DROP TABLE IF EXISTS gas_emissions CASCADE;
DROP TABLE IF EXISTS coal_emissions CASCADE;
DROP TABLE IF EXISTS co2_emissions CASCADE;
DROP TABLE IF EXISTS country_year CASCADE;
DROP TABLE IF EXISTS country_lat_long CASCADE;


-- Create the country_lat_long table (independent)
CREATE TABLE country_lat_long (
    country VARCHAR(255) PRIMARY KEY,
    latitude FLOAT,
    longitude FLOAT
);

-- Create the country_year table (dependent on country_lat_long)
CREATE TABLE country_year (
    country VARCHAR(255),
    year INT,
    PRIMARY KEY (country, year),
    FOREIGN KEY (country) REFERENCES country_lat_long (country) ON DELETE CASCADE
);

-- Create the co2_emissions table (dependent on country_year)
CREATE TABLE co2_emissions (
    country VARCHAR(255),
    year INT,
    co2_emissions FLOAT,
    PRIMARY KEY (country, year),
    FOREIGN KEY (country, year) REFERENCES country_year (country, year) ON DELETE CASCADE
);

-- Create the coal_emissions table (dependent on country_year)
CREATE TABLE coal_emissions (
    country VARCHAR(255),
    year INT,
    coal_emissions FLOAT,
    PRIMARY KEY (country, year),
    FOREIGN KEY (country, year) REFERENCES country_year (country, year) ON DELETE CASCADE
);

-- Create the gas_emissions table (dependent on country_year)
CREATE TABLE gas_emissions (
    country VARCHAR(255),
    year INT,
    gas_emissions FLOAT,
    PRIMARY KEY (country, year),
    FOREIGN KEY (country, year) REFERENCES country_year (country, year) ON DELETE CASCADE
);

-- Create the oil_emissions table (dependent on country_year)
CREATE TABLE oil_emissions (
    country VARCHAR(255),
    year INT,
    oil_emissions FLOAT,
    PRIMARY KEY (country, year),
    FOREIGN KEY (country, year) REFERENCES country_year (country, year) ON DELETE CASCADE
);

-- Create the population_data table (dependent on country_year)
CREATE TABLE population_data (
    country VARCHAR(255),
    year INT,
    total_population BIGINT,
    PRIMARY KEY (country, year),
    FOREIGN KEY (country, year) REFERENCES country_year (country, year) ON DELETE CASCADE
);

-- Create the temperature_data table (dependent on country_year)
CREATE TABLE temperature_data (
    country VARCHAR(255),
    year INT,
    month VARCHAR(20),
    average_temperature FLOAT,
    PRIMARY KEY (country, year, month),
    FOREIGN KEY (country, year) REFERENCES country_year (country, year) ON DELETE CASCADE
);

-- Create the consumption_emissions table (dependent on country_year)
CREATE TABLE consumption_emissions (
    country VARCHAR(255),
    year INT,
    consumption_emissions FLOAT,
    PRIMARY KEY (country, year),
    FOREIGN KEY (country, year) REFERENCES country_year (country, year) ON DELETE CASCADE
);

