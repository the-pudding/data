This folder contains the primary dataset used in The Pudding article The Evolution of the American Census published in March 2020.

Below you'll find metadata for the dataset.

## full_data.csv

- **What is this?**: Data of questions on U.S. Census questionnaires
- **Source(s) & Methodology**: [U.S. Census Bureau](https://www.census.gov/history/www/through_the_decades/questionnaires/)
- **Last Modified**: March 2020
- **Contact Information**: [Alec Barrett](mailto:alec@two-n.com)
- **Spatial Applicability**: United States
- **Temporal Applicability**: 1790 through 2020
- **Observations (Rows)**: Each row represents one question
- **Variables (Columns)**:

| Header                    | Description                                            | Data Type                   |
| ------------------------- | ------------------------------------------------------ | --------------------------- |
| `Year`                    | Decade of the question                                 | number                      |
| `UID`                     | unique identifier                                      | text                        |
| `Question`                | description of question                                | text                        |
| `Categories`              | subject(s) the question is asking about                | text (comma separated list) |
| `Unit`                    | what unit of observation question was asked at\*       | text                        |
| `Answer Type`             | type of answer expected\*\*                            | text                        |
| `Asked of`                | which subset, if any, question was asked of            | text                        |
| `Age range`               | which age ranges, if any, question was broken down by  | text (comma separated list) |
| `Multiple choice options` | list of options provided for multiple choice questions | text (comma separated list) |

- \* **`Unit` options**:

| Value                           | Description                                                                 | Example                                    |
| ------------------------------- | --------------------------------------------------------------------------- | ------------------------------------------ |
| Household                       | Question applies to a household                                             | How many people live here?                 |
| Individual                      | Question applies to an individual                                           | What is your occupation?                   |
| Reference Individual            | Question applies to head of household/reference individual                  | What is your telephone number?             |
| Sampled individual              | Question applies to an individual, and sample was taken at individual level | Where were you born?                       |
| Sampled household               | Question applies to a household, and sample was taken at household level    | How many bedrooms does this dwelling have? |
| Individual in sampled household | Question applies to an individual, and sample was taken at household level  | Where were you born?                       |

- \*\* **`Answer Type` options**:

_Note: a question's type is inferred based on the layout of the census form and instructions to the enumerator._

| Value | Description     | Example                                        |
| ----- | --------------- | ---------------------------------------------- |
| BN    | Yes/No          | Is this house on a farm?                       |
| CC    | Multiple choice | What is this person's sex: male, female?       |
| FD    | Date            | What is your month and year of birth?          |
| FM    | Money           | What is your monthly rent or mortgage payment? |
| FN    | Number          | How many people live here?                     |
| FT    | Text            | What is your occupation?                       |
