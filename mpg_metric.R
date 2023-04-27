install.packages("tidyverse")
library(tidyverse)
mpg_metric  = mpg |>
  mutate(cty = cty / 0.425,
         hwy = hwy / 0.425) |>
  select(-cty, -hwy)