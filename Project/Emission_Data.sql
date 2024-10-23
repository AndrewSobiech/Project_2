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

--USE TO INSERT MISSING CO2 DATA IN THE CO2 EMISSIONS TABLE 
INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 1960, 2897.3153)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 1961, 2886.8727)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 1962, 2993.902)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 1963, 3126.4875)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 1964, 3264.3138)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 1965, 3399.5468)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 1966, 3571.4213)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 1967, 3705.461)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 1968, 3840.9196)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 1969, 4035.1453)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;
INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 1970, 4339.686)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 1971, 4365.4653)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 1972, 4573.0154)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 1973, 4785.103)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 1974, 4621.0998)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 1975, 4478.2749)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 1976, 4747.8174)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 1977, 4889.6653)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 1978, 4941.4227)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 1979, 5008.6418)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;
INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 1980, 4808.5564)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 1981, 4686.4202)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 1982, 4447.2979)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 1983, 4429.4231)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 1984, 4662.1745)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 1985, 4652.633)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 1986, 4663.4296)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 1987, 4825.7117)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 1988, 5050.5434)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 1989, 5132.2063)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;
INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 1990, 5120.9572)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 1991, 5062.9567)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 1992, 5174.2275)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 1993, 5272.8508)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 1994, 5364.2793)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 1995, 5425.2597)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 1996, 5612.9828)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 1997, 5688.1425)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 1998, 5733.2806)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 1999, 5803.9178)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;
INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 2000, 6010.1359)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 2001, 5907.7399)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 2002, 5946.3081)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 2003, 6010.1455)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 2004, 6112.6546)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 2005, 6132.1833)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 2006, 6052.6862)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 2007, 6130.1228)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 2008, 5915.1185)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 2009, 5480.7257)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;
INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 2010, 5679.7152)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 2011, 5546.1161)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 2012, 5344.086)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 2013, 5480.1565)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 2014, 5528.6811)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 2015, 5376.4731)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 2016, 5252.9322)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 2017, 5212.1623)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 2018, 5377.7974)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 2019, 5262.1451)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;
INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 2020, 4714.628)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 2021, 5032.2128)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;

INSERT INTO co2_emissions (country, year, co2_emissions)
VALUES ('United States', 2022, 5057.3038)
ON CONFLICT (country, year)
DO UPDATE SET co2_emissions = EXCLUDED.co2_emissions;
