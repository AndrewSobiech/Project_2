// Visualization 1: Consumption Data Chart for Countries from 1990-2020
// Fetch all countries for the dropdown from the API
async function fetchCountries() {
    try {
        const response = await fetch('/api/country_year');
        const countries = await response.json();
        return countries;
    } catch (error) {
        console.error('Error fetching countries:', error);
    }
}

// Populate the dropdown menu with countries
async function populateCountryDropdown() {
    const dropdown = document.getElementById('countryDropdown');
    const countries = await fetchCountries();
    
    countries.forEach(country => {
        const option = document.createElement('option');
        option.value = country;
        option.text = country;
        dropdown.appendChild(option);
    });
}

// Fetch consumption rates for the selected country from the API
async function fetchConsumptionRates(country) {
    try {
        const response = await fetch(`/api/consumption_emissions/${country}`);
        const data = await response.json();
        return data;
    } catch (error) {
        console.error(`Error fetching data for ${country}:`, error);
    }
}

// Update the chart based on the selected country
async function updateCountryChart() {
    const selectedCountry = document.getElementById('countryDropdown').value;
    const consumptionRates = await fetchConsumptionRates(selectedCountry);

    const labels = consumptionRates.map(item => item.year); // Years from API
    const values = consumptionRates.map(item => item.consumption_rate); // Consumption rates from API

    if (consumptionChart) {
        consumptionChart.destroy();
    }

    const ctx = document.getElementById('consumptionChart').getContext('2d');
    consumptionChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: labels,  // Years from API (1990 to 2020)
            datasets: [{
                label: `Consumption Emissions for ${selectedCountry}`,
                data: values,
                backgroundColor: 'rgba(54, 162, 235, 0.6)',
                borderColor: 'rgba(54, 162, 235, 1)',
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true,
                    title: {
                        display: true,
                        text: 'Consumption Emissions'
                    }
                },
                x: {
                    title: {
                        display: true,
                        text: 'Year'
                    }
                }
            },
            plugins: {
                tooltip: {
                    callbacks: {
                        label: function (context) {
                            return `${context.label}: ${context.raw}`;
                        }
                    }
                }
            }
        }
    });
}

let consumptionChart;

// Initialize the dropdown and chart
document.addEventListener('DOMContentLoaded', function () {
    populateCountryDropdown();
    updateCountryChart();
});

                  
// Visualization 2: CO2 and Temperature Dual Axis Chart
function createDualAxisChart(data) {
    const ctx = document.getElementById('dualAxisChart').getContext('2d');
    new Chart(ctx, {
        type: 'line',
        data: {
            labels: data.years,
            datasets: [
                {
                    label: 'CO2 Emissions',
                    data: data.co2,
                    borderColor: 'rgba(255, 99, 132, 1)',
                    borderWidth: 2,
                    yAxisID: 'y1'
                },
                {
                    label: 'Average Temperature',
                    data: data.temp,
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 2,
                    yAxisID: 'y2'
                }
            ]
        },
        options: {
            scales: {
                y1: {
                    type: 'linear',
                    position: 'left',
                    title: {
                        display: true,
                        text: 'CO2 Emissions'
                    }
                },
                y2: {
                    type: 'linear',
                    position: 'right',
                    title: {
                        display: true,
                        text: 'Temperature'
                    }
                }
            }
        }
    });
}

// Visualization 3: Yearly Data Chart
function createYearlyDataChart(data) {
    const ctx = document.getElementById('yearlyDataChart').getContext('2d');
    new Chart(ctx, {
        type: 'line',
        data: {
            labels: data.years,
            datasets: [{
                label: 'Yearly Data',
                data: data.values,
                borderColor: 'rgba(153, 102, 255, 1)',
                borderWidth: 2
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true,
                    title: {
                        display: true,
                        text: 'Data'
                    }
                }
            }
        }
    });
}

// Example of calling the functions when data is received
window.onload = function () {
    fetch('/api/consumption_emissions')
        .then(response => response.json())
        .then(data => createConsumptionChart(data));

    fetch('/api/temperature_data')
        .then(response => response.json())
        .then(data => createDualAxisChart(data));

    fetch('/api/yearly_data')
        .then(response => response.json())
        .then(data => createYearlyDataChart(data));
};
