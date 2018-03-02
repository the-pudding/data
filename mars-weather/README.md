This folder contains all of the data used in The Pudding essay [Greetings from Mars](https://pudding.cool/2018/01/mars-weather/) published in February 2018. 

Below you'll find metadata for each file. 

## mars-weather.csv

- 	**What is this?**: Data representing the weather conditions on Mars from Sol 1 (August 7, 2012 on Earth) to Sol 1895 (February 27, 2018 on Earth). 
-   **Source(s) & Methodology**: This data was measured and transmitted via the [Rover Environmental Monitoring Station (REMS)](https://mars.jpl.nasa.gov/msl/mission/instruments/environsensors/rems/) on-board the [Curiosity Rover](https://mars.jpl.nasa.gov/msl/). The data was made publicly available by [NASA’s Mars Science Laboratory](http://mars.jpl.nasa.gov/msl/) and the [Centro de Astrobiología (CSIC-INTA)](http://www.cab.inta.es/es/inicio). The Centro de Astrobiología offers a widget and a disclaimer regarding the data collected by Curiosity [here](http://cab.inta-csic.es/rems/wp-content/plugins/marsweather-widget/widget.php?lang=en). You can also find more in-depth weather reports from the Centro de Astrobiología team [here](https://cab.inta-csic.es/rems/category/weather-reports/).
- **Data Disclaimer**: The Centro de Astrobiología includes the following disclaimer for these data:
> The information contained in this file is provided by Centro de Astrobiologia (CAB) and is intended for outreach purposes only. Any other use is discouraged. CAB will take no responsibility for any result or publication made base on the content of this file. To access REMS scientific data, visit [PDS](http://pds.nasa.gov). The environmental magnitudes given in this file are obtained from the values read by the Rover Environmental Monitoring Station (REMS) on board the Mars Science Laboratory (MSL) rover on Mars. This file provides the environmental magnitudes at REMS location, so MSL rover influences those magnitudes (rover position, rover temperature, rover orientation, rover shade, dust depositions on the rover, etc.) REMS does not take measurements continuously and it takes measurements at different times from one day to another. This fact has influence on the variation of the values given in this file from one day to another . For different reasons (instrument maintenance, instrument calibration, instrument degradation, etc.), some or all of the magnitudes in this file may not be available.

-   **Last Modified**: March 2, 2018 (a daily-updated version in JSON-format can be found [here](https://pudding.cool/2017/12/mars-data/marsWeather.json)).
-   **Contact Information**: [Amber Thomas](mailto:amber@polygraph.cool)
-   **Spatial Applicability**: Gale Crater, Mars (just south of Mars' equator). More information on Curiosity's location [here](https://mars.nasa.gov/msl/mission/whereistherovernow/).
-   **Temporal Applicability**: Sol 1 (August 7, 2012 on Earth) to Sol 1895 (February 27, 2018 on Earth)
-   **Observations (Rows)**: Each row represents the weather information collected at some point on a single sol (Martian day).
-   **Variables (Columns)**:

| Header | Description | Data Type |
|---|---|---|
| `id` | The identification number of a single transmission | number | 
| `terrestrial_date` | The date on Earth (formatted as `month/day/year` or `m/dd/yy`). | date | 
| `sol` | The number of elapsed sols (Martian days) since Curiosity landed on Mars. | number | 
| `ls` | The solar longitude or the Mars-Sun angle, measured from the Northern Hemisphere. In the Northern Hemisphere, the spring equinox is when `ls = 0`. Since Curiosity is in the Southern Hemisphere, the following `ls` values are of importance: <br/>&bull; `ls = 0`: autumnal equinox <br/>&bull; `ls = 90` : winter solstice <br/>&bull; `ls = 180` : spring equinox <br/>&bull; `ls = 270` : summer solstice | number | 
| `month` | The Martian Month. Similarly to Earth, Martian time can be divided into 12 months. Helpful information can be found [here](http://www-mars.lmd.jussieu.fr/mars/time/solar_longitude.html).| string | 
| `min_temp` | The minimum temperature (in °C) observed during a single Martian sol. | number | 
| `max_temp` | The maximum temperature (in °C) observed during a single Martian sol. | number | 
| `pressure` | The atmospheric pressure (Pa) in Curiosity's location on Mars.  | number | 
| `wind_speed` | The average wind speed (m/s) measured in a single sol. *Note:* Wind Speed data has not be transmitted to Earth since Sol 1485. Missing values are coded as `NaN`.  | number |
| `atmo_opacity` | Description of the overall weather conditions on Mars for a given sol based on atmospheric opacity (e.g., `Sunny`). | string | 

## earthWeather.json

> *Access the data [here](https://pudding.cool/2017/12/mars-data/earthWeather.json).*

- 	**What is this?**: Data representing the weather conditions from 1,000 cities on Earth. 
-   **Source(s) & Methodology**: This data is [Powered by Dark Sky](https://darksky.net/poweredby/), meaning that it uses the Dark Sky weather API to query the weather conditions in 1,000 cities daily.
-   **Last Modified**: Daily.
-   **Contact Information**: [Amber Thomas](mailto:amber@polygraph.cool)
-   **Spatial Applicability**: 1,000 cities around the world (at a minimum, the capital city of every country worldwide and the capital city of every US state).
-   **Temporal Applicability**: Due to timezones on Earth, 3 different calendar days are existing simultaneously at some place on the planet. To account for this, the data is updated at UTC Midnight and records 3 days worth of data. Days in the future are forecasted weather conditions.
-   **Variables (Columns)**:

| Header | Description | Data Type |
|---|---|---|
| `latitude` | The latitude of the city in decimal notation (e.g., `24.453884`) | number |
| `longitude` | The longitude of the city in decimal notation (e.g., `54.3773438`) | number |
| `City` | The name of the city. | string |
| `Territory` | The name of the country (for non-US cities) or state (for US-cities) for each city (e.g., for the city `Seattle` the `Territory` is `Washington` but for the city `Paris` the `Territory` is `France`. | string |
| `dailySlice` | Nested information including 3 days worth of weather conditions for the city. See the below table for descriptions of the variables inside. | nested data |

> *Data inside the `dailySlice` column* 

| Header | Description | Data Type |
|---|---|---|
| `time` | The date (formatted as `year-month-day` or `YYYY-MM-DD`) | date |
| `summary` | A text-description of the weather conditions for each day (e.g., `Mostly cloudy throughout the day`).  | string |
| `windSpeed` | The average wind-speed (miles per hour) for a given day. | number |
| `windGust` | The maximum speed of wind gusts (miles per hour) for a given day. | number |
| `pressure` | The atmospheric pressure in a city (mbar) | number |
| `min_tempF` | The minimum temperature (°F) during a given day. | number |
| `max_tempF` | The maximum temperature (°F) during a given day. | number |
| `min_tempC` | The minimum temperature (°C) during a given day. | number |
| `max_tempC` | The maximum temperature (°C) during a given day. | number |
| `windSpeedms` | The average wind-speed (m/s) for a given day. | number |

- **Other Notes**: Any use of these data needs to include a [Powered by Dark Sky](https://darksky.net/poweredby/) link as attribution. 
