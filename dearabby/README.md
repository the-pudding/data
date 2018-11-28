This folder contains all of the data used in The Pudding essay [30 Years of American Anxieties: What 20,000 letters to an advice columnist tell us about what—and who—concerns us most.](https://pudding.cool/2018/11/dearabby/) published in November 2018.

Below you'll find metadata for each file.

## raw_da_qs.csv

- **What is this?**: 20K questions written in to Dear Abby.
- **Source(s) & Methods**: This includes questions publicly available on https://www.uexpress.com/, as well as a number of questions from the mid-1980s, obtained through digital copies of newspapers which included Dear Abby questions.
- **Last Modified**: 11/28/2018.
- **Contact Information**: [Ilia Blinderman](mailto:ilia@pudding.cool)
- **Temporal Applicability**: 1985-Fall of 2017
- **Observations (Rows)**: Each row represents a single question or letter published in the Dear Abby column.
- **Variables (Columns)**:

| Header        | Description                                          | Data Type |
| ------------- | ---------------------------------------------------- | --------- |
| year          | Letter publication year                              | number    |
| month         | Letter publication month                             | number    |
| day           | Letter publication day                               | number    |
| url           | URL where question may be found alongside the answer | text      |
| title         | Title of the column wherein the letter appeared      | text      |
| letterId      | Number of the letter, when multiple letters appear   | number    |
| question_only | Text of the question                                 | text      |
