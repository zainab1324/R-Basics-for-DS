# Basic sampling
beads <- rep(c("red", "blue"), times = c(6, 4))   # 10 beads: 6 red, 4 blue
sample(beads, size = 1)                           # draw 1 bead with replacement
sample(beads, size = 5, replace = TRUE)           # draw 5 with replacement

# Monte Carlo simulation with replicate()
B <- 10000
results <- replicate(B, {
  draw <- sample(beads, 1)
  draw == "red"
})
mean(results)                                     # estimated probability of red
sum(results) / B                                  # same thing using sum() on logical vector

# Combinations and permutations
combinations(5, 3)                                # C(5,3)
permutations(5, 3)                                # P(5,3)

# Binomial distribution
dbinom(x = 3, size = 5, prob = 0.5)               # probability mass at exactly 3 successes
pbinom(q = 3, size = 5, prob = 0.5)               # cumulative P(X <= 3)

set.seed(1)                                       # make simulation reproducible

#Mini-challenges
#1. Change the bead colors to 7 green / 3 orange and re-run the Monte Carlo. What is the estimated P(green)?
#2.  Use combinations() to count ways to choose 2 red cards from a 52-card deck.
#3. Compare mean(results) vs sum(results)/B — when are they identical?