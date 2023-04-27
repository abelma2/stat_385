## my
calc_olympic_score = function(judges_scores) {
  sorted = sort(judges_scores)
  sorted = sorted[-(which.max(sorted))]
  sorted = sorted[-(which.min(sorted))]
  return(mean(sorted))
}

## prof
calc_olympic_score = function(judges_scores) {
  sorted = sort(judges_scores)
  remove = c(1, length(judges_scores))
  mean(sorted[-remove])
}





calc_olympic_score(c(8.7, 9.9, 5.6, 8.4, 7.3, 5.6))
