This folder contains all of the data used in The Pudding essay [Film or Digital: Breaking Down Hollywood's Choice of Shooting Medium](https://pudding.cool/2018/08/film-or-digital/) published in August 2018.

Below you'll find metadata for each file.

## top_movies_data.csv

- 	**What is this?**: Data representing top 100 movies at the US Box Office every year between 2006 and 2017, along with relevant information used for the analysis in the essay.
-   **Source(s) & Methods**: IMDb and The Numbers.
    - The Numbers' list of [US cumulative box office records](https://www.the-numbers.com/box-office-records/domestic/all-movies/cumulative/) is used to determine the top 100 movies each year.
    - Genres, directors, camera, and negative format were collected from IMDb [bulk data](ftp://ftp.funet.fi/pub/mirrors/ftp.imdb.com/pub/frozendata) and processed using [IMDbpy](https://imdbpy.sourceforge.io/).
    - Budget information was collected from The Numbers (as the primary source) and IMDb (when information is missing in The Numbers).
    - Film type is determined from the camera and negative format information.
-   **Last Modified**: August 12, 2018
-   **Contact Information**: [Damar Aji Pramudita](mailto:damarberlari@gmail.com)
-   **Spatial Applicability**: United States
-   **Temporal Applicability**: 2006 - 2017
-   **Observations (Rows)**: Each row represents a movie in the top 100 US box office between 2006 and 2017.
-   **Variables (Columns)**:

| Header | Description | Data Type |
|---|---|---|
| `production_year` | Production time of a movie | number |
| `id` | Unique number assign to a movie | number |
| `title` | Title of a movie | text |
| `directors` | Director(s) of a movie. Multiple directors are separated by a `|` | text |
| `genres` | Genre(s) of a movie. Multiple genres are separated by a `|` |text|
| `cameras` | Camera(s) and lense(s) used in a movie, as listed in IMDb technical specs section. Multiple cameras/lenses are separated by a `|`. | text |
| `negative_format` | Negative fomat(s) in which a movie was recorded, as listed in IMDb technical specs section. Multiple formats separated by a `|`. | text |
| `budget` | Budget of a movie (in US$ nominal value, not adjusted to inflation) | number |
| `budget_source` | Source of the budget information: <br/>&bull; `the-numbers`: Information taken from The Numbers website <br/>&bull; `imdb`: Information taken from IMDb | text |
| `film_type` | Medium of a movie: <br/>&bull; `D`: Digital <br/>&bull; `F`: Film <br/>&bull; `D|F`: Both Digital and Film <br/>&bull; `U`: Unknown medium. <br/> This field is determined based on cameras and negative format used in a movie.| text |
-   **Other Notes**: Check notebook [top_movies_data_processing.ipynb](https://github.com/the-pudding/data/tree/master/film-or-digital/top_movies_data_processing.ipynb) to see steps for aggregating this data to the one visualized in the essay.

## top_directors_data.csv
- 	**What is this?**: Data representing filmography of top directors along with the relevant information used for the analysis in the essay.
-   **Source(s) & Methods**: IMDb and The Numbers.
    - Top directors refer to ones with at least one movies it the top movies list above.
    - Genres, directors, camera, and negative format were collected from IMDb [bulk data](ftp://ftp.funet.fi/pub/mirrors/ftp.imdb.com/pub/frozendata) and processed using [IMDbpy](https://imdbpy.sourceforge.io/).
    - Film type is determined from the camera and negative format information.
-   **Last Modified**: August 12, 2018
-   **Contact Information**: [Damar Aji Pramudita](mailto:damarberlari@gmail.com)
-   **Spatial Applicability**: United States
-   **Temporal Applicability**: 2006 - 2017
-   **Observations (Rows)**: Each row represents a movie made by a top director between 2006 and 2017.
-   **Variables (Columns)**:

| Header | Description | Data Type |
|---|---|---|
| `production_year` | Production time of the movie | number |
| `id` | Unique number assign to the movie | number |
| `title` | Title of the movie | text |
| `director` | Name of a director that direct the movie. This field will only contain one director involved in the movie. If a movie is directed by more than one director, the title will appear in multiple row, with each director listed in this column. | text |
| `director_id` | Unique number assign to the director listed in `director` column. | number |
| `co_directors` | List of all directors involved in the movie. Multiple directors are separated by a `|` | text |
| `co_directors_id` | Unique number assign to each director listed in `co_directors` column. Multiple director ids are separated by a `|`  | text |
| `genres` | Genre(s) of a movie. Multiple genres are separated by a `|` | text |
| `cameras` | Camera(s) and lense(s) used in a movie, as listed in IMDb technical specs section. Multiple cameras/lenses are separated by a `|`. | text |
| `negative_format` | Negative fomat(s) in which a movie was recorded, as listed in IMDb technical specs section. Multiple formats are separated by a `|`. | text |
| `film_type` | Medium of a movie: <br/>&bull; `D`: Digital <br/>&bull; `F`: Film <br/>&bull; `D|F`: Both Digital and Film <br/>&bull; `U`: Unknown medium. <br/> This field is determined based on cameras and negative format used in a movie. | text |
-   **Other Notes**: Check notebook [top_directors_data_processing.ipynb](https://github.com/the-pudding/data/tree/master/film-or-digital/top_directors_data_processing.ipynb) to see steps for aggregating this data to the one visualized in the essay.