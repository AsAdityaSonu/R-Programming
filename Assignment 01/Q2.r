# Set seed for reproducibility
set.seed(123)

# Generate random dataset
num_rows <- 100
num_cols <- 30
dataset <- matrix(sample(1:200, num_rows * num_cols, replace = TRUE), nrow = num_rows)

# (i) Replace values with NA in the defined range
dataset[10:60, ] <- NA

# Count number of rows with missing values
num_rows_missing <- sum(rowSums(is.na(dataset)) > 0)
print(num_rows_missing)

# (ii) Replace NA values with column average
column_averages <- colMeans(dataset, na.rm = TRUE)
dataset[is.na(dataset)] <- column_averages[col(dataset)][is.na(dataset)]

# (iii) Find Pearson correlation and plot heat map
correlation_matrix <- cor(dataset)
correlation_threshold <- 0.7
selected_columns <- colnames(dataset)[which(apply(correlation_matrix, 2, function(x) any(abs(x) <= correlation_threshold)))]
heatmap(correlation_matrix)

# (iv) Normalize values between 0 and 10
normalized_dataset <- scale(dataset, center = FALSE, scale = apply(dataset, 2, function(x) diff(range(x))) / 10)

# (v) Replace values with 1 if <= 0.5 else with 0
dataset_binary <- ifelse(dataset <= 0.5, 1, 0)
