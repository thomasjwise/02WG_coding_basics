# Coding Basics - Homework Solutions

# Setup Execution 
## This will use the function "source()" to run the separate R File "setup.R"
## The "setup.R" file includes information such as: which packages to install, 
## and to check the working directory is correctly set. 
source("setup.R", local = FALSE)

# Package Loading 
library(tidyverse)

# Section 1: Recapping Setup, 

# Exercise 1: Read in the dataset file: 

data <- read.csv(file = ??)

# Exercise 2: View the data, as a whole, its structure or summary

str(??) 

summary(??)

# Exercise 3: Convert all the character variable columns to factors

chr_cols <- sapply(??, is.??)
data[??] <- lapply(data[??], as.??)
summary(??)

# Section 2: Data Cleaning 
# Exercise 4: Using the split() function, split the dataset based upon Age.group

  # First we can check the levels involved using 
levels(data$??)

  # Second we can split into a list 
data_list_age <- split(data, data$??)

# Exercise 5: Using list2env(), split down this list into individual dataframes
list2env(??, envir = .GlobalEnv)

# Exercise 6: Using summary(), examine one of the new dataframes created. 


# Exercise 7: Alternatively, we can select only a certain factor from a dataframe. 
  # Remove all Confidential instances from your chosen dataframe. 
  # Hint: You can use subset to select specific singular instances  


# Exercise 8: However, you can also select multiple variables to select by
  # From this non-confidential dataset, select only the academic years between 2019-20 and 2024-25 (inclusive) 
  # This takes advantage of simple logical conditionals such as OR (|) as well as AND (&)

all_ages_trimmed <- subset(??, 
                           ?? | ??)

# Exercise 9: Next, lets create a dataframe, which combines all educational activited for those aged under 20. 
  # You can approach this from multiple directions, however use bind_rows() for this exercise

# Extension Exercise 

# Using all the knowledge from today and previous session, starting from the base dataset. 
  # Create a dataset which meets the following criteria: 

  # Only spans the period of 2017-2020 (2017-18, 2018-19 and 2019-2019)
  # Only presents non-confidential activities
  # Is either at an Pre-Entry or Entry Level 
  # And is a Regulated Qualification. 




