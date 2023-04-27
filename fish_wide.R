library(tidyverse)
glimpse(fish_encounters)

fish_wide 
#with elements:
fish
Release
I80_1
Lisbon
Rstr
Base_TD
BCE
BCW
BCE2
BCW2
MAE
MAW

fish_wide = fish_encounters |> 
  pivot_wider(
  names_from = station,
  values_from = seen,
  values_fill = 0
)