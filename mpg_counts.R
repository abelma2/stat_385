library(tidyverse)
mpg

mpg_counts = as_tibble(mpg) |> 
  summarise(n = n(),
            .by = c(manufacturer, model)) |> 
  arrange(manufacturer)