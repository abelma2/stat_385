library("tidyverse")
library("ggdensity")
library("ggridges")
library("Lahman")
library("DT")
library("bbd")

remotes::install_github("daviddalpiaz/bbd")
bbd::people_search("Dylan Cease")
#sc2022 = bbd::statcast_bbd(start = "2022-01-01", end = "2022-12-13", verbose = TRUE)
#cease2022 = filter(sc2022, pitcher == 656302)
#saveRDS(cease2022, file = "data/cease2022.rds")

cease2022 = readRDS("data/cease20222.rds")
getwd()

geom_strikezone = function(color = "black", linewidth = 0.25, sz_top = 3.8, sz_bot = 1.1) {
  sz_left = -0.85
  sz_right = 0.85
  strikezone = data.frame(
    x = c(sz_left, sz_left, sz_right, sz_right, sz_left),
    y = c(sz_bot, sz_top, sz_top, sz_bot, sz_bot)
  )
  geom_path(aes(.data$x, .data$y), data = strikezone, linewidth = linewidth, col = color)
}

cease2022 |> 
  filter(!is.na(pitch_type)) |> 
  ggplot() +
  aes(x = release_speed, y = release_spin_rate, color = pitch_type) +
  geom_point() +
  scale_color_brewer(palette = "Set1") +
  theme_bw()
  
  
  
  summarise(n = n(), .by = c(pitch_type, pitch_name))

