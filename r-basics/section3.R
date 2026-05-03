#Section 3: Indexing, Data Manipulation (Wrangling), and Plots

#exercise : Calculate murder rates, filter states, create new data frames, and make plots. Use every function/operator listed (including dplyr and plotting).

library(dplyr)   # needed for mutate, filter, select, and the pipe

# Logical indexing with []
high_murder_states <- murders[murders$total > 500, ]   # only states with >500 murders

# which()
south_index <- which(murders$region == "South")        # positions where region is South
murders$state[south_index]                             # states in the South

# match() and %in%
abb_vec <- c("CA", "NY", "TX")
match(abb_vec, murders$abb)                            # positions of matching abbreviations
abb_vec %in% murders$abb                               # logical vector: is it in the data?

# Create a new data frame
mini_df <- data.frame(state = c("California", "New York"),
                      rate  = c(4.5, 3.2))            # new data frame from vectors

nrow(murders)                                          # number of rows (50)

sum(murders$total > mean(murders$total))               # count how many states are above average
mean(murders$population)                               # average population
min(murders$total)                                     # minimum murders
max(murders$total)                                     # maximum murders

# dplyr pipeline (pipe operator %>%)
murders <- murders %>%
  mutate(rate = total / population * 100000,           # adds new column (murder rate per 100k)
         log_pop = log10(population)) %>%              # log10 for scaling
  filter(rate < 3) %>%                                 # keeps only low-rate states
  select(state, region, rate, log_pop)                 # keeps only these columns

# Plots
plot(murders$log_pop, murders$rate, 
     main = "Murder Rate vs Log Population")          # basic scatter plot

hist(murders$rate, breaks = 10, 
     main = "Distribution of Murder Rates")           # histogram

boxplot(rate ~ region, data = murders, 
        main = "Murder Rate by Region")               # boxplot with formula


##Mini-challenges
##
##1. Change the filter to rate > 5 and re-run the pipeline.
##2. Add log10() directly in the plot() call instead of creating a new column.
##3. Use nrow() after filtering — how many states remain?