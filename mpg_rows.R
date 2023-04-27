library(tidyverse)
mpg


mpg_rows = as_tibble(mpg) |>
  filter(hwy > 18 & hwy < 39)
  




