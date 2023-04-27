library(tidyverse)
library(nycflights13)

glimpse(airlines)
glimpse(airports)
glimpse(flights)
glimpse(planes)
glimpse(weather)


la_aircraft 

manufacturer
n

la_aircraft = flights |> 
  left_join(planes, by = "tailnum") |> 
  filter(dest %in% c("LAX", "SNA", "BUR", "ONT", "LGB", "SBD")) |> 
  group_by(manufacturer) |> 
  summarise(n = n()) |> 
  arrange(desc(n))
  
  
glimpse(a)
 