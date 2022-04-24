# Source: https://github.com/UrbanInstitute/education-data-package-r

library(tidyverse)
library(educationdata)

df <- get_education_data(
    level = 'school-districts', 
    source = 'edfacts', 
    topic = 'grad-rates', 
    filters = list(year = 2014:2018)
)

df %>% 
    write_csv(file = "graduation_data.csv")
