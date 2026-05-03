# Layering with +
p <- ggplot(murders, aes(x = population, y = total, color = region)) +
  geom_point(size = 3) +                        # aes() mapping inside or outside
  geom_smooth(method = "lm", se = TRUE) +       # regression line + CI
  scale_x_log10() +                             # log scales
  scale_y_log10() +
  scale_color_manual(values = c("blue", "red", "green", "purple")) +  # custom colors
  labs(title = "Murders vs Population by Region",
       x = "Population (log scale)",
       y = "Total Murders",
       caption = "Source: dslabs") +           # labels
  theme_minimal() +                             # theme
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  # further theme adjustments

print(p)

# Facets
ggplot(heights, aes(x = height, fill = sex)) +
  geom_density(alpha = 0.5) +
  facet_wrap(~ sex, scales = "free") +          # small multiples
  coord_flip()                                  # flip axes

# Reordering
murders <- murders %>%
  mutate(rate = total / population * 100000)

ggplot(murders, aes(x = reorder(region, rate, FUN = median), y = rate)) +  # reorder by median rate
  geom_boxplot() +
  geom_point(position = position_jitter(width = 0.2), alpha = 0.4) +
  labs(title = "Murder Rate by Region (reordered)") +
  theme_bw()

#Mini-challenges
#1. Replace geom_smooth() with a loess smooth (method = "loess").
#2. Add position_dodge() to a bar plot of summarized data.
#3. Create a faceted scatter plot using facet_grid(sex ~ region) (after joining data if needed).
#4. Save your favorite plot: ggsave("myplot.png", width = 8, height = 6).