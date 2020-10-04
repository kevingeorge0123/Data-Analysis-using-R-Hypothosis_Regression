((-2:2) >= 0) & ((-2:2) <= 0)
# FALSE FALSE  TRUE FALSE FALSE

# Double operators (||, &&) return a single value
((-2:2) >= 0) && ((-2:2) <= 0)

##if
x <- 101

if((x >= 1) & (x < 60)){
  print("Rotten!")
} else if((x >= 60) & (x < 75)){
  print("Fresh")
} else if((x >= 75) & (x <= 100)){
  print("Certified Fresh!")
} else {
  print("Please input a number between 1 and 100")
}
##
a<-vector(length=5)
a

n <- 10
sum <- 0

for(i in 1:n){
  sum <- sum + i
  print(sum)
} 
##
n <- 10
i <- 1
sum <- 0

while(i <= n){
  sum <- sum + i
  i <- i + 1
  print(sum)
}

sample(1:23,23,T)
##
coup <- matrix(rep(c("Duke", "Assassin", "Captain", "Ambassador", "Contessa"), 3), ncol = 1)

cit <- matrix(c("Magistrate", "Thief", "Wizard", "Patrician", "Bishop", "Trader", "Architect", "Marshal",
                "Queen", "Witch", "Blackmailer", "Magician", "Emperor", "Abbot", "Alchemist", "Warlord",
                "Tax Collector", "Spy", "Seer", "Merchant", "Scholar", "Diplomant", "Artist"), ncol=1)
###

f <- function(x) {
  f <- function(x) {
    f <- function(x) {
      x ^ 2
    }
    f(x) + 1
  }
  f(x) * 2
}

f(10)
f(1)
