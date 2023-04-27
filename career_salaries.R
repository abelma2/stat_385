library(tidyverse)
library(Lahman)
glimpse(AllstarFull)
glimpse(BattingPost)
glimpse(People)
glimpse(Salaries)
glimpse(Teams)
glimpse(TeamsFranchises)

playerID
nameFirst
nameLast
earnings

career_salaries = Salaries |>
  left_join(People, by = "playerID") |>
  select(playerID, nameFirst, nameLast, salary) |> 
  group_by(playerID, nameFirst, nameLast) |>
  summarise(earnings = sum(salary)) |> 
  arrange(desc(earnings))
  





