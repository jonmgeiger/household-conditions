# Source: https://github.com/UrbanInstitute/education-data-package-r

library(educationdata)
library(tidyverse)

school_finance <- get_education_data(
  level = 'school-districts', 
  source = 'ccd', 
  topic = 'finance', 
  filters = list(year = 2014:2017)
)

school_finance %>% 
  write_csv(file = "../data/finance_data.csv")

