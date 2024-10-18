from flask import Flask, jsonify
import psycopg2
from config import Config  # Import the configuration file

app = Flask(__name__)

# Step 1: Use the config file to get DB credentials
def get_db_connection():
    conn = psycopg2.connect(
        dbname=Config.DB_NAME,
        user=Config.DB_USER,
        password=Config.DB_PASSWORD,
        host=Config.DB_HOST,
        port=Config.DB_PORT
    )
    return conn
#home route
@app.route('/')
def home():
    return ('Welcome to Our Emissions Project')

# Step 2: Define API endpoints for each table

# 1. CO2 Emissions
@app.route('/api/co2_emissions', methods=['GET'])
def get_co2_emissions():
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute('SELECT * FROM co2_emissions')
    rows = cur.fetchall()

    emissions = [{'country': row[0], 'year': row[1], 'co2_emissions': row[2]} for row in rows]

    cur.close()
    conn.close()
    return jsonify(emissions)

# 2. Coal Emissions
@app.route('/api/coal_emissions', methods=['GET'])
def get_coal_emissions():
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute('SELECT * FROM coal_emissions')
    rows = cur.fetchall()

    emissions = [{'country': row[0], 'year': row[1], 'coal_emissions': row[2]} for row in rows]

    cur.close()
    conn.close()
    return jsonify(emissions)

# 3. Consumption Emissions
@app.route('/api/consumption_emissions', methods=['GET'])
def get_consumption_emissions():
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute('SELECT * FROM consumption_emissions')
    rows = cur.fetchall()

    emissions = [{'country': row[0], 'year': row[1], 'consumption_emissions': row[2]} for row in rows]

    cur.close()
    conn.close()
    return jsonify(emissions)

# 4. Country Lat Long
@app.route('/api/country_lat_long', methods=['GET'])
def get_country_lat_long():
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute('SELECT * FROM country_lat_long')
    rows = cur.fetchall()

    locations = [{'country': row[0], 'latitude': row[1], 'longitude': row[2]} for row in rows]

    cur.close()
    conn.close()
    return jsonify(locations)

# 5. Country Year
@app.route('/api/country_year', methods=['GET'])
def get_country_year():
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute('SELECT * FROM country_year')
    rows = cur.fetchall()

    country_years = [{'country': row[0], 'year': row[1]} for row in rows]

    cur.close()
    conn.close()
    return jsonify(country_years)

# 6. Gas Emissions
@app.route('/api/gas_emissions', methods=['GET'])
def get_gas_emissions():
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute('SELECT * FROM gas_emissions')
    rows = cur.fetchall()

    emissions = [{'country': row[0], 'year': row[1], 'gas_emissions': row[2]} for row in rows]

    cur.close()
    conn.close()
    return jsonify(emissions)

# 7. Oil Emissions
@app.route('/api/oil_emissions', methods=['GET'])
def get_oil_emissions():
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute('SELECT * FROM oil_emissions')
    rows = cur.fetchall()

    emissions = [{'country': row[0], 'year': row[1], 'oil_emissions': row[2]} for row in rows]

    cur.close()
    conn.close()
    return jsonify(emissions)

# 8. Population Data
@app.route('/api/population_data', methods=['GET'])
def get_population_data():
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute('SELECT * FROM population_data')
    rows = cur.fetchall()

    population = [{'country': row[0], 'year': row[1], 'total_population': row[2]} for row in rows]

    cur.close()
    conn.close()
    return jsonify(population)

# 9. Temperature Data
@app.route('/api/temperature_data', methods=['GET'])
def get_temperature_data():
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute('SELECT * FROM temperature_data')
    rows = cur.fetchall()

    temperatures = [{'country': row[0], 'year': row[1], 'month': row[2], 'average_temperature': row[3]} for row in rows]

    cur.close()
    conn.close()
    return jsonify(temperatures)

# Step 3: Run the Flask application
if __name__ == '__main__':
    app.run(debug=True)


