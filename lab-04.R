fizz_buzz = function(x) {
  div_3 = (x %% 3) == 0
  div_5 = (x %% 5) == 0
  div_b = div_3 & div_5

  x[div_5] = "fizz"
  x[div_3] = "buzz"
  x[div_b] = "fizzbuzz"
  return(x)
}
