library(tidyverse, warn.conflicts = F)
library(readxl, warn.conflicts = F)
library(tidycensus, warn.conflicts = F)


to_moe <- function(moe) {
    moe_single <- function(x) {
        str_extract_all(x, "\\d+") %>%
            unlist() %>%        # List to Vector
            as.numeric() %>%    # Convert to numbers
            diff() %>%          # Take the difference
            `/`(2) %>%          # Single-sided MoE
            `/`(100) %>%        # Convert to proportion
            return()            # Return Margin of Error
    }
    lapply(moe, FUN = moe_single) %>%
        unlist() %>%
        return()
}   

district_data <- read_xlsx("../data/NHGIS_District_data.xlsx")
source("names_list.R")
names(district_data) <- names_list

data("fips_codes")
fips_data <- fips_codes %>%
    select(state_fips = state_code, state = state_name) %>%
    distinct() %>%
    right_join(district_data, 
               by = c("state" = "state")) %>%
    unite("leaid", state_fips, school_ID, sep = "") %>% 
    mutate(
        across(
            ends_with("MOE"), 
            to_moe
        )
    ) 

state_region<- data.frame(state.name, state.region) %>%
  rename(
    state = state.name, 
    region = state.region
  )

district_regions <- merge(x=fips_data, y=state_region, by="state", all.x=TRUE)
noNY <- filter(district_regions, children <= 1000000)
  

View(noNY)

noNY %>% write_csv("../data/hh.csv")



