#install.packages("car") # install necessary packages 
library(car) 
  # set seed for reproducibility
set.seed(100)
# simulate data from X -> Z -> Y 
n <- 1000
x <- rnorm(n, mean=0, sd=1) # x is a standard normal variable with a small noise  
z <- 2 * x + rnorm(n, mean =0, sd=1) # z is linearly dependent on X with a small noise 
y <- 4 * z + rnorm(n, mean=0, sd=1) # y is linearly dependent on z with a small noise

cor(x,z) # show correlation between x and z 
# as expected, correlation between the two variables is very high 0.9 

model <- lm(y ~ x + z) # fit the linear model with x and z predicting y

vif_model <- vif(model) # display vif of the variables

list(model_summary = summary(model), VIF = vif_model) # output model summary and VIF results 

