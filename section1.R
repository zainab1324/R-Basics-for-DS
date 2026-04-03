#Section 1: R Basics, Functions, and Data Types

#exercise : set up your workspace, load the murders dataset, and explore its basic properties (datatypes, structure, columns, etc.)

ls()                                      # lists all objects currently in your workspace

# Assignment operator (preferred R style)
murder_data <- murders                    # creates a new object (copy of the dataset)

print(murder_data)                        # explicitly prints the object

class(murder_data)                        # returns the data type/class (should be "data.frame")
class(murder_data$region)                 # class of a single column

data("murders")                           # reloads the dataset (already loaded, but good practice)

str(murder_data)                          # shows the structure of the whole object

head(murder_data, n = 6)                  # displays the first 6 rows 

murder_data$total                         # $ extracts the total column from the data frame

names(murder_data)                        # returns column names

length(murder_data$state)                 # number of elements in the state vector (50 states)

levels(murder_data$region)                # shows the categories/levels of the factor column "region"


##Mini-challenges
##
##1. What is the class of murder_data$population?
##2. How many columns does the data frame have? (use length() on the data frame itself)
##3. Run levels(murder_data$region) — what are the four regions?
