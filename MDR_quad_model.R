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

# Step 3. Fit a quadratic model -------------------------------------------
MDR_quad_model <- lm(MDR ~ Year + I(Year^2))
summary(MDR_quad_model)

# Step 4. Use and F-test to look at significance --------------------------
anova(MDR_quad_model)

# Step 5. Predict all data and create intervals ---------------------------
newdata <- data.frame(Year = 2000:2015)

lin1 <- predict(MDR_model, newdata, interval = "prediction")
quad1 <- predict(MDR_quad_model, newdata, interval = "prediction")

# Step 6. Plot linear and quadratic models and compare --------------------
plot(x = Year, y = MDR, 
     ylab = "Percent of TB cases classified as MDR",
     xlim = c(2000,2015),
     ylim = c(0.3, 2.5))

# To add more lines, you'll have to use the function "points"
mapply(function(x) {points(newdata$Year, lin1[,x], type = "l")}, 1:3)
mapply(function(x) {points(newdata$Year, quad1[,x], 
                           type = "l", lty = 3)}, 1:3)

