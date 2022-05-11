library(tidyverse)
library(tidylog)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))


race_household <- read_csv("../data/race_household.csv")


race_household %>%
    select(
        -contains("total"), -contains("moe")
    ) %>%
    select(
        -contains("mexican"), 
        -contains("puertrican"), 
        -contains("cuban"), 
        -contains("hl"), 
        -contains("other")
    ) %>%
    rename("pct_PI" = pct_PT) %>%
    write_csv("../data/raceP_household.csv")
