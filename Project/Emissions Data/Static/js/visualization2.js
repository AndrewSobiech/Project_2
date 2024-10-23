let temperatureData, co2Data;
let temperatureUnit = 'Celsius'; // Default temperature unit is Celsius

// Fetch Temperature data
fetch('/api/temperature_data')
    .then(response => response.json())
    .then(data => {
        temperatureData = data;
        initializeDropdown(data);  // Initialize dropdown with countries
        initializeDecadeDropdown();  // Initialize decade dropdown
        initializeUnitDropdown();  // Initialize temperature unit dropdown
        updateHeatmap('United States', '1960', 'Celsius');  // Load the chart with default settings
    })
    .catch(error => console.error('Error fetching temperature data:', error));

// Fetch CO2 emissions data
fetch('/api/co2_emissions')
    .then(response => response.json())
    .then(data => {
        co2Data = data;
        updateCO2Chart('United States', '1960');  // Load the chart with default settings
    })
    .catch(error => console.error('Error fetching CO2 emissions:', error));

// Initialize the country dropdown
function initializeDropdown(data) {
    const countrySet = new Set(data.map(item => item.country));
    const countrySelect = document.getElementById('countrySelect');

    countrySet.forEach(country => {
        const option = document.createElement('option');
        option.value = country;
        option.textContent = country;
        countrySelect.appendChild(option);
    });

    // Set 'United States' as the default selection
    countrySelect.value = 'United States';

    countrySelect.addEventListener('change', function () {
        const selectedCountry = countrySelect.value;
        const selectedDecade = document.getElementById('decadeSelect').value;
        updateHeatmap(selectedCountry, selectedDecade, temperatureUnit);
        updateCO2Chart(selectedCountry, selectedDecade);
    });
}

// Initialize the decade dropdown
function initializeDecadeDropdown() {
    const decadeSelect = document.getElementById('decadeSelect');
    const decades = ['1950', '1960', '1970', '1980', '1990', '2000', '2010', '2020'];

    decades.forEach(decade => {
        const option = document.createElement('option');
        option.value = decade;
        option.textContent = `${decade}s`;
        decadeSelect.appendChild(option);
    });

    decadeSelect.value = '1960';

    decadeSelect.addEventListener('change', function () {
        const selectedCountry = document.getElementById('countrySelect').value;
        const selectedDecade = decadeSelect.value;
        updateHeatmap(selectedCountry, selectedDecade, temperatureUnit);
        updateCO2Chart(selectedCountry, selectedDecade);
    });
}

// Initialize the temperature unit dropdown
function initializeUnitDropdown() {
    const tempUnitSelect = document.getElementById('tempUnitSelect');

    tempUnitSelect.addEventListener('change', function () {
        temperatureUnit = tempUnitSelect.value;
        updateHeatmap(document.getElementById('countrySelect').value, document.getElementById('decadeSelect').value, temperatureUnit);
    });
}

// Convert Celsius to Fahrenheit
function convertToFahrenheit(celsius) {
    return (celsius * 9 / 5) + 32;
}

// Update the heatmap
function updateHeatmap(selectedCountry, selectedDecade, tempUnit) {
    const startYear = parseInt(selectedDecade);
    const filteredData = temperatureData.filter(item => item.country === selectedCountry && item.year >= startYear && item.year < startYear + 10);

    const x = filteredData.map(item => item.month);
    const y = filteredData.map(item => item.year);
    const z = filteredData.map(item => tempUnit === 'Fahrenheit' ? convertToFahrenheit(item.average_temperature) : item.average_temperature);

    const heatmapTrace = {
        x: x,
        y: y,
        z: z,
        type: 'heatmap',
        colorscale: 'Viridis',
        hovertemplate: 'Year: %{y}<br>Month: %{x}<br>Temperature: %{z}<extra></extra>'
    };

    const layout = {
        title: `Temperature Heatmap for ${selectedCountry} (${selectedDecade}s)`,
        xaxis: { title: 'Month' },
        yaxis: {
            title: 'Year',
            tickmode: 'linear',
            tick0: startYear,
            dtick: 1  // Increment by 1 to avoid decimal years
        }
    };

    Plotly.newPlot('heatmapChart', [heatmapTrace], layout);
}

// Update the CO2 emissions area chart
function updateCO2Chart(selectedCountry, selectedDecade) {
    const startYear = parseInt(selectedDecade);
    const filteredCO2Data = co2Data.filter(item => item.country === selectedCountry && item.year >= startYear && item.year < startYear + 10);

    const x = filteredCO2Data.map(item => item.year);
    const y = filteredCO2Data.map(item => item.co2_emissions);

    const co2Trace = {
        x: x,
        y: y,
        type: 'scatter',
        mode: 'lines',
        fill: 'tozeroy',  // Area chart effect
        name: 'CO2 Emissions',
        line: { color: 'rgba(50, 150, 255, 0.8)' }
    };

    const layout = {
        title: `CO2 Emissions for ${selectedCountry} (${selectedDecade}s)`,
        xaxis: { title: 'Year' },
        yaxis: {
            title: 'CO2 Emissions (Million Metric Tons)',
            titlefont: { color: 'rgba(50, 150, 255, 0.8)' },
            tickfont: { color: 'rgba(50, 150, 255, 0.8)' }
        }
    };

    Plotly.newPlot('co2Chart', [co2Trace], layout);
}
