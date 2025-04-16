# Load required libraries
library(readr)    # For reading CSV files
library(haven)    # For reading SAS files
library(dplyr)    # For data manipulation
library(lubridate) # For date operations
library(here)     # For managing paths in projects

# -------------------------------
# Data Import: Reading CSV Files
# -------------------------------

# Read CSV file into R
mydata <- read_csv("data.csv")
# Note: This is similar to the SAS PROC IMPORT command

# -------------------------------
# Dynamic Paths and Project Folder Setup
# -------------------------------

# Use here() to create project-relative paths for portability
data_path <- here("data", "myfile.csv")
mydata <- read_csv(data_path)

# Alternatively, build paths manually using file.path
folder <- "C:/data"
file <- "myfile.csv"
path <- file.path(folder, file)
mydata <- read_csv(path)

# -------------------------------
# Date Handling
# -------------------------------

# Convert string to Date (similar to SAS's 'd' suffix date literals)
# R uses as.Date() function for this

# Example: "2025-01-21" (ISO format)
d1 <- as.Date("2025-01-21")
print(d1)

# SAS style date: "21JAN2025"
d2 <- toupper(format(as.Date("21JAN2025", format = "%d%b%Y"), "%d%b%Y"))
print(d2)

# -------------------------------
# Date-Time Objects
# -------------------------------

# Convert string to Date-Time (similar to SAS datetime format)
dt1 <- as.POSIXct("2025-01-21 10:55", format = "%Y-%m-%d %H:%M")
print(dt1)

# Print the Date-Time in custom format (SAS-style format)
dt2 <- as.POSIXct("2025-01-21 10:55", format = "%Y-%m-%d %H:%M")
formatted_dt <- toupper(format(dt2, "%d%b%YT%H:%M"))
print(formatted_dt)

# -------------------------------
# Formatting Dates
# -------------------------------

# Format Date in different styles
formatted_date1 <- format(d1, "%d-%b-%Y")      # 21-Jan-2025
formatted_date2 <- format(d1, "%A, %d %B %Y")  # Tuesday, 21 January 2025
print(formatted_date1)
print(formatted_date2)

# Extract Date components like day, month, year
day <- format(dt1, "%d")
month <- format(dt1, "%b")
year <- format(dt1, "%Y")
hour <- format(dt1, "%H")
minute <- format(dt1, "%M")

print(paste("Day:", day, "Month:", month, "Year:", year, "Hour:", hour, "Minute:", minute))

# -------------------------------
# Create Project Folders
# -------------------------------

# Create project directories for organization
folders <- c("raw_data", "scripts", "output")
for (f in folders) {
  if (!dir.exists(f)) dir.create(f)
}

# -------------------------------
# Input / Put Equivalent
# -------------------------------

# Simulating SAS Input and Put
age <- as.character(23)
print(age)

# -------------------------------
# Filtering Data (SAS WHERE vs. R filter)
# -------------------------------

# Use filter() from dplyr to filter data (similar to SAS WHERE)
new_data <- mydata %>%
  filter(age > 30)

# -------------------------------
# Creating New Variables (SAS DATA Step vs. R mutate)
# -------------------------------

# Use mutate() from dplyr to create new variables
new_data <- mydata %>%
  mutate(new_var = old_var * 2)

# -------------------------------
# Sorting Data (SAS PROC SORT vs. R arrange)
# -------------------------------

# Use arrange() from dplyr to sort data
sorted_data <- mydata %>%
  arrange(age)

# -------------------------------
# Removing Duplicates (SAS NODUPKEY vs. R distinct)
# -------------------------------

# Use distinct() from dplyr to remove duplicates
unique_data <- mydata %>%
  distinct(id, .keep_all = TRUE)

# -------------------------------
# Summarizing Data (SAS PROC MEANS vs. R summarize)
# -------------------------------

# Use summarize() from dplyr to calculate mean salary
summary_data <- mydata %>%
  group_by(department) %>%
  summarize(mean_salary = mean(salary, na.rm = TRUE))

# -------------------------------
# Merging Data (SAS MERGE vs. R join)
# -------------------------------

# Use left_join() from dplyr to merge datasets by ID
merged_data <- left_join(dataset1, dataset2, by = "ID")

# -------------------------------
# Conditional Processing (SAS IF-THEN vs. R if_else)
# -------------------------------

# Use if_else() from dplyr for conditional processing
new_data <- mydata %>%
  mutate(category = if_else(age > 50, "Senior", "Junior"))

# -------------------------------
# Final Comments
# -------------------------------

# This script provides an overview of common data manipulation tasks in both SAS and R.
# The R code utilizes the tidyverse library (dplyr, readr, tidyr) for data import, transformation, and analysis.
# Always ensure proper path management using file.path(), here(), or project structures for reproducibility.
