ex_list = list(
  a = 1:3,
  b = list(x = 1:3),
  c = 42,
  d = list(y = 2:4)
)
only_lists(x = ex_list)

## my
only_lists  = function(x) {
  a = x[sapply(x, is.list)]
  return(a)
}
 ## profs
only_lists  = function(x) {
  x[sapply(x, is.list)]
}
