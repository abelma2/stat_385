library(tidyverse)
who

who_longer 
#with elements:
country
year
cases
distinct(who)

who_longer = who %>%
  pivot_longer(
    cols = !(country:year),
    names_to = c("JUNK"),
    values_to = "cases",
    values_drop_na = TRUE
  ) |>
  group_by(country, year) %>%
  summarize(cases = sum(cases))
