library(tidyverse)
library(nycflights13)

glimpse(airlines)
glimpse(airports)
glimpse(flights)
glimpse(planes)
glimpse(weather)






lga_ord = as_tibble(flights) |> 
  filter(origin == "LGA" & dest == "ORD") |> 
  summarise(n = n(), 
            .by = carrier) |> 
  left_join(airlines, by = "carrier") |> 
  select(carrier, name, n) |> 
  arrange(desc(n))
