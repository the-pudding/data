This folder contains a snapshot of the raw data used in The Pudding newsletter Winning the Internet published in July 2020.

The data will sometimes be updated.

Below you'll find the metadata for each file.

## dump-2020-12-15.csv

- **What is this?**: Data of every link found in newsletters.
- **Source(s) & Methodology**: Parses links from over 100 newsletters every 30 minutes.
- **Last Modified**: December 2020
- **Contact Information**: [Russell Goldenberg](mailto:russell@pudding.cool)
- **Spatial Applicability**: N/A
- **Temporal Applicability**: June 26, 2020 - December 15, 2020
- **Observations (Rows)**: Each row represents one link.
- **Notes**: a link is programatically flagged if it appears 3+ times in a single newsletter, or contains a likely subscribe/unsubscribe url.
- **Variables (Columns)**:

| Header       | Description                              | Data Type |
| ------------ | ---------------------------------------- | --------- |
| `url`        | link from email                          | text      |
| `date`       | date newsletter was sent                 | date      |
| `newsletter` | name of newsletter                       | text      |
| `flag`       | if marked as spam (see definition above) | boolean   |
