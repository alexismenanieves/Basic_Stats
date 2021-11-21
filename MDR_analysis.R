# Step 0. Load libraries and functions ------------------------------------
library(stats)

# Step 1. Load data -------------------------------------------------------
dataset <- read.csv("data/TB_data.csv")
attach(dataset)

# Step 2. Make a basic exploratory analysis
dim(dataset)
summary(dataset)
head(dataset)

# Step 2. Make plots
plot(x = Year, y = MDR, 
     pch = 16, xlab = "Year", 
     ylab = "Percent of TB cases classified as MDR",
     main = "Percent of TB cases classified as MDR in humans per year")

# Step 3. Create a linear model for MDR data and summarise
MDR_model <- lm(MDR ~ Year)
summary(MDR_model)


