# Base ggplot structure
p1 <- ggplot(heights, aes(x = height)) +      # data + aes()
  geom_histogram(binwidth = 2, color = "black", fill = "lightblue")  # histogram
print(p1)

ggplot(heights, aes(x = height)) +
  geom_density(fill = "lightblue", alpha = 0.5)   # density plot

# Compare groups
ggplot(heights, aes(x = sex, y = height, fill = sex)) +
  geom_boxplot() +                                # boxplot
  geom_point(position = position_jitter(width = 0.2), alpha = 0.3)  # jittered points

# Q-Q plot for normality
ggplot(heights, aes(sample = height)) +
  geom_qq() +                                     # Q-Q plot
  geom_qq_line()                                  # reference line

# Scatter and bar
ggplot(heights, aes(x = height, y = weight)) +   # assumes weight is available or use another var
  geom_point(alpha = 0.5)                         # scatter plot

ggplot(murders, aes(x = region)) +
  geom_bar()                                      # bar plot for counts

#Mini-challenges
#1. Add geom_density() to the same plot as geom_histogram() (use alpha for transparency).
#2. Create a boxplot of murder rate by region (mutate(rate = total/population*100000) first).
#3. Use geom_qq() on a transformed variable (e.g., log(height)).