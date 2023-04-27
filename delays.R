library(tidyverse)
library(nycflights13)
glimpse(airlines)
glimpse(airports)
glimpse(flights)
glimpse(planes)
glimpse(weather)

delays = as_tibble(flights) |> 
  filter(dest == "LAX") |> 
  summarise(arrival = mean(arr_delay, na.rm = TRUE),
            departure = mean(dep_delay, na.rm = TRUE),
            .by = dest) |> 
  select(arrival, departure) |> 
  pivot_longer(
    cols = (arrival:departure)
  ) |> 
  rename(delay_type  = name, ave_delay = value)