# Household Conditions by Geographic School District

For the completion of the Data & Society Capstone course at Seattle Pacific University, our class was asked to follow the guidelines of the 2022 Data Challenge Expo put on by by the American Statistical Association. 

These guidelines include: 
- Contestants must use at least one of the five data sets selected from the Urban Institute Data Catalog
- Contestants must combine their chosen data set with at least one other publicly available data set. One option is to use another data set from the list.
More details can be found [here](https://community.amstat.org/dataexpo/home)

Sourced from the American Community Survey (ACS) and provided by the [Urban Institute](https://datacatalog.urban.org/dataset/household-conditions-geographic-school-district), our group was assigned Household Conditions by Geogrpahic Shool District which describes the share of households within a geographic school district between 2014 and 2018 under conditions that may affect remote K-12 learning environments.

## A look at the data

These five-year estimates of household conditions within a geographic school district are calculated based on aggregate Census survey data for households within each school district’s geographic location. Because of this, some estimates may include households without school-aged children (noted in descriptions) which is partly accounted for in each estimate’s corresponding margin of error. 

| Variables | Definition |
| --- | --- |
| `School ID` |Distinct district ID|
| `State` |Includes all 50 States of the US.|
| `Geographic School District` |A geographic school district is defined as a public-school district that has geographic boundaries reported by a state. This does not include private schools or charter school systems unless they have geographic boundaries that are reported by the state.  |
| `Children 5-17` (SAIPE\* estimate) | An estimate of children between the ages 5-17 who are enrolled in school within a certain geographic school district. A child is estimated to be enrolled in a school district if they live within the boundaries of the district and their “assigned grade is within the grade range for which the district is financially responsible” [(EDGE)](https://nces.ed.gov/programs/edge/Demographic/ACSchildren). This estimate does not account for children who are enrolled in private school or those who attend school outside the boundaries of their geographically assigned public-school district. \* _yearly estimate made by US Census Bureau’s Small Area Income and Poverty Estimates (**SAIPE**) Program based on Census responses._|
| `Poverty` (SAIPE estimate) | A student is considered to be in poverty if their family’s income is at or below 100 percent of the federal poverty level. The poverty level changes each year and is calculated based on how many people are living in a household. _(See poverty rates between 2014 and 2018 according to the [HHS Poverty Guidelines](https://aspe.hhs.gov/topics/poverty-economic-mobility/poverty-guidelines/prior-hhs-poverty-guidelines-federal-register-references))_|
| `Single Parents` | Students have single parents if they are living in a household with only one father or one mother.|
| `Linguistically Isolated` | A student is considered linguistically isolated if no one at or above the age of 14 speaks English as their first language, or who speaks English “very well” as their second language.|
| `Children with Disability` | Students who have cognitive, ambulatory, independent living, selfcare, vision, or hearing difficulties are considered to be children with disability. |
| `Parents in vulnerable economic sectors` |Parents are considered to be in vulnerable economic sectors if they earn less than 800 dollars a week and works in industries that are most likely to be laid off. This includes those working in the entertainment, service, and retail industries. Parents of a household are defined as the householder and his or her spouse or partner.|
| `Crowded Conditions` | Students are considered to be living crowded conditions if there is less than one room per household member. A room is a space enclosed by walls, a floor and a ceiling. This excludes bathrooms, porches, balconies, foyers, halls, and unfinished basements. This estimate is calculated for all occupied households, including households without students. |
|`Lack of computer or broadband internet`| Students living in a household without a computer or without broadband internet connection. This estimate includes household with non-dial-up internet in its definition of broadband. This estimate also considers desktop computers, laptops, smartphones and tablets as computers.|

### Margin of Error: 
Because each household condition is an estimate, this dataset includes a margin of error variable for each estimate. The Census Bureau has documentation of the methodology used by the ACS to calculate estimates and margin of errors.

[ACS Design and Methodology – Chapter 12: Variance Estimation](https://www2.census.gov/programs-surveys/acs/methodology/design_and_methodology/acs_design_methodology_ch12_2014.pdf)  
(See Section 12.3: Margin of Error and Confidence Interval)

[Documentation for the 2014-2018 Variance Replicate Estimates Tables](https://www2.census.gov/programs-surveys/acs/replicate_estimates/2018/documentation/5-year/2014-2018_Variance_Replicate_Tables_Documentation.pdf)   
(See page 8 about MOEs for Zero Counts and Percent Estimates of Zero or 100 Percent)

### Dealing with Margin of Error Columns
The Margin of Error columns for the estimates were originally formatted 0%-100%. We transformed these MOEs into one-sided margin of errors for easier use later on. 
- There are no NA values in the dataset, but there are many estimates that have Margin of Errors of .5 which means these estimates are likely not accurate. Thus, we filtered out all school districts with MOEs of .5 


## Process

Our data process was neither uniform, nor organized. Our final research question was informed by the exploration of our given dataset as well as many other school district topics--a process that took most of the quarter. You will be able to follow the evolution of our project and research question through our weekly [powerpoint updates](https://github.com/jonmgeiger/household-conditions/tree/reproducibility/slides). Along with the powerpoint updates, we completed anlayses each week to document our data exploration and findings as we started the process of deciding our research question. Here are the analyses in order of when they were completed. These can also be found in the [analysis directory](https://github.com/jonmgeiger/household-conditions/tree/main/analyses) but they are not in order) 


Week 1: 
- [prelim-analysis](https://jonmgeiger.github.io/household-conditions/analyses/prelim-analysis.html)
- [margins-of-error](https://jonmgeiger.github.io/household-conditions/analyses/margins-of-error.html)

Week 2: 
- [race_households-join](https://jonmgeiger.github.io/household-conditions/analyses/race_households_join.html)

Week 4/5: 
- [grad_rates_join](https://github.com/jonmgeiger/household-conditions/blob/main/analyses/grad_rates_join.html)
- [grad_rates_analysis](https://github.com/jonmgeiger/household-conditions/blob/main/analyses/grad_rates_analysis.html)

Week 6: 
- [high_school_dist](https://github.com/jonmgeiger/household-conditions/blob/reproducibility/analyses/high_school_dist.html)

Week 7: 
- [assessment_analysis](https://jonmgeiger.github.io/household-conditions/analyses/assessment_analysis.html)
- [revenue_analysis](https://jonmgeiger.github.io/household-conditions/analyses/revenue_hh_join.html)

Weeks 8-9: 
- [regression_initial](https://jonmgeiger.github.io/household-conditions/analyses/regression_initial.html)
- [tidymodels_regression](https://jonmgeiger.github.io/household-conditions/analyses/tidymodels_regrassion.html)
- [predictor_distributions.html](https://jonmgeiger.github.io/household-conditions/analyses/predictor_distributions.html)


## Research Question
Based upon our observations throughout the quarter, we became interested graduation rates and specifically how we could predict a district's graduation rate based upon different indicators. This led us to our main reserach question: 

### Are household conditions, race, assessment scores, and school funding good predictors of school district graduation rates in the United States? 

## Methodology 

The first step of this question was which regression model would be most reflective of the data we had. Through the tidymodels package in r we were able to run 8 different models to assess which one would be the most accurate. Through these trial runs, we found that the gradient boosted tree and random forest models were the most accurate models for predicting graduation rates. 

Next steps? what else to say? 

## Conclusions: 


