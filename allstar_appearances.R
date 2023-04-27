library(tidyverse)
library(Lahman)
glimpse(AllstarFull)
glimpse(BattingPost)
glimpse(People)
glimpse(Salaries)
glimpse(Teams)
glimpse(TeamsFranchises)

allstar_appearances 
#with elements:
  
playerID
nameFirst
nameLast
appearances

allstar_appearances = AllstarFull |> 
  left_join(People, by = "playerID") |> 
  select(playerID, nameFirst, nameLast, GP) |> 
  group_by(playerID, nameFirst, nameLast) |> 
  summarise(appearances = n(), .groups = "drop") |> 
  arrange(desc(appearances), playerID, nameFirst, nameLast)

allstar_appearances1 <- AllstarFull %>%
  group_by(playerID) %>%
  summarize(appearances = n()) %>%
  filter(appearances > 0) %>%
  left_join(People %>% select(playerID, nameFirst, nameLast), by = "playerID") %>%
  select(playerID, nameFirst, nameLast, appearances) %>%
  arrange(desc(appearances), playerID)

  
