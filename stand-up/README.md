This folder contains all of the data used in The Pudding essay [The Structure of Stand-Up Comedy](https://pudding.cool/2018/02/stand-up) published in February 2018.

Below you'll find metadata for each file.

## ali-wong--captions.csv

* **What is this?**: Data representing each line of captions and its corresponding manually added data.
* **Source(s) & Methods**: Netflix caption files. Manually collected data by watching and entering data.
* **Last Modified**: February 12, 2018.
* **Contact Information**: [Russell Goldenberg](mailto:russel@polygraph.cool)
* **Spatial Applicability**: NA
* **Temporal Applicability**: NA
* **Observations (Rows)**: Each row represents a single caption in Ali Wong's Netflix special Baby Cobra.
* **Variables (Columns)**:

| Header      | Description                      | Data Type |
| ----------- | -------------------------------- | --------- |
| `start`     | start time of caption            | text      |
| `stop`      | stop time of caption             | text      |
| `caption`   | caption text                     | text      |
| `laugh`     | laughter duration                | number    |
| `group`     | topic group id                   | text      |
| `timeStart` | start time of caption in seconds | number    |
| `timeStop`  | start time of caption in seconds | number    |

## ali-wong--captions.csv

* **What is this?**: Data representing each topic in Ali Wong's routine.
* **Source(s) & Methods**: Netflix caption files. Manually collected data by watching and entering data.
* **Last Modified**: February 12, 2018.
* **Contact Information**: [Russell Goldenberg](mailto:russel@polygraph.cool)
* **Spatial Applicability**: NA
* **Temporal Applicability**: NA
* **Observations (Rows)**: Each row represents a topic sequence in Ali Wong's Netflix special Baby Cobra.
* **Variables (Columns)**:

| Header      | Description                                               | Data Type |
| ----------- | --------------------------------------------------------- | --------- |
| `callback`  | start time of callback referenced                         | text      |
| `level`     | level of nesting (top level = 1, deepest level = 6)       | number    |
| `group`     | unique id for the topic                                   | text      |
| `end`       | if it closes a previous level (and the level # it closes) | number    |
| `timeStart` | start time of topic in seconds                            | number    |
| `totalStop` | stop time of topic in seconds                             | number    |
| `index`     | unique index                                              | number    |
| `topicEnd`  | time in seconds where topic level closes                  | number    |
