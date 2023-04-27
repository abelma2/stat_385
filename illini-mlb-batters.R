library(tidyverse)
library(Lahman)
LahmanData

Schools = as_tibble(Schools)
CollegePlaying = as_tibble(CollegePlaying)
Batting = as_tibble(Batting)
People = as_tibble(People)

illini = CollegePlaying |> 
  filter(schoolID == "illinois") |> 
  pull(playerID) |> 
  unique()

illini_mlb_batters = Batting |> 
  filter(playerID %in% illini) |> 
  select(-c(stint, teamID, lgID)) |> 
  mutate(across(G:GIDP, replace_na, replace = 0)) |>
  group_by(playerID) |> 
  summarise(across(G:GIDP, sum)) |> 
  mutate(PA = AB + BB + HBP + SH + SF) |> 
  mutate(TB = H + X2B + 2 * X3B + 3 * HR) |> 
  filter(AB > 0) |> 
  filter(PA > 0) |> 
  mutate(BA = H / AB) |> 
  mutate(OBP = (H + BB + HBP) / (PA - SH)) |> 
  mutate(SLG = TB / AB) |> 
  mutate(OPS = OBP + SLG) |> 
  mutate(across(BA:OPS, round, digits = 3)) |> 
  left_join(People, by = "playerID") |> 
  select(playerID, nameFirst, nameLast, birthYear, everything()) |> 
  select(-c(birthMonth:birthDate)) |> 
  arrange(desc(OPS))
  

