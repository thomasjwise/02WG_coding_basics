# Coding Basics - Worksheet Solutions

# Setup Execution 
## This will use the function "source()" to run the separate R File "setup.R"
## The "setup.R" file includes information such as: which packages to install, 
## and to check the working directory is correctly set. 
source("setup.R", local = FALSE)

# Package Loading 
library(tidyverse)

# Section 1: Understanding Data in R

# Exercise 1: Read in the csv file, labelled 'data_wales_education.csv'
            # This contains a raw version of the data which we will be using. 

data <- read.csv(file = "data/data_wales_education.csv")

# Exercise 2: View the current dataset (data) 
  # For this, we can use the GUI, or functions such as View(), head() or tail() 

View(data)
head(data) 
tail(data)

# Exercise 3: Examine the dataframe in more detail, determining what is in each column 
  # Exercise 3a: Use the str() function, to examine its structure 

str(data)

  # Exercise 3b: Use ncol() and nrow(), to examine the number of rows/columns 

ncol(data)
nrow(data)

  # Exercise 3c: Get a summary of the entire dataframe using summary() 

summary(data)

    # From this we can see that all variables (with the exception of data values)
    # Are character classes, which is not useful when trying to understand the data. 

# Section 2: Transforming Data 
# Exercise 4: Renaming data columns 
  # Exercise 4a: Rename the 'Data.values' column, to 'Number.of.activities'
  # Hint you can use the rename() function 

# In this case we can see that the data.description column describes the data.values column. 
data <- rename(data, Number.of.activities = Data.values)

  # Exercise 4b: Remove the extra column called 'Data.description' 
  # Note: There are multiple methods to achieve this! 

data <- select(data, !Data.description)

# Exercise 5: Transforming between variable Types
  # Exercise 5a: Using the sapply function 'sapply()', isolate the columns with the type character. 
    # Before assigning it to a variable.
  # Hint: You can use the is.character parameter for this. 
chr_cols <- sapply(data, is.character)

  # Exercise 5b: Using the lapply function 'lapply()', set all character columns to factors
    # Making sure to reassign them to the columns correctly. 
  # Hint: You can use the as.factor parameter for this conversion.
data[chr_cols] <- lapply(data[chr_cols], as.factor)

  # Exercise 5c: Using summary(), evaluation the dataset in question again. 
summary(data)

# Section 3: Subsetting & Joining 

# Exercise 6: Breakdown & Subseting Data 
  # Exercise 6a: Using levels(), examine the number of levels in Academic.year
levels(data$Academic.year)

  # Exercise 6b: Next we can use the split() function to split this dataframe
    # Through splitting it we create a large list of dataframes
data_list_year <- split(data, data$Academic.year)

  # Exercise 6c: Next, examine this list using summary()
summary(data_list_year)
summary(data_list_year$`2016-17`)

  # Exercise 6d: We can divide this large list down using the list2env() function 
list2env(data_list_year, envir = .GlobalEnv)

# Exercise 7: Alternative Methods of subsetting data 
  # Exercise 7a: Lets choose a year, say `2016-17` and subset by Mode
  # We can use the subset() function to look at only the "Apprenticeship" group. 

data_201617_apprenticeships <- subset(`2016-17`, Mode.of.programme == "Apprenticeships")

  # Exercise 7b: However we can also subset by multiple groups.
  # In this instance, split the same dataset (`2016-17`), by all those under 20 

data_201617_under20 <- subset(`2016-17`,
                              Age.group == "16" |
                              Age.group == "17" |
                              Age.group == "18" |
                              Age.group == "19" )

# Exercise 8: Clean up! 
  # It is always important to clean up your data accordingly. 
  # In this case, we can use droplevels() to remove unused levels in our subsetted data.

data_201617_under20 <- droplevels(data_201617_under20)

# Exercise 9: Combining Datasets by Rows
  # Using the bind_rows() function, we can join together dataframes vertically. 
  # This allows us to rejoin dataframes. 
  # In this case, rejoin the years 2016-17, 2017-18 and 2018-19

data_2016to19 <- bind_rows(`2016-17`, `2017-18`, `2018-19`)

