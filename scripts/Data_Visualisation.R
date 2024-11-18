dataset <- read.csv("Cleaned_ISRO_Dataset.csv", stringsAsFactors = FALSE)

filtered_dataset <- dataset[dataset$Orbit.Type %in% c("Lunar", "SSPO (Sun Synchronous Polar Orbit)"), ]

# Remove rows with missing or invalid `Remarks`
filtered_dataset <- filtered_dataset[!is.na(filtered_dataset$Remarks) & filtered_dataset$Remarks != "", ]

# Preview the filtered dataset
head(filtered_dataset)

# Check structure of the dataset
str(filtered_dataset)

# View unique values in Remarks
unique(filtered_dataset$Remarks)

# Install if not already installed
install.packages("ggplot2")
install.packages("dplyr")
install.packages("plotly")

# Load the libraries
library(ggplot2)
library(dplyr)
library(plotly)

success_rates <- filtered_dataset %>%
  group_by(Orbit.Type) %>%
  summarize(Success.Rate = mean(Remarks, na.rm = TRUE)) # Ensure NA values are ignored
print(success_rates)

# Create the bar plot
ggplot(success_rates, aes(x = Orbit.Type, y = Success.Rate, fill = Orbit.Type)) +
  geom_bar(stat = "identity") +
  labs(title = "Success Rates Across Orbit Types", x = "Orbit Type", y = "Success Rate") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) # Rotate x-axis labels for better readability

