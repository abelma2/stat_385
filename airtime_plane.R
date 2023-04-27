library(tidyverse)
library(nycflights13)
glimpse(airlines)
glimpse(airports)
glimpse(flights)
glimpse(planes)
glimpse(weather)

airtime_plane 

N725MQ # tail number

airtime_plane = as_tibble(flights) |>
  filter(tailnum == "N725MQ") |>
  summarise(
    n = n(),
    ave_air_time = mean(air_time, na.rm = TRUE),
    .by = dest
  ) |>
  filter(n >= 10) |>
  left_join(airports, join_by(dest == faa)) |>
  select(dest, ave_air_time) |> 
  arrange(dest)