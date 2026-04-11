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

data <- read.csv(file = "data/data_wales_education.csv")

# Exercise 2: View the data, as a whole, its structure or summary

View(data)
head(data) 
tail(data)

str(data) 

summary(data)

# Exercise 3: Convert all the character variable columns to factors

chr_cols <- sapply(data, is.character)
data[chr_cols] <- lapply(data[chr_cols], as.factor)
summary(data)

# Section 2: Data Cleaning 
# Exercise 4: Using the split() function, split the dataset based upon age.group

  # First we can check the levels involved using 
levels(data$Age.group)

  # Second we can split into a list 
data_list_age <- split(data, data$Age.group)

# Exercise 5: Using list2env(), split down this list into individual dataframes
list2env(data_list_age, envir = .GlobalEnv)

# Exercise 6: Using summary(), examine one of the new dataframes created. 
# For Example: 
summary(`All ages`)


# Exercise 7: Alternatively, we can select only a certain factor from a dataframe. 
  # Remove all Confidential instances from your chosen dataframe. 
  # Hint: You can use subset to select specific singular instances  

all_ages_nonconf <- subset(`All ages`, Notes == "")

# Exercise 8: However, you can also select multiple variables to select by
  # From this non-confidential dataset, select only the academic years between 2019-20 and 2024-25 (inclusive) 
  # This takes advantage of simple logical conditionals such as OR (|) as well as AND (&)

all_ages_trimmed <- subset(all_ages_nonconf, 
                           Academic.year == "2019-20" |
                           Academic.year == "2020-21" |
                           Academic.year == "2021-22" |
                           Academic.year == "2022-23" |
                           Academic.year == "2023-24" | 
                           Academic.year ==  "2024-25")

# Exercise 9: Next, lets create a dataframe, which combines all educational activited for those aged under 20. 
  # You can approach this from multiple directions, however use bind_rows() for this exercise

under20_activities <- bind_rows(`16`, `17`, `18`, `19`)

# Extension Exercise 

# Using all the knowledge from today and previous session, starting from the base dataset. 
  # Create a dataset which meets the following criteria: 

  # Only spans the period of 2017-2020 (2017-18, 2018-19 and 2019-2019)
  # Only presents non-confidential activities
  # Is either at an Pre-Entry or Entry Level 
  # And is a Regulated Qualification. 

# Subset by Year
data_ext <- subset(data, 
                   Academic.year == "2017-18" |
                   Academic.year == "2018-19" |
                   Academic.year == "2019-20")

# Subset by Confidentiality 
data_ext <- subset(data_ext, 
                   Notes == "")

# Subset by Level 
data_ext <- subset(data_ext, 
                   Activity.level == "Pre-entry level" |
                   Activity.level == "Entry level")

# Subset by Qualification Type
data_ext <- subset(data_ext, 
                   Standardised.activity == "Regulated qualification")

# Using Summary, we can see that some levels are now zero, so these can be dropped
summary(data_ext)

data_ext <- droplevels(data_ext)



