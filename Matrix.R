mtrx<-matrix(1:12,nrow=3)
mtrx
mtrx<-matrix(1:12,nrow=3,byrow=TRUE)
mtrx
?matrix

player <- c(rep("dark", 5), rep("light", 5))

# the rep() function repeats a value the stated number of times
# use ?rep for more information

piece <- c("king", "queen", "pawn", "pawn", "knight", "bishop", "king", "rook", "pawn", "pawn")
chess <- c(player, piece)
chess

dim(chess) <- c(10, 2)
colnames(chess) <- c("Player", "Piece")

# or

chess.mat <- matrix(chess, nrow = 10, dimnames = list(NULL, c("Player", "Piece"))) 
chess.mat
# byrow = FALSE is the default value which is what we need here
# because we've defined nrow = 10, R will infer that ncol = 2
# setting the first argument of dimnames to NULL tells R we won't be setting row names

chess.bind <- cbind("Player" = player, "Piece" = piece)
chess.bind
chess.bind1 <- rbind("Player" = player, "Piece" = piece)
chess.bind1

#####
chess.t <- t(chess)
turn <- c(3, 5, 2, 2, 7, 4, 6, 5, 2, 1)

chess.t <- rbind(chess.t, "Turn" = turn)
chess <- t(chess.t)

chess[6, 2]
chess[, 1:2]
# or
chess[, -3]
# or
chess[, c("Player", "Piece")]
chess[1:5, ]
chess[, 2, drop = FALSE]
chess[, -2]
chess[2, c(1, 3)]
chess[7, 3] <- 3
chess[7, 3]
##
runif(3)
my.mat <- matrix(runif(12), nrow = 3, byrow = TRUE, dimnames = list(c("x", "y", "z"),
                                                                    c("uno", "dos", "tres", "cuatro")))
my.mat <- my.mat*10
s.mat <- my.mat[1:2, ]
s.mat
my.mat - s.mat

m.mat <- my.mat[ , -4]

my.mat - m.mat

uno <- my.mat[, "uno"]

my.mat - uno

# you can only do matrix operations with two matrices when they are of the same size
# R's recycling rules apply when you try to do an operation with a matrix and a vector

new.mat <- matrix(rnorm(12), nrow = 3, byrow = TRUE)
my.mat * new.mat


#######
rnorm(5)
n <- matrix(rnorm(25), nrow = 5, byrow = TRUE)
u <- matrix(runif(25), nrow = 5, byrow = TRUE)

avg.n <- colMeans(n)
avg.u <- colMeans(u)

total.n <- colSums(n)
total.u <- colSums(u)

n.avg.total <- rbind(n, avg.n, total.n)
u.avg.total <- rbind(u, avg.u, total.u)

r.avg.n <- rowMeans(n.avg.total)
r.avg.u <- rowMeans(u.avg.total)

r.total.n <- rowSums(n.avg.total)
r.total.u <- rowSums(u.avg.total)

n.avg.total <- cbind(n.avg.total, r.avg.n, r.total.n)
u.avg.total <- cbind(u.avg.total, r.avg.u, r.total.u)


min(n)
min(u)

max(n)
max(u)

min(n[, 3])
min(u[, 3])

max(n[, 3])
max(u[, 3])

#Creating a factor in R_solution.R
piece <- chess[, "Piece"]

piece <- factor(piece, levels = c("king", "queen", "rook", "bishop", "knight", "pawn"),
                labels = c("King", "Queen", "Rook", "Bishop", "Knight", "Pawn"))

levels(piece) <- c("K", "Q", "R", "B", "K", "P")
str(piece)

piece.ordered <- factor(piece, ordered = TRUE, levels = c("K", "Q", "R", "B", "K", "P"),
                        labels = c("King", "Queen", "Rook", "Bishop", "Knight", "Pawn"))
piece.ordered

###
newList <- list(seq(1, 11, by = 2), list("Happy Birthday", "Archery"))
newList
str(newList)

# extract the numbers as a vector
newList[[1]]
newList[1]
# extract the phrase Happy Birthday as a vector
newList[[2]][[1]]

# extract the second item of the second list as a list
newList[[2]][2]
newList[[2]][[2]]
# extract the second list as a list
newList[[2]]

# extract the numbers item as a list
newList[1]

# add 2 to each element in the numbers item
newList[[1]] <- newList[[1]] + 2
newList[[1]]

# name the items in the list as "Numbers" and "Phrases"
names(newList) <- c("Numbers", "Phrases")
newList

# you can use the $ to extract named items of a list
# if you extract the numbers item from newList with the $, what other extraction method is this equivalent to?
newList$Numbers
newList[[1]]

# use the dollar sign to repeat the addition from above (add 2 to each element in the numbers list)
newList$Numbers <- newList$Numbers + 2
newList$Numbers

# add a new item called "Brands" to the list. It should contain the brands Kellogs, Nike, iPhone
# use either brackets or the dollar sign to do that
newList$Brands <- c("Kellogs", "Nike", "iPhone")
str(newList)
# or 
newList[[3]] <- c("Kellogs", "Nike", "iPhone")
names(newList)[[3]] <- "Brands"
newList

# remove the iPhone from the Brands item
newList[[3]] <- newList[[3]][-3]
# or
newList$Brands <- newList$Brands[-3]
newList

# remove the Brands item from the list
newList$Brands <- NULL
# or
newList[[3]] <- NULL
newList
