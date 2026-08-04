This folder contains the raw data for the story "Why some people mow a lawn better than others" published in August 2026.

The data will never be updated.

Below you'll find the metadata for each file.

## \[level\].csv

- **What is this?**: Path data for each individual's playthrough of a given round (files: tutorial, round1, round2, bonus1, bonus2, bonus3).
- **Source(s) & Methodology**: Experiment on The Pudding.
- **Last Modified**: August 2026
- **Contact Information**: [Russell Samora](mailto:russell@pudding.cool)
- **Spatial Applicability**: N/A
- **Temporal Applicability**: N/A
- **Observations (Rows)**: Each row represents one person and their path.
- **Variables (Columns)**:

| Header               | Description                                                                     | Data Type |
| -------------------- | ------------------------------------------------------------------------------- | --------- |
| `user_id`              | 10 character alphanumeric identifier                                                 | text      |
| `result`              | stringified JSON of the x/y position and timestamp of the path                                                 | text      |
| `platform`          | mobile (on-screen keypad) or desktop (keyboard)                                                     | text    |

## demographics.csv

- **What is this?**: Demographic data for optionally submitted survey
- **Source(s) & Methodology**: Experiment on The Pudding.
- **Last Modified**: August 2026
- **Contact Information**: [Russell Samora](mailto:russell@pudding.cool)
- **Spatial Applicability**: N/A
- **Temporal Applicability**: N/A
- **Observations (Rows)**: Each row represents one person.
- **Variables (Columns)**:

| Header               | Description                                                                     | Data Type |
| -------------------- | ------------------------------------------------------------------------------- | --------- |
| `user_id`              | 10 character alphanumeric identifier                                                 | text      |
| `age`              | How old are you?                                                 | text      |
| `style`          | How would you describe the way you mow a lawn or vacuum?                                                     | text    |
| `gaming`          | How often do you play video games?                                                     | text    |
| `hand`          | Are you left or right handed?                                                     | text    |
| `optimization`          | Does your work or studies involve solving optimization or routing problems?                                                     | text    |

## levels.json
- **What is this?**: Level metadata
- **Source(s) & Methodology**: Experiment on The Pudding.
- **Last Modified**: August 2026
- **Contact Information**: [Russell Samora](mailto:russell@pudding.cool)
- **Spatial Applicability**: N/A
- **Temporal Applicability**: N/A
- **Observations (Rows)**: Each item in the array represents one level.
- **Variables (Columns)**:


| Header               | Description                                                                     | Data Type |
| -------------------- | ------------------------------------------------------------------------------- | --------- |
| `id`              | Level identifier                                                 | text      |
| `label`              | Level display name                                                 | text      |
| `size`          | Grid width/height                                                     | number    |
| `optimal`          | Number of optimal moves                                                     | number    |
| `obstacles`          | Array of x/y values of obstacles positions                                                     | array    |

## Method

Data is a snapshot of the live experiment as of July 31, 2026. There was a pause in the experiment after the second level (round2) to collect demographic information. Later levels were optional and presented as bonus rounds, so fewer people played them.

