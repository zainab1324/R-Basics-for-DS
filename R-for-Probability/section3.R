# Sampling models
set.seed(1)
p <- 0.45                                     # true proportion (e.g., support for a candidate)
N <- 1000                                     # sample size
X <- rbinom(N, size = 1, prob = p)            # one sample of 1000 Bernoulli trials

# Expected value and standard error
mean(X)                                       # sample proportion
sqrt(p * (1-p) / N)                           # theoretical standard error (uses sqrt())

# Monte Carlo for distribution of sample means
B <- 10000
sample_avgs <- replicate(B, {
  X <- rbinom(N, size = 1, prob = p)
  mean(X)
})
mean(sample_avgs)                             # should ≈ p
sd(sample_avgs)                               # should ≈ theoretical SE

# CLT visualization
hist(sample_avgs, breaks = 30, prob = TRUE, 
     main = "CLT: Distribution of Sample Means")
x <- seq(0.35, 0.55, length.out = 100)
lines(x, dnorm(x, mean = p, sd = sqrt(p*(1-p)/N)), col = "red", lwd = 2)

cumsum(X)[1:10]                               # running totals (sometimes useful in simulations)

#Mini-challenges
#1. Increase sample size N to 10,000 and re-run. How does the standard error change?
#2. Simulate dice rolls: sample(1:6, 100, replace = TRUE) → average, repeat with replicate().
#3. Manually calculate expected value of a binomial random variable (size=100, p=0.45) and compare to simulation.