# Data preparation with dplyr
heights_summary <- heights %>%
  mutate(height_group = cut(height, breaks = c(50, 65, 70, 75, 80),  # binning
                            labels = c("Short", "Medium", "Tall", "Very Tall"))) %>%
  group_by(sex, height_group) %>%
  summarize(avg_height = mean(height), .groups = "drop") %>%
  filter(avg_height > 65)

# Plot with multiple aesthetics
ggplot(heights_summary, aes(x = height_group, y = avg_height,
                            color = sex, size = avg_height, fill = sex)) +
  geom_col(position = position_dodge()) +       # or geom_col()
  geom_point(position = position_dodge(width = 0.9)) +
  labs(title = "Average Height by Group and Sex") +
  theme_minimal() +
  coord_flip()

# Save the plot
ggsave("height_plot.png", width = 10, height = 6, dpi = 300)

#Mini-challenges
#1. Use mutate() to create a new variable (e.g., height_cm = height * 2.54) and plot it.
#2. Try aes(fill = ...) on a histogram or density.
#3. Experiment with theme_bw(), theme_classic(), etc., and compare.