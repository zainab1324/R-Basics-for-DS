#Section 4: Programming Basics

#exercise : Write your own custom function and use control structures (if/else and for loops) to analyze the data.

# if() / else
classify_state <- function(rate) {
  if (rate > 5) {
    return("High risk")
  } else if (rate > 2) {
    return("Medium risk")
  } else {
    return("Low risk")
  }
}

# Test the function
classify_state(6.2)      # should return "High risk"
classify_state(1.8)      # should return "Low risk"

# for() loop
cat("Murder rates for first 5 states:\n")
for (i in 1:5) {
  cat(murders$state[i], ":", round(murders$rate[i], 2), "\n")
}

# function()
murder_rate_func <- function(total, population) {
  rate <- total / population * 100000          # same calculation as before
  return(rate)
}

# Use the custom function
murder_rate_func(300, 5000000)                 # example: 300 murders, 5 million people


##Mini-challenges
##
##1. Modify classify_state() to also print the state name (pass two arguments).
##2. Write a for-loop that prints only states in the “West” region.
##3. Create a new function that returns the state with the highest rate using which.max() inside it.