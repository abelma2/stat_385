library(tidyverse)

mpg_ave_eff = as_tibble(mpg) |> 
  filter(manufacturer == "volkswagen" & year == 1999) |> 
  summarise(cty = mean(cty),
            hwy = mean(hwy)) |> 
  pivot_longer(
    cols = (cty:hwy)
  ) |> 
  rename(type = name, ave_eff = value)