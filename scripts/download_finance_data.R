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
filter(rev_fed_total > 0, 
       rev_state_total > 0, 
       rev_local_total > 0) %>%
  mutate(leaid = as.numeric(leaid)) %>%
  group_by(leaid)%>%
  summarize(rev_fed_avg = mean(rev_fed_total), 
            rev_state_avg = mean(rev_state_total), 
            rev_local_avg = mean(rev_local_total))


children <- read.csv("../data/hh.csv") %>%
  select(leaid, children)

finance_per_child <- children %>%
  left_join(finance_data, by = c("leaid")) %>%
  mutate(fed_per_child = rev_fed_avg/children, 
         state_per_child = rev_state_avg/children, 
         local_per_child = rev_local_avg/children) %>%
  select(leaid, fed_per_child, state_per_child, local_per_child)

write_csv(finance_per_child, "../data/finance.csv")

