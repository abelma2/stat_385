library(tidyverse)
library(Lahman)
glimpse(AllstarFull)
glimpse(BattingPost)
glimpse(People)
glimpse(Salaries)
glimpse(Teams)
glimpse(TeamsFranchises)

allstar_appearances = AllstarFull |> 
  left_join(People, by = "playerID") |> 
  group_by(playerID, nameFirst, nameLast) |> 
  summarise(appearances = n()) |> 
  arrange(desc(appearances))

allstar_appearances = AllstarFull |> 
  left_join(People, by = "playerID") |> 
  select(playerID, nameFirst, nameLast, GP) |> 
  group_by(playerID, nameFirst, nameLast) |> 
  summarise(appearances = n(), .groups = "drop") |> 
  arrange(desc(appearances), playerID, nameFirst, nameLast) |> 
  View()
