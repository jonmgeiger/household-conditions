# Data Dictionary 

### Household Conditions by Geographic School District [(NHGIS_District_data.xlsx)](https://github.com/jonmgeiger/household-conditions/blob/main/data/NHGIS_District_data.xlsx)
-  Provided by the [Urban Institute](https://datacatalog.urban.org/dataset/household-conditions-geographic-school-district)

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
- Sourced from an [Urban Institute R package](https://github.com/UrbanInstitute/education-data-package-r) which includes graduation rates by cohort
- See [script](https://github.com/jonmgeiger/household-conditions/blob/main/scripts/download_grad_data.R) for reference on how we transformed the data to include graduation rates by district rather than cohort. 

| Variables | Description |
| --- | --- |
| `leaid` | State fips code + district ID (7 digits)|
| `grad_rate_midpt` | Average graduation rate |

### Race Data:
- Sourced from the [American Community Survey (ACS)](https://nces.ed.gov/programs/edge/Demographic/ACS) which incudes demographic estimates of each school district in the US averaged over 2014-2018. 
- 

## Joined Datasets: 
The joined datasets are titled according to which datasets are included in the join. For example, the race_household.csv includes both the race data and household data. 

#### Key: 
- **grad** = Graduation Rates  
- **race** =  Race Data   
- **raceP** = Race Data, pruned (extraneous variables removed)
  - **predom** = includes predominant race column
- **household/HH** = Household Conditions data   
- **school** = Public School data  
