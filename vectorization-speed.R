lrr = function(x) {
  log(sqrt(1 / x))
}

lrr_bad_loop = function(x) {
  y = c()
  for (i in seq_along(x)) {
    y = c(y, log(sqrt(1 / x[[i]])))
  }
  return(y)
}

lrr_good_loop = function(x) {
  y = vector(mode = typeof(x), length = length(x))
  for (i in seq_along(x)) {
    y[[i]] = log(sqrt(1 / x[[i]]))
  }
  return(y)
}

lrr_apply = function(x) {
  vapply(x, lrr, double(1))
}

lrr_bad_vect = Vectorize(\(x) {
  log(sqrt(1 / x))
})
