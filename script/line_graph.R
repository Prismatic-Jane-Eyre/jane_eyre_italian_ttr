# Load the required libraries
library(ggplot2)
library(plotly)

# Read the dataset from the CSV file
dataset <- read.csv("data/ttr_italian.csv")

# Define the color palette
num_lines <- length(dataset) - 1
color_palette <- c("#1f78b4", "#33a02c", "#e31a1c", "#ff7f00", "#6a3d9a", "#b15928", "#a6cee3", "#fb9a99")

# Create the line plot
plot <- ggplot(data = dataset, aes(x = Chapter)) +
  geom_line(aes(y = X1909, color = "1909"), size = 1) +
  geom_line(aes(y = X1951, color = "1951")) +
  geom_line(aes(y = X1956, color = "1956")) +
  geom_line(aes(y = X1974, color = "1974")) +
  geom_line(aes(y = X2008, color = "2008")) +
  geom_line(aes(y = X2021, color = "2021")) +
  geom_line(aes(y = X2024_Pareschi, color = "2024_Pareschi")) +
  geom_line(aes(y = X2024_Sacchini, color = "2024_Sacchini")) +
  geom_line(aes(y = Original), color = "black", linetype = "dotted") +
  labs(x = "Chapter", y = "Values", title = "Type-Token Ratio (TTR) Jane Eyre Italian Translations", subtitle = "giovannipietrovitali@gmail.com") +
  theme_minimal() +
  theme(panel.grid.major = element_line(color = "gray", linetype = "dotted"),
        panel.grid.minor = element_blank(),
        axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_color_manual(values = color_palette)

# Add vertical lines for each line in the dataset
vertical_lines <- geom_vline(data = dataset, aes(xintercept = as.numeric(Chapter)), color = "gray70", linetype = "dashed", alpha = 0.3)

# Add chapter numbers on the x-axis
x_labels <- scale_x_continuous(breaks = seq_along(dataset$Chapter), labels = dataset$Chapter)

# Combine the line plot, vertical lines, and x-axis labels
plot_with_vertical_lines <- plot + vertical_lines + x_labels

# Convert the plot to an interactive format using plotly
plot_interactive <- ggplotly(plot_with_vertical_lines)

# Display the interactive plot
plot_interactive
