library(tidyverse)
library(tidyr)
library(dplyr)
install.packages("dplyr")
library(Lahman)
glimpse(Pitching)
glimpse(PitchingPost)
glimpse(People)
glimpse(Teams)
glimpse(TeamsFranchises)

low_hr_rate = as_tibble(Pitching) |> 
  filter(yearID >= 2010) |> 
  summarise(IP = round(sum(IPouts) / 3, digits = 3),
            HR = sum(HR),
            .by = c(playerID, yearID)) |> 
  filter(IP >= 162) |> 
  mutate(HR_rate = round((9 * HR) / IP, digits = 3)) |> 
  inner_join(People, by = "playerID") |> 
  select(yearID, playerID, nameLast, nameFirst, IP, HR, HR_rate) |>
  arrange(HR_rate, playerID)


?round
