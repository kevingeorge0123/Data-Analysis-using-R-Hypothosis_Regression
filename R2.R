args(sample)
args(median)

# alternatively, you can call HELP!! on it and look at the arguments section

?sample
?median
# or like this 
help(sample)
help(median)

median(na.rm = TRUE, x = lvl) # note that I have not followed R's inherent order here
median(lvl)

median(atk, na.rm = TRUE)
median(atk)
sample

flip<-function(){
  coin<-c('H','T')
  throw<-sample(coin,size=10,replace= TRUE)
  print(throw) 
}
flip()
