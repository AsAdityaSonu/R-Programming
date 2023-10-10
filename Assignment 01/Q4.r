# Set seed for reproducibility
set.seed(123)

# Generate random dataset
num_rows <- 600
num_cols <- 15

# Generate random dataset
dataset <- matrix(runif(num_rows * num_cols, -100, 100), nrow = num_rows)

# (i) Plot scatter graph between Column 5 and Column 6
library(ggplot2)

scatter_plot <- ggplot(data = as.data.frame(dataset), aes(x = dataset[, 5], y = dataset[, 6])) +
  geom_point() +
  xlab("Column 5") +
  ylab("Column 6") +
  ggtitle("Scatter Plot: Column 5 vs Column 6")

print(scatter_plot)

# (ii) Plot histogram of each column in single graph
histogram_plot <- ggplot(data = as.data.frame(dataset), aes(x = value)) +
  geom_histogram(bins = 30, fill = "steelblue", color = "white") +
  facet_wrap(~variable, scales = "free") +
  xlab("Value") +
  ylab("Frequency") +
  ggtitle("Histogram of Each Column")

print(histogram_plot)

# (iii) Plot the Box plot of each column in single graph
boxplot_plot <- ggplot(data = as.data.frame(dataset), aes(x = variable, y = value)) +
  geom_boxplot(fill = "steelblue", color = "white") +
  xlab("Column") +
  ylab("Value") +
  ggtitle("Box Plot of Each Column")

print(boxplot_plot)
