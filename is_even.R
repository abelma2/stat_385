library(tidyverse)
library(nycflights13)
glimpse(airlines)
glimpse(airports)
glimpse(flights)
glimpse(planes)
glimpse(weather)
even_odd_delay 


is_even = function(x){
  x %% 2 == 0
}

as_tibble(flights) |>
  filter(origin == "LGA") |> 
  filter(dest == "ORD") |> 
  mutate(even = is_even(day)) |> 
  summarise(ave_dep_delay = mean(dep_delay, na.rm = TRUE),
            .by = even)
  