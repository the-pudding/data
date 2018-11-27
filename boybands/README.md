This folder contains all of the data used in The Pudding article [Internet Boy Band Database](https://pudding.cool/2018/11/boy-bands/) published in August 2018.

Below you'll find metadata for each file.

## bands.csv

- 	**What is this?**: This file contains information about 55 boybands that had at least 1 song chart on the US version of the Billboard Hot 100 between 1980 and 2018. The most popular (and if multiple at the same ranking, earliest) song for each band must also have contained a YouTube version of the music video to be included.
-   **Source(s)**: Bands were determined from a list of sources ([1](https://www.buzzfeed.com/mrloganrhoades/the-top-25-boy-bands-of-all-time), [2](https://www.billboard.com/articles/news/list/8362499/greatest-boy-band-songs-of-all-time-top-100), [3](https://www.teenvogue.com/gallery/best-boy-bands), [4](https://en.wikipedia.org/wiki/Category:American_boy_bands), [5](https://www.ranker.com/list/k-pop-bands-and-musicians/reference)) and then manually checked against Billboard charts to find the band's with at least one charting song.
-   **Last Modified**: September 4, 2018
-   **Contact Information**: [Amber Thomas](mailto:amber@polygraph.cool)
-   **Spatial Applicability**: United States
-   **Temporal Applicability**: All data was collected for bands with a song charting between January 1, 1980 and September 4, 2018.
-   **Observations (Rows)**: Each row represents data from a single boy band.
-   **Variables (Columns)**:

| Header | Description | Data Type |
|---|---|---|
| `band` |The full name of each band (typically not stylized). | text |
| `highest_pos` | The highest position on the Billboard Hot 100 that a song from this band reached. | number |
| `highest_pos_date` | The earliest date that one of this band's songs hit the `highest_pos`. Written as `YYYY-MM-DD` | date |
| `highest_song` | The name of the highest rating song for this band. (If there were multiple, this is the earliest). | text |
| `danceSpeed` | A binary indication of whether the song should enduce "pop"/upbeat dancing from our animated characters, or "slow"/soulful dancing. | text |
| `featuring_artist` | Some bands' most popular hit also involved a featured artist. This column is a binary indication of whether there was another artist present on the band's most popular track. | text |
|`highest_song_vid`| A link to a YouTube video of the band's highest ranking/earliest hit song. |URL|


## boys.csv

- 	**What is this?**: This file contains appearance information for the 234 boyband members that were featured in the band's music video in their highest ranking/earliest song (See the `highest_song_vid` column of the `bands.csv` file to see the video referenced for each group).
-   **Source(s)**: Data was collected manually by watching each music video and recording characteristics about each members' hair, clothing, skin tone, accessories, and instruments. Each boyband member was reviewed by two people and any discrepancies were resolved by a third reviewer. Since music videos typically involve several outfit/accessory changes, reviewers were instructed to describe the band members when all members were featured together in the same shot (a typical situation for boy band music videos).

- **Data Collectors**: *We owe a huge thanks to our volunteer data collectors for this project!!* They were: Adrian Blanco, Adriano Seghezzi, Alex Garcia, Amanda Smith, Andrew Harmon, Bo Plantinga, Britney Muller, Cathy Richards, Chad Horner, Charmaine Runes, Claire Tran, Daniel Pedraza, Emily deGrandpré, Freddie Odukomaiya, Ian Richards, Javier Galán Caballero, John Flynn, Jon Spring, Jorge Soriano, Kerry Driscoll, Kevin Arthur, Klemen Červ, Leena El Seed, Lindsy Goldberg, Marieke Jackson, Martin Radford, Megan Vo, Michael-Ellen Walden, Monica Cho, Noverdy Putra, Nujcharee Haswell (Ped), Oluwole Oyekanmi, Parul Agarwal, Raaid, Rhaydrick Sandokhan, Riki Matsumoto, Roberto Medico, Shoshana Wodinsky, ThaiBinh!, and Tom Lynch
-   **Last Modified**: November 26, 2018
-   **Contact Information**: [Amber Thomas](mailto:amber@polygraph.cool)
-   **Spatial Applicability**: United States
-   **Temporal Applicability**: All music videos were reviewed between August 24 and November 26, 2018.
-   **Observations (Rows)**: Each row represents data from a single boy band member.
-   **Variables (Columns)**:

| Header | Description | Data Type |
|---|---|---|
| `band` |The full name of each band (typically not stylized). This column can be `joined` with the `band` column of `band.csv`. | text |
| `dob` | The date of birth for each member. *This was collected via internet research so we can't be 100% certain this is accurate*. The dates are reported as `MM/DD/YYYY`. Any missing information is indicated as a blank space. (`''`) | date |
| `hair_color` | The general hair color of each band member. For a member with "frosted tips", this represents the "base" hair color. | date |
| `hair_frosted` | Indicates whether the hair is "frosted" (i.e., just the tips are bleached or colored). Values can be interpreted as follows: <br>&bull; `yes` = tips of hair are frosted traditionally (i.e., bleached blonde) <br>&bull; `no` = the tips of hair are the same color as the rest of the hair <br> &bull; `red` or `green` = the tips of the hair are dyed either red or green (respectively) | text |
| `hair_length` | An indication of each member's hair length (e.g., either `short`, `medium`, or `long`). | text |
| `hair_style` | The overall style of hair worn by each member in the selected music video. Examples for reviewers were given [here](https://imgur.com/a/j8DSrIE). | text |
|`eyes`| An indication of the member's eye color. Missing information is indicated as a blank. (`''`) |text|
|`facial_hair`| The amount and/or type of facial hair worn by each member (e.g., `mustache`, `goatee`, `soul patch`, `five o'clock shadow` etc.). If a single person had more than one type of facial hair, they are separated by a comma (e.g., `mustache, soul patch`) Missing information (or lack of facial hair) is indicated as a blank. (`''`) |text|
|`accessories`| The accessories (e.g., `earrings`, `sunglasses`, `hat`, `necklace` etc.) worn by each band member. If a single person had more than one accessory, they are separated by a comma (e.g., `glasses, earrings`) Missing information (or lack of accessories) is indicated as a blank. (`''`) |text|
|`top_style`| The style of shirt and/or jacket worn by each member. If a single person had more than one type of shirt and/or jacket, they are separated by a comma (e.g., `suit jacket, long-sleeve button down`) such that the item worn on the outside appears first (e.g., jackets or vests worn *over* another shirt will appear earlier in the list than shirts worn *under* an item). |text|
|`bottom_style`| The general type of pants (e.g., `jeans`, `dress pants`, `cargo pants`, `shorts`) of each member. |text|
|`height`| Each member's height (in inches). *This was collected via internet research so we can't be 100% certain this is accurate*. Any missing information is indicated as a blank. (`''`)  |number|
| `skin` | A general indication of each member's skin tone as defined by emojis. Skin tones are defined and reported as follows:  <br>&bull; `light` = ✋🏻 <br>&bull; `medium-light` = ✋🏼 <br> &bull; `medium` = ✋🏽 <br> &bull; `medium-dark` = ✋🏾 <br>&bull; `dark` = ✋🏿 | text |
|`instrument`| If a member was seen playing an instrument **in the music video we reviewed** that instrument was listed here (e.g., `drums`, `keyboard`, `guitar` etc.) Any members that didn't play instruments in the music video are indicated as a blank. (`''`)  |text|
|`shirt_color`| The color of each member's shirt (shirt style is indicated in `top_style`). If a member had more than one shirt/jacket indicated in `top_style`, `shirt_color` defines the **2nd** item in the comma-separated list.  |text|
|`jacket_color`| The color of each member's shirt (shirt style is indicated in `top_style`). If a member had more than one shirt/jacket indicated in `top_style`, `jacket_color` defines the **1st** item in the comma-separated list. Any missing information (or presence of only a single item in `top_style`) is indicated as a blank. (`''`)  |text|
|`bottom_color`| The color of each member's bottoms (bottom style is indicated in `bottom_style`). |text|
