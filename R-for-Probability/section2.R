# Normal distribution functions
pnorm(2)                                          # P(Z <= 2) for standard normal
dnorm(0)                                          # density at x=0 (peak of bell curve)

qnorm(0.975)                                      # value where cumulative prob = 0.975 (≈1.96)

# Generate random normals for Monte Carlo
set.seed(1)
sims <- rnorm(10000, mean = 0, sd = 1)
mean(sims)                                        # should be close to 0
sd(sims)                                          # should be close to 1

# Other distributions (briefly covered)
pt(2, df = 10)                                    # t-distribution cumulative
qt(0.975, df = 10)                                # t quantile
pchisq(5, df = 3)                                 # chi-squared cumulative

# Visualize
x <- seq(-4, 4, length.out = 100)
plot(x, dnorm(x), type = "l", main = "Standard Normal Density")
abline(v = qnorm(0.975), col = "red")             # add vertical line at 97.5th percentile

#Mini-challenges
#1. Use rnorm() to simulate heights (mean=69 inches, sd=3) for 10,000 people. What proportion are taller than 72 inches? (use mean())
#2. Change pnorm(2) to pnorm(2, mean=1, sd=2) and interpret.
#3. Plot the density of a t-distribution with df=5 and overlay the normal curve.