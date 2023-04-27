geom_series = function(x, n) {
  series = x ^ (0:n)
  c(sum = sum(series),
    true = 1 / (1 - x),
    last = series[length(series)]
  )
}

exp_series = function(x, n) {
  series = (x ^ (0:n)) / factorial(0:n)
  c(sum = sum(series),
    true = exp(x),
    last = series[length(series)]
  )
}

sin_series = function(x, terms) {
  n = seq(1, ((2 * terms)), 2)
  series = (-1) ^ (0:(terms - 1)) * (x ^ n) / factorial(n)
  return(series)
}
sin_series(3, 5)

cos_partial_sum = function(x, terms) {
  n = seq(0, ((2 * terms - 1)), 2)
  series = (-1) ^ (1:terms - 1) * (x ^ n) / factorial(n)
  return(sum(series))
}
cos_partial_sum(3, 5)
