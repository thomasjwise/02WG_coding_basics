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
# Exercise 4: 

# Rename columns 
# In this case we can see that the data.description column describes the data.values column. 
data <- rename(data, Number.of.activities = Data.values)

# Remove column
data$Data.description <- NULL

# Set to factor 
chr_cols <- sapply(data, is.character)
data[chr_cols] <- lapply(data[chr_cols], as.factor)

levels(data$Academic.year)
data_list <- split(data, data$Academic.year)
