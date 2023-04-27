library(tidyverse)
install.packages("bbd")

# data to (input / out)

## with packages

nfl_schedule = nflreadr::load_schedules()
as_tibble(nfl_schedule)

## from a database

## from a local or remote file, often as csv (comma seperated values)

gpa |> 
  filter(Subject == "STAT") |> 
  filter(Number == 410) |> 
  View()


 # using a relative reference
list.files("data", full.names = TRUE)

## using an absolute reference
#gpa = read.csv("")

## working directory information
getwd()
setwd()

## output

gpa_stat = gpa |> 
  filter(Subject == "STAT")

write_csv(gpa_stat, file = "data/stat-gpa-uiuc.csv")



# tidy data ---------------------------------------------------------------

table1
table2
table3
table4a
table4b
table5

pivot_longer()
pivot_wider()
unite()
separate()


# table2 ------------------------------------------------------------------

table2 |> 
  pivot_wider(names_from = type, values_from = count) |> 
  identical(table1)

# table3 ------------------------------------------------------------------

table3 |> 
  separate(col = rate, into = c("cases", "population")) |>
  mutate(case = as.integer(cases), population = as.integer(population))

table3 |> 
  separate(col = rate, into = c("cases", "population"), sep = "/", convert = TRUE)


# table 5 -----------------------------------------------------------------

table5 |> 
  separate(col = rate, into = c("cases", "population"), sep = "/", convert = TRUE) |> 
  unite(col = year, century, year, sep = "")
table5
# table4 ------------------------------------------------------------------

table4a_tidy = table4a |> 
  pivot_longer(cols = c(`1999`, `2000`), names_to = "year", values_to = "cases")



table4b_tidy = table4b |> 
  pivot_longer(cols = c(`1999`, `2000`), names_to = "year", values_to = "population")

table4a_tidy |> 
  left_join(table4b_tidy, by = c("country", "year"))


# nycflights13 ------------------------------------------------------------

library(nycflights13)

flights |> 
  filter(month == 3, day == 30) |> 
  select(sched_dep_time, carrier, flight, tailnum, origin, dest) |> 
  left_join(airlines, by = "carrier") |> 
  select(sched_dep_time, carrier, name, everything()) |> 
  rename(carrier_name = name) |> 
  left_join(airports, by = c("dest" = "faa")) |> 
  select(-(lat:tzone)) |> 
  rename(dest_name = name)


# gpa ---------------------------------------------------------------------

gpa |> 
  pivot_longer(cols = A.:W, names_to = "letters", values_to = "count")





