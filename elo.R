elo_update = function(r_a, r_b, s_a, k = 32) {
  e_a = 1 / (1 + 10 ^ ((r_b - r_a) / 400))
  return(round(r_a + k * (s_a - e_a)))
}
