# 2021 NFL Schedule
nfl_schedule = as.data.frame(nflreadr::load_schedules(seasons = 2021))
vars = c("game_type", "week", "away_team", "away_score", "home_team",
         "home_score", "location", "overtime", "stadium")
sort(unique(nfl_schedule$away_team))
nfl_schedule[nfl_schedule$away_team == "LA" | nfl_schedule$home_team == "LA",vars]

# 2021 NFL Roster
nfl_rosters = as.data.frame(nflreadr::load_rosters())
roster_vars = c("status", "team", "position", "full_name", "height", "weight", "college", "years_exp")
sort(unique(nfl_rosters$college))
illinois = nfl_rosters$college == "Illinois" & !is.na(nfl_rosters$college)
(nfl_rosters[illinois, roster_vars])

# 2021 NFL player statistics
nfl_pstats = as.data.frame(nflreadr::load_player_stats(seasons = 2000))
View(nfl_pstats)
version
