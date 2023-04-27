library("tidyverse")
library("ggplot2")
install.packages("remotes")
library("ggdensity")
library("ggridges")
library("Lahman")
library("DT")
library("readr")

Lahman::Batting
Batting = as.tibble(Batting)
People = as.tibble(People)
HallOfFame = as.tibble(HallOfFame)

Batting |> 
  arrange(desc(yearID)) |> 
  filter(playerID == "abreujo02") |> 
  summarize(HR = sum(HR), .by = playerID)

Batting |> 
  arrange(desc(yearID)) |> 
  summarize(HR = sum(HR), .by = playerID) |> 
  arrange(desc(HR)) |> 
  left_join(People, by = "playerID") |> 
  select(playerID, nameFirst, nameLast, HR) |> 
  unite(Name, nameFirst:nameLast, sep = " ") |> 
  left_join(
    summarise(HallOfFame, inHall = any(inducted == "Y"), .by = playerID),
    by = "playerID"
  ) |> 
  print(n = 30)
  
Teams = as_tibble(Teams)

Teams |> 
  filter(yearID >= 1990) |> 
  select(yearID, teamID, W, L, R, RA, G) |> 
  mutate(pythWperc = (R ^ 2) / (R ^ 2 + RA ^ 2)) |> 
  mutate(pythW = round(G * pythWperc)) |> 
  mutate(seasonType = case_when(
    yearID == 2020 ~ "COVID, 2020",
    yearID == 1994 ~ "Strike, 1994",
    .default = "Normal"
  )) |> 
  ggplot() +
  aes(x = W, y = pythW, color = seasonType) +
  geom_point() +
  theme_bw() +
  geom_smooth(method = "lm", formula = "y ~ x") +
  theme_bw()

  




HallOfFame |> 
  summarise(inHall = any(inducted == "Y"), .by = playerID) |> 
  summarise(n = n(), .by = inHall)

?n()
?by()
HallOfFame |> 
  filter(playerID == "bondsba01") |> 
  mutate(perc = votes / ballots)
  

People |> 
  select(playerID, nameFirst:nameGiven)












remotes::install_github("daviddalpiaz/bbd")
Batting |>
  select(playerID, yearID, teamID, HR) |>
  summarise(HR = sum(HR), .by = playerID) |>
  filter(HR >= 100) |>
  arrange(desc(HR)) |>
  left_join(People, by = "playerID") |>
  select(playerID, nameFirst, nameLast, HR) |>
  unite(Name, nameFirst:nameLast, sep = " ") |>
  left_join(
    summarise(HallOfFame, inHall = "Y" %in% inducted, .by = playerID),
    by = "playerID"
  ) |> 
  datatable()
