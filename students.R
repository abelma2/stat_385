# load tidyverse
library(tidyverse) 

# function to generate random netIDs
make_id = function() {
  alpha = sample(letters, size = 7)
  num = sample(1:9, size = 1)
  paste(c(alpha, num), collapse = "")
}

# create netIDs
set.seed(42)
netID = replicate(n = 400, make_id())

# create vectors of years and majors
years = c("fresh", "soph", "junior", "senior")
majors = c("stat", "econ", "cs", "math", "phys")

# create student data
set.seed(42)
students = tibble(
  netID = netID,
  year = sample(years, size = length(netID), replace = TRUE),
  major = sample(majors, size = length(netID), replace = TRUE),
  transfer = sample(c(FALSE, TRUE), size = length(netID), replace = TRUE, prob = c(0.9, 0.1)),
  instate = sample(c(FALSE, TRUE), size = length(netID), replace = TRUE, prob = c(0.6, 0.4)),
  act = sample(22:36, size = length(netID), replace = TRUE)
)

# create stat385 grade data
set.seed(385)
stat385 = tibble(
  netID = sample(netID, size = 300, replace = FALSE),
  quiz = round(100 * runif(n = 300, min = 0.50), 1),
  exam = round(100 * runif(n = 300, min = 0.50), 1),
  proj = round(100 * runif(n = 300, min = 0.50), 1)
)

# create stat385 grade data
set.seed(432)
stat455 = tibble(
  netID = sample(netID, size = 150, replace = FALSE),
  hw = round(100 * runif(n = 150, min = 0.50), 1),
  lab = round(100 * runif(n = 150, min = 0.50), 1),
  exam = round(100 * runif(n = 150, min = 0.50), 1),
  proj = round(100 * runif(n = 150, min = 0.50), 1),
  attend = sample(30:48, size = 150, replace = TRUE)
)

glimpse(students)
glimpse(stat385)
glimpse(stat455)

uni_grades  = as_tibble(students) |>
  full_join(stat455, by = "netID") |>
  rename(hw1 = hw, lab1 = lab, exam1 = exam, proj1 = proj, attend1 = attend) |> 
  full_join(stat385, by = "netID") |>
  summarise(stat385 = (0.5 * quiz + 0.4 * exam + 0.1 * proj),
            stat455 = (0.1 * hw1 + 0.4 * lab1 + 0.2 * exam1 + 0.1 * proj1 + (0.2 * 100 * (attend1 / 48))),
            .by = "netID") |> 
  na.omit()
  
# delete this comment and place your code here