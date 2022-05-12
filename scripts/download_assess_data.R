# Source: https://github.com/UrbanInstitute/education-data-package-r

library(educationdata)
library(tidyverse)

school_assess <- get_education_data(
  level = 'school-districts', 
  source = 'edfacts', 
  topic = 'assessments', 
  filters = list(year = 2014:2018, 
                 grade_edfacts = 9)
)

school_assess <- school_assess %>%
  select(-leaid_num, -(race:econ_disadvantaged))

school_assess %>% 
  write_csv(file = "../data/school_assess.csv")

