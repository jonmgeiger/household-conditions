# Source: https://github.com/UrbanInstitute/education-data-package-r

library(tidyverse)
library(educationdata)

df <- get_education_data(
    level = 'school-districts', 
    source = 'edfacts', 
    topic = 'grad-rates', 
    filters = list(year = 2014:2018)
)


grad_rates <- df %>% 
  select(leaid, lea_name, year, cohort_num, grad_rate_midpt) 

grad_rates_summarized <- grad_rates %>% 
  filter(
    !is.na(cohort_num), grad_rate_midpt > 0
  )%>%
  group_by(
    leaid, year
  ) %>% 
  mutate(
    cohort_total = sum(cohort_num, na.rm = TRUE),
    cohort_weight = cohort_num/cohort_total,
    .after = cohort_num
  ) %>% 
  summarize( # Weighted Averages within year based on cohort size
    cohort_total = max(cohort_total), 
    grad_rate_midpt = sum(cohort_weight * grad_rate_midpt)
  ) %>% 
  group_by(leaid) %>%
  mutate(
    student_total = sum(cohort_total, na.rm = TRUE),
    student_weight = cohort_total/student_total,
    .after = cohort_total
  ) %>%
  summarize( # Weighted Averages within district based on total size
    student_total = max(student_total), 
    grad_rate_midpt = sum(student_weight * grad_rate_midpt)
  )
View(grad_rates_summarized)

grad_rates_summarized %>% 
    write_csv(file = "../data/grad.csv")

