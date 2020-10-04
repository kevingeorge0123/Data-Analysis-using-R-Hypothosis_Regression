library(tidyverse)
library(magrittr)
star<- starwars
star
######
install.packages("tibble")
install.packages("backports")
install.packages("tidyverse")
library(tibble)
library(everything)
install.packages("everything")
install.packages("dplyr")
install.packages("magrittr")
?magrittr
tibble(x = 1:3, y = list(1:5, 1:10, 1:20))


employee.data <- read.csv("employee_data.csv", skip = 23, stringsAsFactors = FALSE)
employee.data <- as_tibble(employee.data)
employee.data$gender <- as.factor(employee.data$gender)
employee.data$title <- as.factor(employee.data$title)
ncol(employee.data)

any(is.na(employee.data))


employee.a <- employee.data %>% 
  select(ends_with("name"), gender, everything()) %>%
  filter(salary >= 70000) %>% 
  arrange(gender, last_name)

good.earners <- employee.a["emp_no"]

employee.b <- employee.data %>% 
  group_by(title, gender) %>% 
  summarise(avg.salary = mean(salary)) %>% 
  mutate(monthly = avg.salary/12) %>% 
  arrange(gender, desc(monthly))


####
##employee.data <- read.csv("D:/ONLINE COURSES/Udemy/R/employee_data.csv", skip = 23, nrow = 200, stringsAsFactors = FALSE)
library(tidyverse)
billboard<-read.csv("D:/ONLINE COURSES/Udemy/R/billboard.csv", stringsAsFactors = FALSE)
library(tibble)
billboard <- as_tibble(billboard)
billboard
######
library(tidyr)
weather <- read.csv("D:/ONLINE COURSES/Udemy/R/weather_untidy.csv", stringsAsFactors = FALSE)
weather <- as_tibble(weather)

weather.a <- weather %>% gather(day, value, d1:d31, na.rm = TRUE)

weather.b <- weather.a %>% mutate(day = parse_number(day)) %>%
  select(id, year, month, day, element, value) %>%
  arrange(id, year, month, day)

weather.c <- weather.b %>% spread(element, value)

# Tidying the tb data

tb <- read.csv("D:/ONLINE COURSES/Udemy/R/tb_untidy.csv", stringsAsFactors = FALSE)
tb <- as.tibble(tb)

names(tb) <- str_replace(names(tb), "new_sp_", "")
names(tb) <- str_replace(names(tb), "m", "m.")
names(tb) <- str_replace(names(tb), "f", "f.")

tb$m.04 <- NULL
tb$m.514 <- NULL
tb$f.04 <- NULL
tb$f.514 <- NULL
tb$m.u <- NULL 
tb$f.u <- NULL

tb.a <- tb %>% gather(m.014:f.65, key = "column", value = "cases", na.rm = TRUE) %>% arrange(country)
tb.b <- tb.a %>% separate(column, into = c("sex", "age"))

tb.b$age <- str_replace_all(tb.b$age, "0", "0-")
tb.b$age <- str_replace_all(tb.b$age, "15", "15-")
tb.b$age <- str_replace_all(tb.b$age, "25", "25-")
tb.b$age <- str_replace_all(tb.b$age, "35", "35-")
tb.b$age <- str_replace_all(tb.b$age, "45", "45-")
tb.b$age <- str_replace_all(tb.b$age, "55", "55-")
tb.b$age <- str_replace_all(tb.b$age, "65", "65-100")

