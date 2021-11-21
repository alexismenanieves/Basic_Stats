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
plot(x = Year, y = M.bovis, 
     pch = 16, xlab = "Year", 
     ylab = "Case notification for bovine TB",
     main = "Figure 1. Case notifications for bovine TB in humans per year")

# Step 3. Create a linear model for M.bovis data and summarise
M.bovis_model <- lm(M.bovis ~ Year)
summary(M.bovis_model)

# Step 4. Plot residuals vs fitted and qq-plot
plot(M.bovis_model, which = 1:2, add.smooth = FALSE)

# Step 5. Plot fitted line
plot(x = Year, y = M.bovis, 
     xlab = "Year", ylab = "Case notifications for Bovine TB")

abline(M.bovis_model)

# Step 6. Calculate confidence intervals
confint(M.bovis_model)

# Step 7. Predict values for next three years
newdata <- data.frame(Year = 2013:2015)

predict(M.bovis_model, newdata, interval = "prediction")
