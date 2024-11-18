dataset <- read.csv("ISRO mission launches.csv", stringsAsFactors = FALSE)
head(dataset)
dataset_clean <- dataset[!is.na(dataset$Orbit.Type) & dataset$Orbit.Type != "" & !is.na(dataset$Remarks) & dataset$Remarks != "", ]
dataset_clean <- dataset_clean[dataset_clean$Orbit.Type %in% c("Lunar", "SSPO (Sun Synchronous Polar Orbit)"), ]
dataset_clean$Remarks <- ifelse(dataset_clean$Remarks == "Launch successful", 1, 0)
dataset_subset <- dataset_clean[, c("Orbit.Type", "Remarks")]
summary(dataset_subset)
head(dataset_subset)
total_rows <- nrow(dataset_subset)
print(paste("The cleaned dataset contains", total_rows, "rows."))
write.csv(dataset_subset, "Cleaned_ISRO_Dataset.csv", row.names = FALSE)

