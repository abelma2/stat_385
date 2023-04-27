library(tidyverse)
library(Lahman)
glimpse(AllstarFull)
glimpse(Batting)
glimpse(People)
glimpse(Salaries)
glimpse(Teams)
glimpse(TeamsFranchises)

season_ba = as_tibble(Batting) |>
  filter(yearID >= 1947) |>
  summarise(
    H = sum(H),
    AB = sum(AB),
    BA = round(H / AB, 3),
    .by = c(playerID, yearID)
  ) |>
  filter(AB >= 300) |>
  inner_join(People, by = "playerID") |>
  select(playerID,
         nameFirst,
         nameLast,
         yearID,
         H,
         AB,
         BA) |> 
  arrange(desc(BA), yearID, nameLast)