df <- get_education_data(
    level = 'school-districts', 
    source = 'edfacts', 
    topic = 'grad-rates'
)

library(tidyverse)

glimpse(df)
View(df)

df_2014_2018 <- df %>%
    filter(year %>% between(2014, 2018))

df_2014_2018 %>% 
    write_csv(file = "graduation_data.csv")

