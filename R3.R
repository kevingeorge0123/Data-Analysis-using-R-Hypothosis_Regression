args(sample)
flip <- function(){
  coin <- c("heads", "tails")
  toss <- sample(coin, 100, replace = TRUE, prob = c(0.3, 0.6))
  return(toss)
}

flip()

weight <- c(71, 67, 83, 67)
height <- c(1.75, 1.81, 1.78, 1.82, 1.97, 2.12, 2.75)

bmi <- weight/height^2
bmi

#attributes
cards <- c("Blue-Eyes White Dragon", "Exodius", "The Winged Dragon of Ra", "Raigeki", 
           "Slifer the Sky Dragon", "Obelisk the Tormentor", "Black Luster Soldier", 
           "5-Headed Dragon", "Exodia the Forbidden One", "Dragon Master Knight")
atk <- c(3000, NA, NA, NA, NA, 4000, 3000, 5000, 1000, 5000)

names(atk) <- cards
attributes(atk)
names(atk)
atk

names(atk) <- NULL
print(atk)


atk

atk[6]
atk["Obelisk the Tormentor"]
atk[-2]
atk[c(1, 3, 5, 7, 9)]

atk[-(4:6)]
atk[atk > 2000] 


s <- seq(from = 2, to = 30, by = 2)
attributes(s)

dim(s) <- c(3, 5)
s

# [,1] [,2] [,3] [,4] [,5]
# [1,]    2    8   14   20   26
# [2,]    4   10   16   22   28
# [3,]    6   12   18   24   30

dim(s) <- c(1, 3, 5)
s