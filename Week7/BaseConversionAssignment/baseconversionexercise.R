# Introduction
## Following functions written for live session assignment 07
## Each function has specific requirement as illustrated by respective problem statement 
## at the beginning of each function

#########################################################################################
### Note
# All functions were intentionally not checked for negative scalars, and are tested for
# positive scalar inputs only.
# operator %/% will provide the 'quotient' of 2 operands. Example: 10 %/% 3 = 3
# operator %% will provide the 'remainder' of 2 operands.Example: 10 %% 3 = 1
#########################################################################################

#########################################################################################
#### Question 2. Write a function base10to7 to covert base 10 to base 7 takes argument x
#### Question 2 is answered as Question 1 uses the function base10to7, and this needs to be  
#### executedfirst inorder to use it.
#########################################################################################

base10to7<-function(x){
  i=0   #initialize iterator to 0
  sum=0 #intialize return value to 0
  
  # for the input x, loop through until x "quotient" is logically parsed
  while(x%/%7!=0){
    sum<-sum+((x%%7)*(10^i))   # find the cumulative value for current quotient's remaider
    i=i+1
    x<-x%/%7 #reset x with remaining 'remainder' value
  }
  sum<-sum+((x%%7)*(10^i)) # caluculate final cumulative value 
  return(sum) #return converted value
}

#########################################################################################
#### Question 3. Write a function base7to10 to covert base 7 to base 10 takes argument y
#########################################################################################

base7to10 <-function(y){
  i=0   #initialize iterator to 0
  sum=0 #intialize return value to 0
  
  # for the input y, loop through until y "quotient" is logically parsed
  while(y%/%10!=0){
    sum<-sum+((y%%10)*(7^i)) # find the cumulative value for current quotient's remaider
    i=i+1
    y<-y%/%10 #reset x with remaining 'remainder' value
  }
  sum<-sum+((y%%10)*(7^i)) # caluculate final cumulative value 
  return(sum) #return converted value
}

#########################################################################################
# 1. Wite a function (getbase7nos) that will will print first n numbers of base 7
#########################################################################################
getbase7nos <-function(x){
  i=0   #initialize iterator to 0
  y=0   #intialize vector to be used to collect numbers to 0
  
  # use repeat funtion until result all the iterations captured in vector y
  repeat{
    
    y[i] <- base10to7(x) # store the current base 7 value into vector y
    
    x=x-1 # decrement x by 1, to get previous base 7 value
    i=i+1
    
    if (x<0) break # exit repeat loop after x=0
  }
  
  # return the data in ascending order for printing the output values
  return(sort(y, decreasing = FALSE)) 
}


#########################################################################################
# Convert previous functions to be generic                                    
##########################################################################################

##########################################################################################
#### Question 4. Write a function base10to7 to covert base 10 to base 7 takes argument x
##########################################################################################

#### The function takes x as an input, and any base (default)
base10toAny<-function(x, baseAny=10){
  i=0   #initialize iterator to 0
  sum=0 #intialize return value to 0
  
  while(x%/%baseAny!=0){
    sum<-sum+((x%%baseAny)*(10^i))
    i=i+1
    x<-x%/%baseAny
  }
  sum<-sum+((x%%baseAny)*(10^i))
  return(sum)
}

#baseAnyto10
baseAnyto10 <-function(y, baseAny=10){
  i=0
  sum=0
  while(y%/%10!=0){
    sum<-sum+((y%%10)*(baseAny^i))
    i=i+1
    y<-y%/%10
  }
  sum<-sum+((y%%10)*(baseAny^i))
  return(sum)
}

# funtion to print first n numbers of base Any
getbaseAnynos <-function(x, baseAny=10){
  i=0
  y=0
  
  repeat{
   
    y[i] <- base10toAny(x, baseAny)
  
    x=x-1
    i=i+1
    
    if (x<0) break
  }
  
  return(sort(y, decreasing = FALSE))
}