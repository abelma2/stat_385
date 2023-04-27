library(tidyverse)
library(nycflights13)
glimpse(airlines)
glimpse(airports)
glimpse(flights)
glimpse(planes)
glimpse(weather)

daily_dest = as_tibble(flights) |> 
  filter(month == 3, day == 20, origin == "JFK") |> 
  summarise(flights = n(),
            .by = dest) |> 
  rename(destination = dest) |> 
  arrange(desc(flights),destination)