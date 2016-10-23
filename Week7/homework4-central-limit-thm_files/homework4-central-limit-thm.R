# Write bootstrap code to illustrate the Central Limit Theorem in R markdown and push result to GitHub.
# Use a normal distribution with two different sample sizes and an exponential distribution with two different sample sizes. 
# Correct code alone is insufficient. Please also comment the code and explain the results. 
# For help, see the lotsa.medians function in Unit 4, simple normal example in 6.10. 
# The deliverable is a link to a GitHub repo containing the code. 

# the mean of 1,000 random samples from exponential distributions of size 10 
n <-10
nsim <- 1000 
lotsa.means <- numeric(nsim) 

# loop through 1000 times and collect the mean of 10-mean exp distributions 
for (i in 1:nsim){ 
  x <- rnorm(n) 
  lotsa.means[i] <- mean(x) 
  } 
length(lotsa.means) 

# total number of means 
summary(lotsa.means) 
# five number summary 
hist(lotsa.means) # plot histogram for vector of means 

# the mean of 1,000 random samples from exponential distributions of size 100
n <-100
nsim <- 1000 
lotsa.means <- numeric(nsim) 

# loop through 1000 times and collect the mean of 10-mean exp distributions 
for (i in 1:nsim){ 
  x <- rnorm(n) 
  lotsa.means[i] <- mean(x) 
} 
length(lotsa.means) 

# total number of means 
summary(lotsa.means) 
# five number summary 
hist(lotsa.means) # plot histogram for vector of means 



# the mean of 1,000 random samples from exponential distributions of size 100
n <-100
nsim <- 1000 
lotsa.means <- numeric(nsim) 

# loop through 1000 times and collect the mean of 10-mean exp distributions 
for (i in 1:nsim){ 
  x <- rexp(n) 
  lotsa.means[i] <- mean(x) 
} 
length(lotsa.means) 

# total number of means 
summary(lotsa.means) 
# five number summary 
hist(lotsa.means) # plot histogram for vector of means 

# the mean of 1,000 random samples from exponential distributions of size 50 
n <-50 
nsim <- 1000 
lotsa.means <- numeric(nsim) 
# loop through 1000 times and collect the mean of 50-mean exp distributions 
for (i in 1:nsim){ 
  x <- rexp(n) 
  lotsa.means[i] <- mean(x) 
} 
length(lotsa.means) 

# total number of means 
summary(lotsa.means) 
# five number summary for vector of means 
hist(lotsa.means) 
# plot histogram for vector of means observations: 
# means of both distributions is just about same, but the ranges of 
#50-mean distributions are narrower (0.6-1.4) vs (0.5 -2.0)