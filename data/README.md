# Data Dictionary 


### Household conditions [(hh.csv)](https://github.com/jonmgeiger/household-conditions/blob/main/data/hh.csv)
Cleaned and pruned version of the original household conditions dataset. Changes include: 
- Rename variables for easier use (see [names_list.R] (https://github.com/jonmgeiger/household-conditions/blob/main/scripts/names_list.R)) 
- Transform the original "Margin of Error" (MOE) variable into a single sided MOE for future anlayses
- Include LEAID (state fips code + district ID) for easy joining
- Filter out New York Department of Education "School District" -- This is an extreme outlier, as it includes the children for all 32 NY districts. 
See [create_hh.R](https://github.com/jonmgeiger/household-conditions/blob/main/scripts/create_hh.R) for more details. 

| Variables | Description |
| --- | --- |
| `state` | State where each district resides|
| `leaid` | Local education agency identification number|
| `dist` | District name |
| `children` | An estimate of children between the ages 5-17 who are enrolled in school within a certain geographic school district.  |
| `pct_pov` | Percent of students within each geographical district boundary estimated to be living in poverty|
| `pct_SP` | Percent of households within each geographical district boundary estimated to be living in a household with only one father or one mother.|
| `SP_MOE` | Single-sided MOE for `pct_SP` estimate|
| `pct_HHVJ` | Percent of households within a geographical district estimated to have a homeowner working in a vulnerable economic sector |
| `HHVJ_MOE` | Single-sided MOE for `pct_HHVJ` estimate |
| `pct_CC` | Percent of households within a geographical district estimated to be living in crowded conditions|
| `CC_MOE` | Single-sided MOE for `pct_CC` estimate |
| `pct_NCI` | Percent of households within a geographical district estimated to be without computer or internet access |
| `nci_MOE` | Single-sided MOE for `pct_NCI` estimate|
| `pct_CD` | Percent of students estimated to be disabled|
| `CD_MOE` | Children with disabilities single-sided margin or error |
| `pct_CLI` | Percent of children within a geographic school district estimated to be linguistically isolated |
| `CLI_MOE` | Single-sided margin of error for `pct_CLI`|
| `region` | South, West, North Central, Northeast |

### Graduation rates (grad.csv)
- Sourced from an [Urban Institute R package](https://github.com/UrbanInstitute/education-data-package-r) API which includes graduation rates by cohort
- See [script](https://github.com/jonmgeiger/household-conditions/blob/main/scripts/download_grad_data.R) for reference on how we transformed the data to include graduation rates by district rather than cohort. 

| Variables | Description |
| --- | --- |
| `leaid` | Local education agency identification number|
| `grad_rate_midpt` | Average graduation rate |

### Race Data:
- Sourced from the [American Community Survey (ACS)](https://nces.ed.gov/programs/edge/Demographic/ACS) which incudes demographic estimates of each school district in the US averaged over 2014-2018. 
- See [create_race.R](https://github.com/jonmgeiger/household-conditions/blob/reproducibility/scripts/create_race.R) for data retreival information

### Assessment Data ([assess.csv](https://github.com/jonmgeiger/household-conditions/blob/main/data/assess.csv))
- Accessed through the [Urban Institute R package](https://github.com/UrbanInstitute/education-data-package-r) API
- Sourced from edfacts
- See [download_assess_data_R](https://github.com/jonmgeiger/household-conditions/blob/main/scripts/download_assess_data.R) for data retreival information

| Variables | Description |
| --- | --- |
| `leaid` | Local education agency identification number|
| `read_score` | 5-year average reading assessment score (2014-2018)|
| `math_score` | 5-year average math assessment score (2014-2018)|
| `total_score` | 5-year average total (reading+math) assessment score (2014-2018)|

### District Financial Data
- Accessed through the [Urban Institute R package](https://github.com/UrbanInstitute/education-data-package-r) API
- Sourced form the Common Core of Data (CCD)
- See [download_finance_data_R](https://github.com/jonmgeiger/household-conditions/blob/main/scripts/download_finance_data.R) for data retreival information

| Variables | Description |
| --- | --- |
| `leaid` | Local education agency identification number|
| `fed_per_child` | 4-year average total federal funding per child (2014-2017)|
| `state_per_child` | 4-year average total state funding per child (2014-2017)|
| `local_per_child` | 4-year average total local funding per child (2014-2017)|
