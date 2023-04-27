kelly_bet = function(bankroll, p, wager, payout) {
  (p - ((1 - p)) / (payout / wager)) * bankroll
}
