# Project Setup Script: project_setup.R

# -------------------------------
# Create Dummy Data
# -------------------------------

# Create a dummy data frame with the following variables:
# 'age', 'salary', 'department', 'id', etc.
set.seed(123)  # For reproducibility

# Create a sample data frame
mydata <- data.frame(
  id = 1:10,  # 10 unique IDs
  age = sample(20:60, 10, replace = TRUE),  # Random ages between 20 and 60
  salary = sample(40000:100000, 10, replace = TRUE),  # Random salary between 40k and 100k
  department = sample(c("HR", "Sales", "Marketing", "IT"), 10, replace = TRUE),  # Random departments
  stringsAsFactors = FALSE
)

# Create another sample data frame (to simulate 'myfile.csv' as well)
myfile_data <- data.frame(
  id = 1:10,
  age = sample(25:55, 10, replace = TRUE),
  department = sample(c("Sales", "Finance", "IT", "R&D"), 10, replace = TRUE),
  salary = sample(30000:80000, 10, replace = TRUE),
  join_date = sample(seq(as.Date('2015-01-01'), as.Date('2020-12-31'), by="day"), 10),
  stringsAsFactors = FALSE
)

# -------------------------------
# Save Data as CSV
# -------------------------------

# Save the mydata data frame as data.csv in raw_data folder
write.csv(mydata, file = "raw_data/data.csv", row.names = FALSE)

# Save the myfile_data data frame as myfile.csv in raw_data folder
write.csv(myfile_data, file = "raw_data/myfile.csv", row.names = FALSE)

# -------------------------------
# Display Success Message
# -------------------------------
print("Dummy data has been created and saved as 'data.csv' and 'myfile.csv' in the 'raw_data' folder.")
