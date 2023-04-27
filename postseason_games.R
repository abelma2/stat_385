library(tidyverse)
library(Lahman)
glimpse(AllstarFull)
glimpse(BattingPost)
glimpse(People)
glimpse(Salaries)
glimpse(Teams)
glimpse(TeamsFranchises)
#Wrangle the data made availabe by the Lahman package to create a tibble named postseason_games with elements:
postseason_games
playerID
nameFirst
nameLast
n

# Each row of this data should contain measurements related to an MLB player. 
# The columns playerID, nameFirst, nameLast are the player's identifier, first name, and last name respectively. 
# The column n should measure the total number of postseason games that player has appeared in.
# Order the rows based on n from highest to lowest. 
# Break ties by playerID, alphabetically.

# What I wrote:

BattingPost |> 
  select(round, playerID, teamID) |> 
  left_join(People, join_by(playerID)) |> 
  select(round, playerID, teamID, nameGiven) |> 
  count(nameGiven)

# What AI wrote:

postseason_games = BattingPost |> 
  select(playerID, yearID, round, G) |> 
  left_join(People, by = "playerID") |> 
  select(playerID, nameFirst, nameLast, G) |> 
  group_by(playerID, nameFirst, nameLast) |> 
  summarise(n = sum(G)) |> 
  arrange(desc(n), playerID, nameFirst, nameLast)





