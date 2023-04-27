library(tidyverse)
who

who_longer = who %>%
  pivot_longer(
    cols = !(country:year),
    values_to = "cases",
    values_drop_na = TRUE
  ) |>
  group_by(country, year) %>%
  summarize(cases = sum(cases))




