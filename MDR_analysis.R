# Step 0. Load libraries and functions ------------------------------------
library(stats)
library(graphics)

# Step 1. Load data -------------------------------------------------------
dataset <- read.csv("data/TB_data.csv")
attach(dataset)

# Step 2. Make a basic exploratory analysis
dim(dataset)
summary(dataset)
head(dataset)

# Step 3. Make plots
plot(x = Year, y = MDR, 
     pch = 16, xlab = "Year", 
     ylab = "Percent of TB cases classified as MDR",
     main = "Percent of TB cases classified as MDR in humans per year")

# Step 4. Create a linear model for MDR data and summarise
MDR_model <- lm(MDR ~ Year)
summary(MDR_model)

# 4.1 When fitting any other sort of model, use ANOVA
anova(MDR_model)

# Step 5. Plot residuals vs fitted and qq-plot
plot(MDR_model, which = 1:2, add.smooth = FALSE)

# Step 6. Plot fitted line
plot(x = Year, y = MDR, 
     xlab = "Year", ylab = "Case notifications for Bovine TB")

abline(MDR_model)

# Step 7. Calculate confidence intervals
confint(MDR_model)

# Step 7. Predict values for next three years
newdata <- data.frame(Year = 2013:2015)

predict(MDR_model, newdata, interval = "prediction")
