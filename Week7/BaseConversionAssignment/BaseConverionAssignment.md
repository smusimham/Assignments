# BaseConversionAssignment
Ramesh Simhambhatla  
October 22, 2016  

# Introduction
#### Following functions written for live session assignment 07.
#### Each function has specific requirement as illustrated by respective problem statement at the beginning of each function

### Note
* All functions were intentionally not checked for negative scalars, and are tested for positive scalar inputs only.
* operator %/% will provide the 'quotient' of 2 operands. Example: 10 %/% 3 = 3
* operator %% will provide the 'remainder' of 2 operands.Example: 10 %% 3 = 1

## Section1

#### Question 2. Write a function base10to7 to covert base 10 to base 7 takes argument x
#### Question 2 is answered first as Question 1 uses the function base10to7, and this needs to be
#### executed first inorder to use it.


```r
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
```
#### Test base10to7 function

```r
base10to7(100)
```

```
## [1] 202
```

#### Question 3. Write a function base7to10 to covert base 7 to base 10 takes argument y


```r
base7to10 <-function(y){
  i=0   #initialize iterator to 0
  sum=0 #intialize return value to 0
  
  # for the input y, loop through until y "quotient" is logically parsed
  while(y%/%10!=0){
    sum<-sum+((y%%10)*(7^i)) # find the cumulative value for current quotient's remaider
    i=i+1
    y<-y%/%10 #reset x with remaining 'remainder' value
  }
  sum<-sum+((y%%10)*(7^i)) # calculate final cumulative value 
  return(sum) #return converted value
}
```

#### Test base7to10 function

```r
base7to10(202)
```

```
## [1] 100
```

#### Question 1. Wite a function (p7) that will will print first n numbers of base 7


```r
p7 <-function(x){
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
```

#### Test getbase7nos function

```r
p7(5)
```

```
## [1] 0 1 2 3 4
```

```r
p7(15)
```

```
##  [1]  0  1  2  3  4  5  6 10 11 12 13 14 15 16 20
```

```r
p7(52)
```

```
##  [1]   0   1   2   3   4   5   6  10  11  12  13  14  15  16  20  21  22
## [18]  23  24  25  26  30  31  32  33  34  35  36  40  41  42  43  44  45
## [35]  46  50  51  52  53  54  55  56  60  61  62  63  64  65  66 100 101
## [52] 102
```

##Section2: Convert previous functions to be generic                                    

###Note
#### This section not extensively commented for each statement as most of the logic is
#### is same as Section1, and the reader can refer back

#### Question4: Following functions provide base conversions for generic scalars (k=2,3,4...)


```r
# The function takes x as an input, and any base (default base=10)
base10toAny<-function(x, baseAny=10){
  i=0   
  sum=0 
  
  while(x%/%baseAny!=0){
    sum<-sum+((x%%baseAny)*(10^i))
    i=i+1
    x<-x%/%baseAny
  }
  sum<-sum+((x%%baseAny)*(10^i))
  return(sum)
}
```
#### Test base10toAny function


```r
base10toAny(100,7)
```

```
## [1] 202
```

```r
base10toAny(100,2)
```

```
## [1] 1100100
```

```r
base10toAny(100,5)
```

```
## [1] 400
```


```r
# The function takes y as an input, and any base (default base=10)
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
```
#### Test baseAnyto10 function


```r
baseAnyto10(202,7)
```

```
## [1] 100
```


```r
# funtion to print first n numbers of any base (defalt base=10)
pAny <-function(x, baseAny=10){
  i=0
  y=0
  
  repeat{
   
    y[i] <- base10toAny(x, baseAny)
  
    x=x-1
    i=i+1
    
    if (x<0) break
  }
  
  # sort the vector by ascending order for printing
  return(sort(y, decreasing = FALSE))
}
```

#### Test pAny function

```r
pAny(15,7)
```

```
##  [1]  0  1  2  3  4  5  6 10 11 12 13 14 15 16 20
```

```r
pAny(15,2)
```

```
##  [1]    0    1   10   11  100  101  110  111 1000 1001 1010 1011 1100 1101
## [15] 1110
```

```r
pAny(15,5)
```

```
##  [1]  0  1  2  3  4 10 11 12 13 14 20 21 22 23 24
```
####  *** End of File ***
