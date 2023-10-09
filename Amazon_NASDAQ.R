# Install required packages if not already installed
if (!require("tidyverse")) {
  install.packages("tidyverse")
}
if (!require("ggplot2")) {
  install.packages("ggplot2")
}
if (!require("caret")) {
  install.packages("caret")
}

# Set the root directory for the csv files
file_root <- "C:/Users/bird0/Desktop/cs467"

# Read in the .csv files
amzn_data <- read.csv(file.path(file_root, "AMZN.csv"))
ixic_data <- read.csv(file.path(file_root, "^IXIC.csv"))

# Convert the Date fields to Date type
amzn_data$Date <- as.Date(amzn_data$Date)
ixic_data$Date <- as.Date(ixic_data$Date)

# Create a linear regression model with just amazon data. 
model <- lm(High ~ Open, data = amzn_data)

# Get model summary and output to console
summary(model)

# Generate plot of the model
plot_model <- ggplot(amzn_data, aes(x = Open , y = High)) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(title = "Amazon High Price vs. Open Price",
       x = "Amazon Open Price",
       y = "Amazon High Price") +
  theme_bw()


# Save the plot to file
ggsave(file.path(file_root, "project2/plot.png"), plot = plot_model, width = 8, height = 6)

# Combine the datasets by date
combined_data <- merge(amzn_data, ixic_data, by = "Date", suffixes = c(".amzn", ".ixic"))

# Remove rows with NA values
combined_data <- na.omit(combined_data)


# Generate plot of the model and save to file
plot_model <- ggplot(combined_data, aes(x = Open.amzn, y = High.amzn)) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(title = "Amazon High Price vs. Open Price",
       x = "Amazon Open Price",
       y = "Amazon High Price") +
  theme_bw()

# Save the plot to file
ggsave(file.path(file_root, "project2/plot2.png"), plot = plot_model, width = 8, height = 6)



# Create a multiple linear regression model
model <- lm(High.amzn ~ Open.amzn + Open.ixic, data = combined_data)

# Get model summary and output to console
summary(model)

# Generate plot of the model
plot_model <- ggplot(combined_data, aes(x = Open.amzn, y = High.amzn, color = Open.ixic)) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(title = "Amazon High Price vs. Open Price with NASDAQ",
       x = "Amazon Open Price",
       y = "Amazon High Price") +
  theme_bw()

# Save the plot to file
ggsave(file.path(file_root, "project2/plot3.png"), plot = plot_model, width = 8, height = 6)

# Display the plot
plot_model