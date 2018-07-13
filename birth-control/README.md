This folder contains all of the data and R scripts used in The Pudding essay [Let's Talk About Birth Control](https://pudding.cool/2018/07/birth_control/) published in July 2018.

Below you'll find metadata for each file.

## allData.zip

**Contains**
* `allData.csv`: The data described below.
* `allData.R`: The script used to collect the data from the CDC’s [National Survey of Family Growth](https://www.cdc.gov/nchs/nsfg/index.htm) website and process it using the provided `.sas.txt` files. This script was written in the R programming language. All details describing the R session environment during processing are available [here](#R-Session-Info).
* `2006_2010_FemRespSetup.sas.txt` : The install instructions for the 2006 - 2010 questionnaire (the 2011 - 2013 and 2013 - 2015 ones can be accessed via the internet).

> The `.csv` file contained in this zipped folder is 23.4 mb.

- 	**What is this?**: Data representing some of the questions asked on the Female Questionnaire of the CDC's National Survey of Family Growth.
-   **Source(s) & Methodology**: All data was acquired from the CDC’s [National Survey of Family Growth](https://www.cdc.gov/nchs/nsfg/index.htm). I combined the results of the [2006-2010](https://www.cdc.gov/nchs/nsfg/nsfg_2006_2010_puf.htm), [2011-2013](https://www.cdc.gov/nchs/nsfg/nsfg_2011_2013_puf.htm), and [2013-2015](https://www.cdc.gov/nchs/nsfg/nsfg_2013_2015_puf.htm) versions of the Female Questionnaire. Each of these surveys was administered “[continuously](https://www.cdc.gov/nchs/nsfg/about_nsfg.htm)”, or weekly over the course of several years instead of all at once. All survey-takers were “[household residents](https://www.cdc.gov/nchs/data/nsfg/NSFG_2013-2015_Summary_Design_Data_Collection.pdf#page3)” (i.e., not living in an institution such as prison, homes for juvenile delinquents, homes for the intellectually disabled, long-term psychiatric hospitals, and those living on military bases) living in the 50 United States or District of Columbia of reproductive age (15-44 years). The study design was intended to provide nationally representative sample that [oversamples](https://www.cdc.gov/nchs/data/nsfg/NSFG_2013-2015_Summary_Design_Data_Collection.pdf#page3) for non-Hispanic black people, Hispanic people, and teens aged 15-19. Any respondent that had never used any form of contraception was excluded from this analysis. More information about the CDC’s surveying methods is available [here](https://www.cdc.gov/nchs/nsfg/about_nsfg.htm).
  - Not all questions included in this dataset were included in the final article, but since nearly all questions were analyzed at some point in the preliminary analysis, they are included here.
  - Since nearly all responses are coded as numbers, the links to the codebook for each question are included in the table below.
-   **Last Modified**: July 12, 2018
-   **Contact Information**: [Amber Thomas](mailto:amber@polygraph.cool)
-   **Spatial Applicability**: United States (nationally representative data)
-   **Temporal Applicability**: 2006 - 2015
-   **Observations (Rows)**: Each row represents the responses from an individual person as evidenced by their unique `CASEID` numbers.
-   **Variables (Columns)**:

| Header | Description | Data Type |
|---|---|---|
| `CASEID` | The unique number assigned to an individual respondent | number |
| `AGE_R` | Respondent's age at the time of interview | number |
| `MARSTAT` | Respondent's marital status.  [here](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/816231?studyNumber=9999).| number |
| `PREGNOWQ` | Whether respondent is currently pregnant.  [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/816287?studyNumber=9999). | number |
| `RHADSEX` | Whether the respondent has ever had heterosexual vaginal intercourse. [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/816952?studyNumber=9999). | number |
| `SEDBC` | Did the respondent receive formal sexual education regarding methods of birth control before the age of 18? [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/816973?studyNumber=9999). | number |
| `SEDSTD` | Did the respondent receive formal sexual education regarding sexually transmitted diseases before the age of 18?  [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/816982?studyNumber=9999).| number |
| `SEDABST` | Did the respondent receive formal sexual education regarding abstinence until marriage before the age of 18? *This question was not asked in the 2006 - 2010 questionnaire*.  [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/816988?studyNumber=9999). | number |
| `LIFEPRTS` | Number of male sexual partners that the respondent has had in their lifetime | number |
| `HYST` | Whether the respondent is surgically sterile at the time of the interview due to a hysterectomy.  [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/817110?studyNumber=9999). | number |
| `OVAREM` | Whether the respondent is surgically sterile at the time of interview due to ovary removal. *This question was not asked in the 2006 - 2010 questionnaire*.  [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/817111?studyNumber=9999). | number |
| `OTHR` | Whether the respondent is surgically sterile at the time of interview due to another female operation.  [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/817112?studyNumber=9999). | number |
| `VASECT`| Whether the respondent's husband/partner is surgically sterile due to vasectomy at the time of interview.  [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/817212?studyNumber=9999). | number |
| `POSIBLPG` | Whether it is physically possible for the respondent to have a baby.  [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/817220?studyNumber=9999) | number |
| `POSIBLMN` | Whether it is physically possible for the respondent's husband/partner to father a baby.  [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/817222?studyNumber=9999). | number |
| `PILL` | Whether the respondent has ever used birth control pills.  [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/817237?studyNumber=9999). | number |
| `CONDOM` | Whether the respondent has ever used condoms.  [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/817238?studyNumber=9999). | number |
| `VASECTMY` | Whether the respondent has ever used a partner's vasectomy as a form of contraception.  [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/817239?studyNumber=9999). | number |
| `DEPOPROV` | Whether the respondent has ever used Depo-Provera or other injectable contraception.  [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/817240?studyNumber=9999). | number |
| `WIDRAWAL` | Whether the respondent has ever used withdrawal. [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/817241?studyNumber=9999). | number |
| `RHYTHM` | Whether the respondent has ever used the calendar rhythm method. [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/817242?studyNumber=9999). | number |
| `SDAYCBDS` | Whether the respondent has ever used the Standard Days of CycleBeads method. *This question was not asked in the 2006 - 2010 or 2011 - 2013 Questionnaires*. [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/817243?studyNumber=9999). | number |
| `TEMPSAFE` | Has the respondent ever used the Symptothermal method? [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/817244?studyNumber=9999). | number |
| `PATCH` | Has the respondent ever used a contraceptive patch. [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/817245?studyNumber=9999). | number |
| `RING` | Has the respondent ever used a vaginal contraceptive ring or "NuvaRing"? [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/817246?studyNumber=9999). | number |
| `MORNPILL` | Has the respondent ever used emergency contraception? [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/817247?studyNumber=9999). | number |
| `ECTIMESX` | Number of times that the respondent has used emergency contraception. | number |
| `EVERUSED` | A computed variable that indicates whether the respondent has ever used any form of contraception. [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/817265?studyNumber=9999). | number |
| `EVIUDTYP1`- `EVIUDTYP2` | Types of IUD that the respondent has ever used (first and second mention in separate columns). [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/817262?studyNumber=9999). | number |
|`METHSTOP01`- `METHSTOP10` | Method stopped due to dissatisfaction (mentions number 1 - 10 in separate columns). [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/817267?studyNumber=9999). | number |
|`STOPPILL1`- `STOPPILL6` | Computed open-ended response to reason(s) for discontinuation of the pill (1st through 6th mention in separate columns). [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/817283?studyNumber=9999). | number |
| `STOPCOND1`- `STOPCOND2` | Computed open-ended response to reason(s) for discontinuation of condoms (1st and 2nd mention in separate columns). [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/817296?studyNumber=9999). | number |
| `STOPDEPO1`- `STOPDEPO2` | Computed open-ended response to reason(s) for discontinuation of Depo-Provera (1st and 2nd mention in separate columns). [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/817306?studyNumber=9999) | number |
| `TYPEIUD_1`- `TYPEIUD_2` | Type of IUD that was discontinued due to dissatisfaction (1st and 2nd mention in different columns). [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/817311?studyNumber=9999). | number |
| `STOPIUD1` - `STOPIUD5` | Computed open-ended response to reason(s) for discontinuation of IUD (1st through 5th mention in separate columns). [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/817318?studyNumber=9999). | number |
| `REASPILL01`- `REASPILL06` | Reason that the user was unsatisfied with the pill (1st through 6th mention in separate columns). This question was only asked to users who have ever stopped using the pill (i.e., any of `METHSTOP01` - `METHSTOP10` = `3`). [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/817277?studyNumber=9999). | number |
| `REASCOND01`- `REASCOND07` | Reason that the user was unsatisfied with condoms (1st through 7th mention in separate columns). This question was only asked to users who have ever stopped using condoms (i.e., any of `METHSTOP01` - `METHSTOP10` = `4`). [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/817289?studyNumber=9999). | number |
| `REASDEPO01`- `REASDEPO07` | Reason not satisfied with Depo-Provera (1st through 8th mention in separate columns). This question was only asked to users who have ever stopped using Depo-Provera (i.e., any of `METHSTOP01` - `METHSTOP10` = `8`). [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/817298?studyNumber=9999). | number |
| `REASIUD01`- `REASIUD05` | Reason not satisfied with the IUD (1st through 5th mention in separate columns). This question was only asked to users who have ever stopped using an IUD (i.e., any of `METHSTOP01` - `METHSTOP10` = `19`). [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/817313?studyNumber=9999). | number |
| `WHYNOUSING1`- `WHYNOUSING5` | Reason the respondent is not using birth control (at risk of unintended pregnancy). 1st through 5th mention in separate columns. [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/817948?studyNumber=9999). | number |
| `FIRSMETH1`- `FIRSMETH4` | First contraceptive method ever used (1st through 4th mention in separate columns). [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/817323?studyNumber=9999). | number |
| `YUSEPILL1`- `YUSEPILL7` | Reasons for recent pill use (1st through 7th mention in separate columns). [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/817956?studyNumber=9999). | number |
| `JINTEND` | Do the respondent and husband/partner plan to have a/another baby some time? [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/818136?studyNumber=9999). | number |
| `JSUREINT` | How sure are the respondent and husband/partner that they will/will not have another baby? [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/818137?studyNumber=9999). | number |
| `INTEND` | Does respondent intend to have another baby some time? [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/818142?studyNumber=9999). | number |
| `SUREINT` | How sure is the respondent that they will/will not have a/another baby? [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/818143?studyNumber=9999). | number |
| `REACTSLF` | How respondent would feel if she got pregnant now. [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/818311?studyNumber=9999). | number |
| `LESSPLSR` | The chance that the respondent would feel less physical pleasure if partner used a condom. [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/818316?studyNumber=9999). | number |
| `EMBARASS` | The chance that condom discussion would embarrass respondent and partner. [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/818317?studyNumber=9999). | number |
| `ORIENT` | Respondent's sexual orientation. *This question was not asked in the 2006 - 2010 Questionnaire*. [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/818425?studyNumber=9999). | number |
| `CONFCONC` | Whether the respondent would ever not go for sexual or reproductive health care because their parents might find out. *This question was not asked in the 2006 - 2010 or 2011 - 2013 Questionnaire*. [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/818426?studyNumber=9999). | number |
| `BTHCON12` | Whether or not the respondent has received birth control or a prescription in the last 12 months. [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/817974?studyNumber=9999). | number |
| `MEDTST12` | Whether or not the respondent received a checkup for birth control in the last 12 months. [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/817975?studyNumber=9999). | number |
| `BC12PAYX7`- `BC12PAYX9`| The way that the bill was paid for birth control or a prescription (1st through 3rd mention in separate columns). [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/818020?studyNumber=9999). | number |
| `BC12PAYX10`- `BC12PAYX16`| The way the bill was paid for a check up for birth control. (1st through 6th mention in separate columns). [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/818023?studyNumber=9999). | number |
| `BC12PAY19`- `BCPAYX22`| The way the bill was paid for counseling about birth control. (1st through 4th methods in separate columns). [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/818028?studyNumber=9999). | number |
|`STRLOPER` | Type of sterilization operation "in effect" at the time of interview. [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/819066?studyNumber=9999). | number |
|`METHX1`- `METHX192`| Methods used within a given month. `METHX1` represents the first mention of a method used in the January 3 years before the survey year (e.g., survey year - 3). `METHX2` - `METHX4` represent the 2nd - 4th mention of a method used in January 3 years before the survey year. `METHX5` represents the first mention of a method used in February 3 years before the survey year etc. This continues with every set of of 4 columns representing the methods used in that month all the way up through December of the interview year. Each of these is a separate column. [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/817482?studyNumber=9999). | number |
| `SIMSEQX1`- `SIMSEQX48` | Whether the methods used in a given month (as reported by the `METHX` variables) were used at the same time or different times throughout the month. Each column represents a month where `SIMSEQX1` = January 3 years before the survey year, `SIMSEQX2` = February 3 years before the survey year etc. Each of these is a separate column. [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/817866?studyNumber=9999). | number |
| `LSTMTHP1`- `LSTMTHP4` | Method used during at last intercourse with last partner in the past 12 months (1st through 4th mention in separate columns). [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/817915?studyNumber=9999). | number |
| `CONSTAT1`- `CONSTAT4` | Current contraceptive status. [Codebook](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/819075?studyNumber=9999). | number |
| `yearRange` | Which survey was administered to this respondent? <br/>&bull; `0610` = 2006 - 2010<br/>&bull; `1113` = 2011 - 2013<br/>&bull; `1315` = 2013 - 2015 | number |


## everUsed.csv & everUsed.R

* `everUsed.csv`: The data described below.
* `everUsed.R`: The script used to process `allData.csv` (from `allData.zip`) to create `everUsed.csv`. The data was then used for the graphics in the section of [Let's Talk About Birth Control](https://pudding.cool/2018/07/birth_control/) labelled "Condoms and The Pill Are Go-To's". This script was written in the R programming language. All details describing the R session environment during processing are available [here](#R-Session-Info).



- 	**What is this?**: Data representing the types of contraception that respondents of the CDC's National Survey of Family Growth have ever used in their lifetime.
-   **Source(s) & Methodology**: All data was acquired in the same way as [allData.zip](#allData.zip). It was processed using the scripts in `everUsed.R`. Percentages were calculated out of 20,759 respondents.
-   **Last Modified**: July 12, 2018
-   **Contact Information**: [Amber Thomas](mailto:amber@polygraph.cool)
-   **Spatial Applicability**: United States (nationally representative data)
-   **Temporal Applicability**: 2006 - 2015
-   **Observations (Rows)**: Each row represents a single contraceptive type.
-   **Variables (Columns)**:

| Header | Description | Data Type |
|---|---|---|
| `cleanMethod` | The name of the contraceptive method used by the respondent. Categories not listed below are named as expected (e.g., the code for condoms is `CONDOM`).<br/>&bull; `DEPOPROV` = Depo-Provera or Injectables<br/>&bull; `MORNPILL` = Emergency Contraception<br/>&bull; `SDAYCBDS` = Standard Days or Calendar Method<br/>&bull; `STRLOPER` = Tubal Ligation<br/>&bull; `TEMPSAFE` = Sympto-thermal method<br/>&bull; `VASECTMY` = Vasectomy<br/>&bull; `WIDRAWAL` = Withdrawal | string |
| `count` | Total number of respondents that have ever used this type of contraception. | number |
| `percent` | The percentage of 20,759 respondents that have used a particular type of contraception. Data is presented as a whole number between 0 and 100. | number |

## firstTime.csv & firstTime.R

* `firstTime.csv`: The data described below
* `firstTime.R`: The script used to process `allData.csv` (from `allData.zip`) to create `firstTime.csv`. The data was used to create the graphics in the section of [Let's Talk About Birth Control](https://pudding.cool/2018/07/birth_control/) labelled "It Feels Like the First Time". This script was written in the R programming language. All details describing the R session environment during processing are available [here](#R-Session-Info).


- 	**What is this?**: Data representing the first type of contraception a person used grouped by the decade in which they first started using contraception.
-   **Source(s) & Methodology**: All data was acquired in the same way as [allData.zip](#allData.zip). It was processed using the scripts in `firstTime.R`. Percentages were calculated out of the number of respondents that started using contraception in a given decade.
-   **Last Modified**: July 12, 2018
-   **Contact Information**: [Amber Thomas](mailto:amber@polygraph.cool)
-   **Spatial Applicability**: United States (nationally representative data)
-   **Temporal Applicability**: 2006 - 2015
-   **Observations (Rows)**: Each row represents a single contraceptive type and decade combination.
-   **Variables (Columns)**:

| Header | Description | Data Type |
|---|---|---|
| `method` | A number representing the method of use. [Codebook here](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/817323?studyNumber=9999). | number |
| `decade` | The decade during which a respondent first began using contraception. This is represented as `70's`, `80's` etc.| string |
| `percent` | The percentage of respondents that used the same type of birth control first during a specific decade. This was calculated as the `number of people who first used birth control type A during decade X / total number of people who started using contraception in decade X`.| number |

## overTime.csv & overTime.R

* `overTime.csv`: The data described below
* `overTime.R`: The script used to process `allData.csv` (from `allData.zip`) to create `overTime.csv`. The data was used to create the graphics in the section of [Let's Talk About Birth Control](https://pudding.cool/2018/07/birth_control/) labelled "Different Age, Different Method". This script was written in the R programming language. All details describing the R session environment during processing are available [here](#R-Session-Info).


- 	**What is this?**: Data representing the first type of contraception a person used grouped by their age.
-   **Source(s) & Methodology**: All data was acquired in the same way as [allData.zip](#allData.zip). It was processed using the scripts in `overTime.R`.
-   **Last Modified**: July 12, 2018
-   **Contact Information**: [Amber Thomas](mailto:amber@polygraph.cool)
-   **Spatial Applicability**: United States (nationally representative data)
-   **Temporal Applicability**: 2006 - 2015
-   **Observations (Rows)**: Each row represents a single contraceptive type and age combination.
-   **Variables (Columns)**:

| Header | Description | Data Type |
|---|---|---|
| `method` | A number representing the method of use. [Codebook here](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/819075?studyNumber=9999). | number |
| `methodR` | The number of respondents of a specific age that are currently using a certain method| number |
| `total` | The total number of respondents that are currently a specific age.| number |
| `percent` | The percentage of respondents of a certain age using a specific method. This was calculated as the `number of people using a method at a given age / total number of people currently that age`. | number |
| `calcAge` | Respondent's age (in years). | number |


## multipleMethods.csv & multipleMethods.R

* `multipleMethods.csv`: The data described below
* `multipleMethods.R`: The script used to process `allData.csv` (from `allData.zip`) to create `multipleMethods.csv`. The data was used to create the graphics in the section of [Let's Talk About Birth Control](https://pudding.cool/2018/07/birth_control/) labelled "Double Bag It". This script was written in the R programming language. All details describing the R session environment during processing are available [here](#R-Session-Info).


- 	**What is this?**: Data representing the combinations of birth control methods used by respondents over a 4 year timespan.
-   **Source(s) & Methodology**: All data was acquired in the same way as [allData.zip](#allData.zip). It was processed using the scripts in `multipleMethods.R`.
-   **Last Modified**: July 12, 2018
-   **Contact Information**: [Amber Thomas](mailto:amber@polygraph.cool)
-   **Spatial Applicability**: United States (nationally representative data)
-   **Temporal Applicability**: 2006 - 2015
-   **Observations (Rows)**: Each row represents a single contraceptive type combination.
-   **Variables (Columns)**:

| Header | Description | Data Type |
|---|---|---|
| `m1` | A number representing the first method of use. [Codebook here](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/817482?studyNumber=9999). | number |
| `m2` | A number representing the second method of use. [Codebook here](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/817482?studyNumber=9999).| number |
| `uniqueR` | The number of unique respondents that have used a specific combination of methods at least once simultaneously.| number |

## sideEffects.csv & sideEffects.R

* `sideEffects.csv`: The data described below
* `sideEffects.R`: The script used to process `allData.csv` (from `allData.zip`) to create `sideEffects.csv`. The data was used to create the graphics in the section of [Let's Talk About Birth Control](https://pudding.cool/2018/07/birth_control/) labelled "Side Effects are a Deal Breaker". This script was written in the R programming language. All details describing the R session environment during processing are available [here](#R-Session-Info).


- 	**What is this?**: Data representing the types of side effects that respondents listed as reasons for stopping Depo-Provera, Pill, IUD, and condom use.
-   **Source(s) & Methodology**: All data was acquired in the same way as [allData.zip](#allData.zip). It was processed using the scripts in `sideEffects.R`.
-   **Last Modified**: July 12, 2018
-   **Contact Information**: [Amber Thomas](mailto:amber@polygraph.cool)
-   **Spatial Applicability**: United States (nationally representative data)
-   **Temporal Applicability**: 2006 - 2015
-   **Observations (Rows)**: Each row represents a single contraceptive type combination.
-   **Variables (Columns)**:

| Header | Description | Data Type |
|---|---|---|
| `stopMethod` | The method that has been stopped by the respondent. | string |
| `reason` | A number representing the reason that the method was stopped. There is a different codebook for each type. They are available here: <br/>&bull; [Condom Codebook - General](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/817289?vg=10307&studyNumber=9999)<br/>&bull; [Condom Codebook - Specific](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/817296?studyNumber=9999)<br/>&bull; [IUD Codebook - General](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/817313?studyNumber=9999)<br/>&bull; [IUD Codebook - Specific](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/817318?studyNumber=9999)<br/>&bull; [Pill Codebook - General](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/817277?studyNumber=9999)</br>&bull; [Pill Codebook - Specific](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/817283?studyNumber=9999)</br>&bull; [Depo-Provera Codebook - General](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/817298?studyNumber=9999)</br>&bull; [Depo-Provera Codebook - Specific](https://www.icpsr.umich.edu/icpsradmin/nsfg/variable/817306?studyNumber=9999)| number |
| `total` | The total number of unique respondents that reported a side effect. | number |
| `percent` | The percentage of respondents that reported a specific side effect. This was calculated as `number of people that experienced a stopped using a method due to a specific side effect/ total number of people that stopped using that method for some reason`. Represented as a number from 0 to 100 with one decimal place. | number |
| `type` | The CDC reports two types of reasons for discontinued use: a general reason and a specific reason. If a respondent selects that they stopped using a method due to `side effects` or `other` in the general response, they are asked to give a more specific reason for discontinuing. The general and specific responses are labelled accordingly and coincide with the general and specific codebooks labeled in the `reason` variable above. | string |

## analysis.Rmd & analysis.html
These files contain the full, mostly un-edited version of my preliminary and final analyses for this project. Some of the analyses did not make it into the final project. To view the code and preliminary figures, check out the `.html` file instead of the `.Rmd` file.

## R Session Info
  ### Session info
    ##  setting  value                       
    ##  version  R version 3.4.4 (2018-03-15)
    ##  system   x86_64, darwin15.6.0        
    ##  ui       X11                         
    ##  language (EN)                        
    ##  collate  en_US.UTF-8                 
    ##  tz       America/Los_Angeles         
    ##  date     2018-07-12

  ### Packages

    ##  package   * version date       source        
    ##  backports   1.1.2   2017-12-13 CRAN (R 3.4.3)
    ##  base      * 3.4.4   2018-03-15 local         
    ##  compiler    3.4.4   2018-03-15 local         
    ##  datasets  * 3.4.4   2018-03-15 local         
    ##  devtools    1.13.6  2018-06-27 CRAN (R 3.4.4)
    ##  digest      0.6.15  2018-01-28 CRAN (R 3.4.3)
    ##  evaluate    0.10.1  2017-06-24 CRAN (R 3.4.1)
    ##  graphics  * 3.4.4   2018-03-15 local         
    ##  grDevices * 3.4.4   2018-03-15 local         
    ##  htmltools   0.3.6   2017-04-28 CRAN (R 3.4.0)
    ##  knitr       1.20    2018-02-20 CRAN (R 3.4.3)
    ##  magrittr    1.5     2014-11-22 CRAN (R 3.4.0)
    ##  memoise     1.1.0   2017-04-21 CRAN (R 3.4.0)
    ##  methods   * 3.4.4   2018-03-15 local         
    ##  Rcpp        0.12.16 2018-03-13 CRAN (R 3.4.4)
    ##  rmarkdown   1.9     2018-03-01 CRAN (R 3.4.3)
    ##  rprojroot   1.3-2   2018-01-03 CRAN (R 3.4.3)
    ##  stats     * 3.4.4   2018-03-15 local         
    ##  stringi     1.1.7   2018-03-12 CRAN (R 3.4.4)
    ##  stringr     1.3.1   2018-05-10 CRAN (R 3.4.4)
    ##  tools       3.4.4   2018-03-15 local         
    ##  utils     * 3.4.4   2018-03-15 local         
    ##  withr       2.1.2   2018-03-15 CRAN (R 3.4.4)
    ##  yaml        2.1.18  2018-03-08 CRAN (R 3.4.4)
