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
  select(-leaid_num, -(race:econ_disadvantaged)) %>%
  filter(read_test_pct_prof_midpt > 0, 
         math_test_pct_prof_midpt > 0) %>%
  mutate(leaid = as.numeric(leaid)) %>%
  group_by(leaid)%>%
  summarize(read_score = mean(read_test_pct_prof_midpt), 
            math_score = mean(math_test_pct_prof_midpt))
school_assess <- school_assess %>%
  mutate(total_score = read_score+math_score)

school_assess %>% 
  write_csv(file = "../data/assess.csv")

