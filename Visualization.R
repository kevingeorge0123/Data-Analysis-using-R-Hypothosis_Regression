library(tidyverse)
install.packages("ggplot2")
hdi<- read.csv("D:/ONLINE COURSES/Udemy/R/hdi-cpi.csv",stringsAsFactors =FALSE )
library(tibble)
library(ggplot2)
hdi<-as_tibble(hdi)
hdi
s<-ggplot(hdi,aes(CPI.2015,HDI.2015))
s
s+geom_point()
s+geom_point()+facet_grid(Region~.)
s+geom_point(aes(color=Region),size=3)+facet_grid(Region~.)+stat_smooth()
s+geom_point(aes(color=Region),size=3)+facet_grid(Region~.)+stat_smooth()+coord_cartesian(xlim = c(0.75,1))
s+geom_point(aes(color=Region),size=3)+stat_smooth()+theme_minimal()

hist<- ggplot(data=hdi,aes(x=CPI.2015))
hist +geom_histogram()
hist +geom_histogram(binwidth = 0.2,color="darkslategrey",fill="darkslategrey",alpha=0.5)+ggtitle("CPI")+labs(y="number",x="CPI")

###########


####  
library(tidyverse)
install.packages("ggthemes")
library(ggthemes)

emp <- read.csv("D:/ONLINE COURSES/Udemy/R/employee-data1.csv", skip = 23, stringsAsFactors = FALSE)
emp <- as.tibble(emp)
emp$gender <- as.factor(emp$gender)
emp$title <- as.factor(emp$title)
emp
emp.a <- filter(emp, "salary" > 45000)

hist <- ggplot(emp.a, aes(x=salary))
hist + geom_histogram(binwidth = 5000, color = "darkslategray",
                      fill = "darkseagreen2", alpha = 0.7) +
  labs(title = "Salary distribution in the employee data",
       x = "Salary", y = "Number of employees in the salary bracket") +
  theme_solarized_2(light = FALSE, base_size = 15, base_family = "serif")


####
library(tidyverse)
library(ggthemes)

bar <- ggplot(emp, aes(title, fill = gender))
bar + geom_bar() + theme_fivethirtyeight() + scale_fill_manual(values = c("chartreuse4", "darkorange")) +
  labs(title = "Job Positions by Gender",
       y = "Employee count",
       x = "Job position")

# theme_fivethirtyeight() does not allow us to name the x- and y-axis; you can change it to one that works
# trying to pass the legend.position= argument into any available theme won't work; if you want to customise 
# your theme beyong font type and size, you would need to create a theme for yourself with the theme() function;
# it takes an abundance of arguments allowing you to modify virtually every aspect of your visualisation

bar <- ggplot(emp, aes(gender, fill = title)) 
bar + geom_bar() + theme_fivethirtyeight() + scale_fill_manual(values = c("magenta", "darkorange", "midnightblue",
                                                                          "springgreen4", "brown1", "gold")) +
  labs(title = "Job Positions by Gender")

# The aes(x = gender, fill = title) mapping is a lot more difficult to read;
# the only thing it makes relatively easy for me to see is that the data is too symmetrially distributed, which
# suggests it has indeed been artifically generated (shocker!)

# look up scale_fill_manual, and scale_color_manual functions
# Can you set title and x and y axis names? Why? Try using a different theme. Can you do it now? 
# What happens if you try to set the theme() argument legend.position = "right". Why do you think that is? 
# Change the mappings so that gender is plotted and the bars are filled with position segmentation. 
# Do you find this graph useful and easy to read? 
# Perhaps the only thing it convinces us in is that the data has been simulated. 


library(tidyverse)
library(ggthemes)
install.packages("wesanderson")
library(wesanderson)

emp <- read.csv("D:/ONLINE COURSES/Udemy/R/employee_data.csv", skip = 23, stringsAsFactors = FALSE)
emp <- as.tibble(emp)
emp$gender <- as.factor(emp$gender)
emp$title <- as.factor(emp$title)

emp.a <- filter(emp, "salary" > 45000)

boxx <- ggplot(emp, aes(x = title, y = salary))
my.bp <- boxx + geom_boxplot(outlier.color = "orangered1", outlier.shape = 3) +
  geom_jitter(width = 0.3, aes(color = gender)) +
  ggtitle("Salary distribution", subtitle = "based on position and gender") +
  ylab("Salary") + xlab("Job position") + 
  theme_economist_white() + 
  theme(legend.position = "right", axis.text.x = element_text(angle = 90, hjust = 1)) +
  coord_flip() # this can be added if the axis.text.x doesn't make sense to you; it's also easier to read

my.bp + scale_color_manual(values=wes_palette(name = "Darjeeling", n = 2))

# or

my.bp + scale_color_brewer(palette="Set1")

# the palette is part of the RColorBrewer package which you should already have on your
# machines because it comes with the tidyverse