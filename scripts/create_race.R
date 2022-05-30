# Accessed through https://nces.ed.gov/programs/edge/TableViewer/acsProfile/2018 
# Downloading instructions: 
### Dataset: "2014-2018"
### Select Geography: "All Districts"
### Select Population Group: "Relevant Children -- Enrolled Public"
### Find Table: "[CDP05] SELECTED DEMOGRAPHIC CHARACTERISTICS OF CHILDREN", 
### Select "[CDP05.3] HISPANIC OR LATINO AND RACE" 

library(tidyverse) 

race_data <- read_delim("../raw/race_raw.txt", delim = "|", escape_double = FALSE, trim_ws = TRUE)

race_names<- c("geo_id",
               "dist", 
               "leaid", 
               "year", 
               "Iteration",
               "total_pop_est", #Total population
               "total_pop_moe", # total population MOE
               "total_hisp_latino", #Total population; Hispanic or Latino (of any race)
               "total_hisp_latino_moe", #Total population; Hispanic or Latino (of any race) MOE
               "pct_hisp_latino", # % total population: Hispanic or Latino (of any race)
               "pct_hisp_latino_moe", # % total population: Hispanic or Latino (of any race) MOE
               "total_mexican", # total mexican population
               "total_mexican_moe", # total mexican population MOE
               "pct_mexican", # % mexican population
               "pct_mexican_moe", # % mexican population MOE
               "total_puertrican", # total puertorican population
               "total_puertrican_moe", # total puertorican population MOE
               "pct_puertrican",  # % puertorican population
               "pct_puertrican_moe", # % puertorican population MOE
               "total_cuban", # total cuban population
               "total_cuban_moe", # total cuban population MOE
               "pct_cuban", # % cuban population
               "pct_cuban_moe", # % cuban population MOE
               "total_other_hl", # total population of other hispanic and latino
               "total_other_hl_moe", # total population of other hispanic and latino MOE
               "pct_other_hl", # % population of other hispanic and latino
               "pct_other_hl_moe", # % population of other hispanic and latino MOE
               "total_NOT_hl", # total population that are not hispanic nor latino
               "total_NOT_hlmoe", # total population that are not hispanic nor latino MOE
               "pct_NOT_hl", # % population that are not hispanic nor latino
               "pct_NOT_hl_moe", # % population that are not hispanic nor latino MOE
               "total_white", #total population white
               "total_white_moe", #total population white MOE
               "pct_white", # % population white
               "pct_white_moe", # % population white MOE
               "total_black", #total population black or african american
               "total_black_moe", #total population black or african american MOE
               "pct_black", # % population black or african american
               "pct_black_moe", # % population black or african american MOE
               "total_native", #total native population 
               "total_native_moe", #total native population MOE
               "pct_native", # % native population
               "pct_native_moe", # % native population MOE
               "total_asian", #total asian population 
               "total_asian_moe", #total asian population MOE
               "pct_asian", # % asian population
               "pct_asian_moe", # % asian population MOE
               "total_PI", # total PI = Native Hawiian/PAcific Islander 
               "total_PI_moe", # total PI = Native Hawiian/PAcific Islander MOE
               "pct_PI", # % PI 
               "pct_PI_moe", # % PI MOE
               "total_other", #total people of other race (nonhisp/latino)
               "total_other_moe", #total people of other race (nonhisp/latino) MOE
               "pct_other", # % people of other race (nonhisp/latino)
               "pct_other_moe", #% people of other race (nonhisp/latino) MOE
               "total_nonhl_2race", #non hispanic or latio with 2 races or more
               "total_nonhl_2race_moe", #non hispanic or latio with 2 races or more MOE
               "pct_nonhl_2race", # % non hispanic or latio with 2 races or more
               "pct_nonhl_2race_moe", # % non hispanic or latio with 2 races or more MOE
               "total_nonhl_2_other", #Total population; Not Hispanic or Latino; Two or more                                          races; Two races including Some other race
               "total_nonhl_2_other_moe", #MOE
               "pct_nonhl_2_other", # % population; Not Hispanic or Latino; Two or more                                          races; Two races including Some other race
               "pct_nonhl_2_other_moe", 
               "total_nonhl_2_3other", # Total population; Not Hispanic or Latino; Two or more                                          races; Two races excluding Some other race, and Three                                           or more races
               "total_nonhl_2_3other_moe", 
               "pct_nonhl_2_3other", # % population; Not Hispanic or Latino; Two or more                                               races; Two races excluding Some other race, and Three                                           or more races
               "pct_nonhl_2_3other_moe"
)
names(race_data) <- race_names
race_data <- race_data %>%
  select(-"Iteration") %>% # This variable is not relevant, as it is the same through each entry. We can keep in mind that it is 105.
  mutate(leaid = as.integer(leaid))

write_csv(race_data, "../data/race.csv")
