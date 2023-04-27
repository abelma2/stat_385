#my
#my
selection_sort = function(x) {
  y = double(length = length(x))
  for (i in 1:length(y)) {
    y[i] = x[which.min(x)]
    x = x[-which.min(x)]
  }
  return(y)
}

# prof
selection_sort = function(x) {
  y = numeric(length = length(x))
  for (i in seq_along(y)) {
    idx = which.min(x)
    y[[i]] = x[[idx]]
    x = x[-idx]
  }
  y
}

selection_sort(x = c(2, 2, 1, 1, 4, 6, 8, 2, 10))
selection_sort(x = 10:1)
