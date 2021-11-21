# Step 0. Load libraries and functions ------------------------------------
library(stats)

# Step 1. Load data -------------------------------------------------------
dataset <- read.csv("data/TB_data.csv")
attach(dataset)

# Step 2. Make a basic exploratory analysis
dim(dataset)
summary(dataset)
head(dataset)

# Step 3. Fit a quadratic model -------------------------------------------
MDR_quad_model <- lm(MDR ~ Year + I(Year^2))
summary(MDR_quad_model)

# Step 4. Use and F-test to look at significance --------------------------
anova(MDR_quad_model)
