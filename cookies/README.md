
This folder contains all of the data used in The Pudding essay [Baking the Most Average Chocolate Chip Cookie](https://pudding.cool/2018/05/cookies) published in May 2018.

Below you'll find metadata for each file.

## choc_chip_cookie_ingredients.csv

- 	**What is this?**: This is the list of ingredients that were analyzed in the average cookie essay. It represents the ingredient lists from 211 chocolate chip cookie recipes, all scaled to yield 48 servings and with the units standardized.
-   **Source(s) & Methodology**: Some recipes were scraped from recipe databases AllRecipes and Epicurious. The remaining recipes were gathered by hand from the internet.
-   **Last Modified**: May 10, 2018.
-   **Contact Information**: Please contact [Elle O'Brien](mailto:andronovhopf@gmail.com). 
-   **Spatial Applicability**: NA
-   **Temporal Applicability**: The time range that is represented in the data is recipes uploaded to the internet prior to February 2018.

| Header | Description | Data Type |
|---|---|---|
| `Ingredient` | The name of the ingredient. Some standardizing was done by hand, such as converting "flour" and "bleached flour" to "all purpose flour".|text|
| `Text` | The whole text description of the ingredient and the quantity (after scaling to 48 servings)| text |
| `Recipe_Index` | A tag used to label recipe sources. Tags beginning with "AR_" come form AllRecipes; tags beginning with "E_" come from Epicurious, and tags beginning with "Misc__" were hand-collected | text |
| `Rating` | If a rating was available on the recipe, it is provided as a numeric value. All ratings are normalized to be between 0 and 1.| number |
| `Quantity` | The scalar quantity of the ingredient, after scaling to 48 servings| number |
| `Unit` | The unit that the ingredient is measured in | number |

- **Other Notes:**
    - When scaling the ingredients to yield 48 servings, we interpreted one serving to be one cookie. This was the convention in the vast majority of recipes we collected. However, we cannot guarantee that every recipe followed this rule, and some recipes create cookies of different sizes. 
	-Units were converted as needed so that only one unit was used per ingredient. 
	
## All_directions.txt

- 	**What is this?**: This is the corpus of recipe instructions that were analyzed in the average cookie essay. It represents the baking instructions from 211 chocolate chip cookie recipes.
-   **Source(s) & Methodology**: Some recipes were scraped from recipe databases AllRecipes and Epicurious. The remaining recipes were gathered by hand from the internet.
-   **Last Modified**: May 10, 2018.
-   **Contact Information**: Please contact [Elle O'Brien](mailto:andronovhopf@gmail.com). 
-   **Spatial Applicability**: NA
-   **Temporal Applicability**: The time range that is represented in the data is recipes uploaded to the internet prior to February 2018.

- **Other Notes:**
    - This is a corpus of all the recipe ingredients listed in a single document.

