# Set seed for reproducibility
set.seed(123)

# Generate random dataset
num_rows <- 500
num_cols <- 5

# Generate random dataset
dataset <- matrix(runif(num_rows * num_cols, 5, 10), nrow = num_rows)

# (i) Perform t-Test on each column
t_test_results <- apply(dataset, 2, function(col) t.test(col))
print(t_test_results)

# (ii) Perform Wilcoxon Signed Rank Test on each column
wilcoxon_test_results <- apply(dataset, 2, function(col) wilcox.test(col, mu = 7.5))
print(wilcoxon_test_results)

# (iii) Perform Two Sample t-Test and Wilcoxon Rank Sum Test on Column 3 and Column 4
col3 <- dataset[, 3]
col4 <- dataset[, 4]

# Two Sample t-Test
t_test_result_col3_col4 <- t.test(col3, col4)
print(t_test_result_col3_col4)

# Wilcoxon Rank Sum Test
wilcoxon_test_result_col3_col4 <- wilcox.test(col3, col4)
print(wilcoxon_test_result_col3_col4)
