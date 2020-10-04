name <- c("Flipper", "Bromley", "Nox", "Orion", "Dagger", "Zizi", "Carrie")
mo <- c(53, 19, 34, 41, 84, 140, 109)
size <- c("medium", "small", "medium", "large", "small", "extra small", "large")
weight <- c(21, 8, 4, 6, 7, 2, 36)
breed <- c("dog", "dog", "cat", "cat", "dog", "cat", "dog")

pets <- data.frame(mo, size, weight, breed)
names(pets) <- c("Months old", "Size", "Weight", "Breed")
rownames(pets) <- name
pets
# alternative naming

pets <- data.frame(row.names = name, "Months old" = mo, "Size" = size, "Weight" = weight, "Breed" = breed)

levels(pets[, "Breed"]) <- c("dog", "cat")
pets
pets[,"Breed"]
install.packages("tidyverse")


getwd()
##
employee.data <- read.csv("D:/ONLINE COURSES/Udemy/R/employee_data.csv", skip = 23, nrow = 200, stringsAsFactors = FALSE)

# skip = 23 tells R to skip the first 23 rows of the data set when reading the data
# nrow = 200 tells R to only read the first 200 observations

names(employee.data) <- c("Employee number", "First name", "Last name", "Birth date", "Gender", 
                          "Job title", "Salary", "From date", "To date")

# exporting data as a CSV

write.csv(employee.data, file = "employee_exercise.csv", row.names = FALSE)
employee.data
nrow(employee.data)
ncol(employee.data)
colnames(employee.data)
str(employee.data)
summary(employee.data)
##
library(tidyverse)
starwars

####
vaccinated <- c("Yes", "Yes", "No", "Yes", "No", "No", "Yes")
petsv <- cbind(pets, "Vaccinated" = vaccinated)
head(petsv)
milo <- data.frame(row.names = "Milo", Months.old = 67, Size = "small", Weight = 7, Breed = "dog", Vaccinated = "Yes")
petsvm <- rbind(petsv, milo)

ncol(petsvm)
nrow(petsvm)
colnames(petsvm)
rownames(petsvm)
str(petsvm)          # two numeric and three factor variables
class(petsvm)
class(diamonds)
# alternatively
str(diamonds)
diamonds.df <- as.data.frame(diamonds)
class(diamonds.df)

str(USJudgeRatings)
my.df <- USJudgeRatings
my.df$AVRG <- rowMeans(my.df)
avrg <- my.df["AVRG"]
head(my.df["AVRG"])

mean(c(NA,NA,(1:10)),na.rm=TRUE)
