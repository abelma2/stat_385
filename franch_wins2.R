library(tidyverse)
library(Lahman)
glimpse(AllstarFull)
glimpse(BattingPost)
glimpse(People)
glimpse(Salaries)

glimpse(Teams)
glimpse(TeamsFranchises)

franchID
franchName
start
end
n
w
l
w_perc

franch_wins = Teams |> 
  left_join(TeamsFranchises, by = "franchID") |>
  select(franchID, franchName, yearID, G,  W, L) |> 
  group_by(franchID, franchName) |> 
  summarise(
    start = min(yearID),
    end = max(yearID),
    n = sum(G), 
    w = sum(W),
    l = sum(L),
    w_perc = w / n
  ) |> 
  filter(n >= 1000) |> 
  arrange(desc(w_perc))
  
