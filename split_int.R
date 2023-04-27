#my
split_int = function(x) {
  as.integer(strsplit(as.character(x), "")[[1]])
}

is_valid = function(cc) {
  a = split_int(cc)
  check_digit = cc %% 10  ##store the last digit
  d = a[-(length(a))] ## Remove the last digit.
  if (length(d) %% 2 == 0) {
    d = d * c(1, 2)
    d
  } else {
    d = d * 1:2
    d[length(d)] = d[length(d)] * 2
    d
  }
  a = integer(length = length(d)) ## storage variable
  for (i in 1:length(d)) {
    ## Loop for sum of digits
    a[i] = ((d[i] %/% 10) + (d[i] %% 10))
  }
  s = sum(a)
  ifelse(10 - (s %% 10) == check_digit, TRUE, FALSE)
}

#prof
split_int = function(x) {
  x = as.character(x)
  as.integer(strsplit(x, split = "")[[1]])
}

is_valid = function(cc) {
  cc = split_int(cc)
  cd = cc[length(cc)]
  cc = cc[-(length(cc))]
  if (length(cc) %% 2 == 0) {
    idx = seq(from = 2,
              to = length(cc),
              by = 2)
    cc[idx] = cc[idx] * 2
  } else {
    idx = seq(from = 1,
              to = length(cc),
              by = 2)
    cc[idx] = cc[idx] * 2
  }
  cc = lapply(cc, split_int)
  cc = sapply(cc, sum)
  s = sum(cc)
  10 - (s %% 10)
}

