library(tidyverse)
library(Lahman)
glimpse(AllstarFull)
glimpse(BattingPost)
glimpse(People)
glimpse(Salaries)
glimpse(Teams)
glimpse(TeamsFranchises)

career_salaries = Salaries |> 
  left_join(Teams, by = c("teamID","yearID")) |> 
  group_by(yearID, teamID, name) |> 
  summarise(payroll = sum(salary, na.rm = TRUE)) |> 
  arrange(desc(payroll))





, relationship = "many-to-many")
  group_by(yearID, teamID, name) |> 
  summarise(payroll = sum(Salaries), na.rm = TRUE)
            