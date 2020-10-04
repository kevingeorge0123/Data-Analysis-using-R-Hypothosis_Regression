sal <- read.csv("D:/ONLINE COURSES/Udemy/R/ztest-a.csv")
summary(sal)

z.test <- function(a, mu, sd){
  zeta <- (mean(a) - mu) / (sd/sqrt(length(a)))
  return(zeta)
}

z.test(a = sal$salary, mu = 113000, sd = 15000)

################
install.packages("psych")
library(psych)

rate <- read.csv("D:/ONLINE COURSES/Udemy/R/ttest-a.csv") # load your data
describe(rate) # understand your data

my.t.test <- function(a, hmean){
  t <- (mean(a) - hmean)/(sd(a)/sqrt(length(a)))
  return(t) # create the test
}

my.t.test(rate$Open.rate, 0.4)
H0 = open rate is NOT 40%
# H1 = open rate is 40%
# The problem is a two-sided test
# T = 0.53
# t1 = 2.26 Accept the null. At the 5% significance level we cannot say that the competitor's open rate is 40%
# t2 = 3.25 Accept the null. The test on that sample shows that at 1% significance, our competitor's open rate is not 40%.


########
# A health guru on the internet designed a weight-loss program. 
# You are wondering if it is working. You are given a sample of some people who did the program. 
# You can find the data in kg if you prefer working with kg as a unit of measurement.

# State the null hypothesis.
# Calculate the appropriate statistic
# Decide if this is a one-sided or a two-sided test. What is the p-value?
# Based on the p-value, decide at 1%,5% and 10% significance, if the program is working. Comment using the appropriate statistical jargon.
install.packages("pastecs")
library(pastecs)
library(psych)

weight <- read.csv("D:/ONLINE COURSES/Udemy/R/weight_data_exercise_kg.csv")
describe(weight)

dep.t.test <- t.test(weight$before, weight$after, paired = TRUE, alternative = "g")
dep.t.test

# H0: The difference between the before and the after conditions is less than or equal to 0
# t = 2.01
# The test is one-sided. We want to know if people are actually losing weight. p = 0.038
# At 1% significance we accept the null hypothesis. The data shows that the program is not working.
# At 5% significance, we reject the null hypothesis. Therefore, the program is successful.
# At 10% significance, there is enoug statistical evidence that the program is working.