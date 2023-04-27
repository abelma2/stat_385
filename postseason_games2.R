library(tidyverse)
library(Lahman)
glimpse(AllstarFull)
glimpse(BattingPost)
glimpse(People)
glimpse(Salaries)
glimpse(Teams)
glimpse(TeamsFranchises)

postseason_games
  
playerID
nameFirst
nameLast
n

postseason_games = BattingPost |> 
  left_join(People, by = "playerID", multiple = "all") |> 
  group_by(playerID, nameFirst, nameLast) |> 
  summarise(n = sum(G, na.rm = TRUE)) |> 
  filter(n > 0) |> 
  arrange(desc(n))
