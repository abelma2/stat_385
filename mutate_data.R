library(nycflights13)
library(tidyverse)

flights

# filter (rows)

View(filter(flights, month == 2, day == 14)) #flights[flights$month == 2 & flights$day == 14, ]
filter(flights, dep_delay < 0, month == 10, carrier == "AA")


# select (columns)

select(flights, year, month, day)
select(flights, -year, -month, -day)
select(flights, time_hour, everything())
select(flights, year:dep_delay)
select(flights, asdf = year, everything())
rename(flights, asdf = year)


# arrange (rows)

arrange(flights, dep_delay)
arrange(flights, desc(dep_delay))



# mutate (columns)

arrange(select(
  mutate(flights, dep_delay_hours = dep_delay / 60),
  dep_delay_hours,
  everything()
),
desc(dep_delay_hours))


log(mean(1:10))

1:10 |>
  mean() |>
  log()

# pipe |>
flights |>
  mutate(flights, dep_delay_hours = dep_delay / 60) |>
  select(dep_delay_hours, everything()) |>
  arrange(desc(dep_delay_hours))


# group-by, summarize (summarize, )

flights |> 
  group_by(origin, carrier) |>
  summarise(
    dep_delay_mean   = mean(dep_delay, na.rm = TRUE),
    dep_delay_sd     = sd(dep_delay, na.rm = TRUE),
    dep_delay_median = median(dep_delay, na.rm = TRUE),
    n                = n()) |> 
  View()

flights |> 
  sample_n(size = 100)

flights |> 
  slice_head(n = 10)
