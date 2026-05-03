library(gtools)   # already loaded

# Parameters from the case study style
n_loans <- 1000
p_default_indep <- 0.02                     # independent default probability

# Monte Carlo for independent defaults
set.seed(1)
B <- 10000
losses <- replicate(B, {
  defaults <- rbinom(n_loans, size = 1, prob = p_default_indep)
  sum(defaults)                             # number of defaults
})

mean(losses)                                # expected number of defaults
mean(losses > 50)                           # probability of losing >50 loans (big loss)

# With correlation (more realistic)
rho <- 0.3                                  # correlation between loans
p_default_cor <- 0.04
# Simple correlated simulation (course approximation)
loss_cor <- replicate(B, {
  Z <- rnorm(1)                             # common shock
  probs <- pnorm((qnorm(p_default_cor) - sqrt(rho)*Z) / sqrt(1-rho))
  defaults <- rbinom(n_loans, size = 1, prob = probs)
  sum(defaults)
})

mean(loss_cor)
mean(loss_cor > 50)                         # much higher risk due to correlation

# Visuals
hist(losses, main = "Losses - Independent Defaults", breaks = 30)
abline(v = 50, col = "red")

#Mini-challenges
#1. Change rho to 0 and 0.5 — how does P(big loss) change?
#2. Add profit calculation: assume $100 profit per good loan, $1000 loss per default. Compute expected profit.
#3. Use qnorm() to find the loss threshold that occurs only 1% of the time under independence.