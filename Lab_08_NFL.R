library(tidyverse)

nfl = nflreadr::load_schedules(seasons = 1999:2021)
View(nfl)

impossible = tibble(los_score = c(0, 1, 1, 1, 1, 1, 1),
                    win_score = c(1, 1, 2, 3, 4, 5, 7))
for (i in 0:100) {
  temp = tibble(win_score = i,
                los_score = (i + 1):100)
  impossible = bind_rows(impossible, temp)
}

nfl |>
  filter(!is.na(home_score)) |>
  mutate(win_score = ifelse(home_score >= away_score, home_score, away_score)) |>
  mutate(los_score = ifelse(home_score < away_score, home_score, away_score)) |>
  select(win_score, los_score, home_score, away_score) |>
  group_by(win_score, los_score) |>
  summarise(n = n(), .groups = "drop") |>
  ggplot(mapping = aes(x = win_score, y = los_score)) +
  geom_tile(color = "darkgreen", fill = "chartreuse4") +
  geom_text(mapping = aes(label = n),
            color = "white",
            size = 1.5) +
  coord_fixed(
    ylim = c(51.5, -0.5),
    xlim = c(-0.5, 62.5),
    expand = FALSE
  ) +
  scale_x_continuous(breaks = 0:100,
                     minor_breaks = NULL,
                     sec.axis = dup_axis()) +
  scale_y_continuous(breaks = 0:100,
                     minor_breaks = NULL,
                     sec.axis = dup_axis()) +
  theme_classic(base_line_size = 0) +
  theme(axis.text = element_text(size = 4),
        plot.caption = element_text(size = 6, color = "grey"),
        axis.title = element_text(size = 8)) +
  labs(
    x = "Winning (or trying) score",
    y = "Losing score",
    title = "NFL Scorigami",
    subtitle = "1999 - 2021",
    caption = "Inspired by Jon Bois' Chart Party"
  ) +
  geom_tile(data = impossible)


ggplot(data = nfl) +
  geom_tile(mapping = aes(x = away_score, y = home_score))
