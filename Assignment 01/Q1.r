# Generate random strings
generate_random_string <- function(length) {
  characters <- c(letters, LETTERS, 0:9)
  random_string <- paste0(sample(characters, length, replace = TRUE), collapse = "")
  return(random_string)
}

# Generate 1000 random strings
num_strings <- 1000
string_length <- 10
random_strings <- replicate(num_strings, generate_random_string(string_length))

# Write random strings to a file
file_path <- "random_strings.txt"
writeLines(random_strings, file_path)
