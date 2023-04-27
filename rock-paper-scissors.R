rock_paper_scissors = function(shapes = c("rock", "paper", "scissors"),
                               n_players = 2) {
  sample(shapes, n_players, replace = TRUE)
}



