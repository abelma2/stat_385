## MY
even_odd_rows = function(x, odd = TRUE) {
  rows = nrow(x)
  even_rows = seq_len(rows) %% 2
  if (odd == FALSE) {
    return(data_mod = x[even_rows == 0,])
  } else {
    return(data_mad = x[even_rows == 1,])
  }
}

## PROFS
even_odd_rows = function(x, odd = TRUE) {
  if (odd) {
    return(x[c(TRUE, FALSE),])
  }
  return(x[c(FALSE, TRUE),])
}

ex_df = data.frame(
  x = 1:10,
  y = 10:1
)

even_odd_rows(x = ex_df)
