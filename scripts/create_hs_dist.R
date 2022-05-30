library(tidyverse)

Public_Schools <- read_csv("../raw/public_schools.csv")
hh <- read_csv("../data/hh.csv")

US_PS <- Public_Schools %>%
  filter(COUNTRY == "USA") %>%
  select(-(X:OBJECTID),
         -(ADDRESS:WEBSITE), 
         -FT_TEACHER, 
         -SHELTER_ID, 
         -NCESID, 
         -ENROLLMENT)%>%
  rename(leaid =DISTRICTID, 
         level = LEVEL_)

high_dist <- US_PS %>%
  filter(END_GRADE == "12" | level == "HIGH")

high_dist <- high_dist %>%
  select(leaid) %>%
  mutate(leaid = as.integer(leaid))

write_csv(high_dist, 
          "../data/hs_dist.csv")


