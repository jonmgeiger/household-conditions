library(tidyverse, warn.conflicts = F)

prune_and_predom <- function(race_data) {
    race_pruned <- race_data %>%
        select(
            -geo_id, -dist, -year,
            -contains("total"), -contains("moe"),
            -contains("mexican"), 
            -contains("puertrican"), 
            -contains("cuban"), 
            -contains("hl"), 
            -contains("other")
        ) %>%
        mutate(leaid = as.integer(leaid))
    
    race_pruned %>%
        select(-leaid) %>%
        mutate(
            predom_race = names(.)[max.col(.)],
            predom_race = predom_race %>% 
                str_replace_all("pct_", ""), 
            predom_race = predom_race %>% 
                factor(levels = c("hisp_latino", "white", 
                                  "black", "native", "asian"), 
                       labels = c("Hispanic/Latino", "White", 
                                  "Black", "Native American", "Asian")
                )
        ) %>%
        select(predom_race) %>% 
        bind_cols(race_pruned) %>%
        return()
}


#' Usage: 
#' 
#' race_data <- read_csv("../data/race.csv") %>%
#'     prune_and_predom()