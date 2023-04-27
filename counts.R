count_and_prop_greater = function(x, c) {
  comp = x > c
  c(count = sum(comp), prop = mean(comp))
}

count_and_prop_less = function(x, c) {
  comp = x < c
  c(count = sum(comp), prop = mean(comp))
}

count_and_prop_equal = function(x, c) {
  comp = x == c
  c(count = sum(comp), prop = mean(comp))
}
 count_and_prop_greater(x = 1:10, c =7)
 count_and_prop_less(x = 1:10, c =7)
 count_and_prop_equal(x = 1:10, c =7)
