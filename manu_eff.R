library(tidyverse)
mpg
manu_eff = as_tibble(mpg) |> 
  summarise(ave_cty = mean(cty),
            ave_hwy = mean(hwy),
            .by = manufacturer) |> 
  arrange(manufacturer)