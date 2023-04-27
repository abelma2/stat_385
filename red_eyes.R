library(tidyverse)
library(nycflights13)
glimpse(airlines)
glimpse(airports)
glimpse(flights)
glimpse(planes)
glimpse(weather)

red_eyes = as_tibble(flights) |> 
  filter(origin == "LGA") |> 
  filter(2200 <= dep_time, dep_time <= 2400) |> 
  filter(0 <= arr_time, arr_time <= 300) |> 
  summarise(red_eyes = n(),
            .by = dest) |> 
  left_join(airports, join_by(dest == faa)) |> 
  select(dest, name, red_eyes) |> 
  arrange(desc(red_eyes), dest)
  