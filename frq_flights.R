library(tidyverse)
library(nycflights13)

glimpse(airlines)
glimpse(airports)
glimpse(flights)
glimpse(planes)
glimpse(weather)

frq_flights = as_tibble(flights) |> 
  summarise(n = n(), 
            .by = c("origin", "dest")) |> 
  filter(n >= 2500) |> 
  left_join(airports, join_by("origin" == "faa")) |> 
  left_join(airports, join_by("dest" == "faa")) |> 
  rename(origin_name = name.x, dest_name = name.y) |> 
  select(origin, origin_name, dest, dest_name, n) |> 
  arrange(desc(n))
  
