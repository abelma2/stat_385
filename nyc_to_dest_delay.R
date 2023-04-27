library(tidyverse)
library(nycflights13)

glimpse(airlines)
glimpse(airports)
glimpse(flights)
glimpse(planes)
glimpse(weather)

nyc_to_dest_delay 

faa_code
port_name
med_delay

nyc_to_dest_delay = flights |> 
  group_by(dest) |> 
  summarise(med_delay = median(arr_delay + dep_delay, na.rm = TRUE)) |> 
  left_join(airports, by = c("dest" = "faa")) |> 
  select(faa_code = dest, port_name = name, med_delay) |> 
  arrange(desc(med_delay))





