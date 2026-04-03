#Section 2: Vectors and Sorting

#exercise : Pull out vectors from the murders data frame and practice creating, sorting, ordering, and ranking them.

# Vector creation with c()
example_vec <- c(1000000, 500000, 2000000, 300000)   # combine numbers into a vector

pop <- murders$population                     # extract population vector
total <- murders$total                        # extract total murders vector

sort(pop)                                     # sorts a vector in ascending order

order_pop <- order(pop)                       # returns the indices that would sort the vector
murders$state[order_pop]                      # states ordered by population (smallest to largest)

rank_pop <- rank(pop)                         # assigns ranks to each value
head(rank_pop, 10)                            # see the first 10 ranks


##Mini-challenges
##
##1. Use order() to show the state with the largest population (hint: use the last index).
##2. Compare the output of sort(pop) vs pop[order_pop] — what’s the difference?
##3. Try rank(total) — which state has the highest murder count?