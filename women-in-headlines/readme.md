
**Source(s) and Methodology:** Headlines tagged with the keywords  "women OR woman OR girl OR female OR lady OR ladies OR she OR her OR herself OR aunt OR grandmother OR mother OR sister" were scraped from the top 50 news publications according to [similarweb](https://www.similarweb.com/) in USA, India, UK and South Africa according using [rapidAPI google news API](https://rapidapi.com/newscatcher-api-newscatcher-api-default/api/google-news). 

Every dataset subsequently is based off this main dataset. Processing was done using python packages of 

**Last Modified:** May, 2021
**Contact Information:** [Leonardo Nicoletti](https://github.com/lnicoletti) and [Sahiti Sarva](https://github.com/sahitisarva)
**Temporal Applicability:** 2010-2020


## **headlines.csv**

What is this?: Original set of all headlines per publication, per year along with a bias score attached to each. 

**Observations (Rows):** headlines
**Variables (Columns):** 


## **word_dictionaries.json**
**What is this?:** Set of all custom made dictionaries based on which bias and themes are deciphered

## **word_themes_freq.csv**

**What is this?:** Dataset giving the frequency of each words in the four identified themes

**Observations (Rows):** Frequency by theme
**Variables (Columns):** Words

## **word_country_freq.csv**

**What is this?:** Frequency of each word tagged with the country in which it is published

	Rows: Countries
	Columns: Words
	Cell Value: Frequency

## **word_themes_rank.csv** 

**What is this?:** Rank of each word based on descending order of frequency tagged with a theme

## **word_themes.csv** 

**What is this?:** each word tagged with the theme it is associated with (includes no theme words)

## **polarity_comparison_country_time.csv**

**What is this?:** Mean and median polarity of women-centered and all headlines per country per year

## **polarity_comparison_site_country_time.csv** 

**What is this?:** Mean polarity of women-centered and all headlines per publication per country per year. Only a select sites are retained in the visual shown in the piece. The sites selected have a popularity value of 1.
**Columns:** site, country_of_pub, polarity_base, polarity_women, difference, popularity

## **headlines_site.csv** 

**What is this?:** Used for the bubble charts, this dataset holds information about the polarity and bias associated with every publication

## **headlines_reduced_bubble.csv**

**What is this?:** Reduced set of headlines which form the tooltip for the bubble chart

## **headlines_reduced_temporal.csv**

**What is this?:** Reduced set of headlines which form the tooltip for the temporal chart


## **country_time_freqrank_rapi_clean.csv**

**What is this?:** Dataset of frequency of each word per year per country proportional to the number of headlines that year

