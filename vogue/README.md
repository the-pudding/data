This folder contains all of the data used in The Pudding essay Colorism in High Fashion published in April 2019.

The data will never be updated.

Below you'll find the metadata for each file.

## faces.csv

-   **What is this?**: Data representing the skin tone of the female cover models of Vogue magazine between 2000 and 2019, by issue.
-   **Source(s) & Methodology**: Every cover of Vogue (USA) that was published between 2000 and 2018 (inclusive) was downloaded from the Vogue archive. The faces of the female cover models were identified using facial recognition (via `openCV`) and cropped to size. Within these cropped photos, the pixels that were skin were identified using a k-means model (via `scikitlearn`). For a single face, the median r, g, and b values for the skin-pixels was calculated and stored.
-   **Last Modified**: April 2018
-   **Contact Information**: [Malaika Handa](mailto:handamalaika@gmail.com)
-   **Spatial Applicability**: There are many versions of Vogue magainze (eg, Vogue India). This analysis only used the covers for the "original" Vogue.
-   **Temporal Applicability**: January 2000 - December 2018
-   **Observations (Rows)**: Each row represents one female cover model's face.
-   **Variables (Columns)**:

| Header | Description | Data Type |
| --- | --- | --- |
| `date` | The date that the cover was published | date (m/d/yyyy) |
| `model` | The name of the model | text |
| `tone` | Median r, g, and b values of the skin-pixels of the model's face, in hex format | text (#xxxxxx) |
| `l` | Lightness value when the tone is converted to hsl format | float |

## models.csv

-   **What is this?**: Data representing the skin tone of the female cover models of Vogue magazine between 2000 and 2019, by model.
-   **Source(s) & Methodology**: The data in `faces.csv` was grouped and summarized by model.
-   **Last Modified**: April 2018
-   **Contact Information**: [Malaika Handa](mailto:handamalaika@gmail.com)
-   **Spatial Applicability**: There are many versions of Vogue magaizne (eg, Vogue India). This analysis only used the covers for the "original" Vogue.
-   **Temporal Applicability**: January 2000 - December 2018
-   **Observations (Rows)**: Each row represents the cumulative appearences (between January 2000 and December 2018) of one female cover model.
-   **Variables (Columns)**:

| Header | Description | Data Type |
| --- | --- | --- |
| `model` | The name of the model | text |
| `tone` | The average r, g, and b values of the tones corresponding to this model from `faces.csv`, in hex format | text (#xxxxxx) |
| `l` | Lightness value when the tone is converted to hsl format | float |
| `n_covers` | Number of Vogue covers between 2000 and 2019 with this woman's face | int |

- **Other Notes:**
    - While the Vogue archive is behind a paywall, many libraries (including NYPL) have a subscription, and a (free!) library card will allow you to access it.
    - The `model` column in both files does not include any accents in the model's name.
