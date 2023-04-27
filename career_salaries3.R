library(tidyverse)
library(Lahman)
glimpse(AllstarFull)
glimpse(BattingPost)
glimpse(People)
glimpse(Salaries)
glimpse(Teams)
glimpse(TeamsFranchises)

glimpse(People)
glimpse(Salaries)

career_salaries = People |> 
  left_join(Salaries, by = "playerID", multiple = "all") |> 
  group_by(playerID, nameFirst, nameLast) |> 
  summarise(earnings = sum(salary), .groups = "drop") |> 
  filter(earnings > 0) |> 
  arrange(desc(earnings))