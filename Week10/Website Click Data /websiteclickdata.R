# https://rpubs.com/tmcfl/simulated-click-analysis
# https://www.r-bloggers.com/using-apply-sapply-lapply-in-r/
#main packages in my opinion: dplyr,tidyr,ggplot2,
#caret(for machine learning),RCurl(web scraping),jsonlite,rmysql(sql connection),
# scales(for visualization),parallel(for parallelization of code),
#htmltools,knitr,markdown,stringr,quantmod(financial analysis),tseries	
  
fileLocation <- "http://stat.columbia.edu/~rachel/datasets/nyt1.csv"
data1 <- read.csv(url(fileLocation))

# Use the section below if you would rather import the data from a local file
# fileLocation <- "~/path/for/the/file/nyt10.csv"
# data1 <- read.csv("fileLocation")

head(data1)
str(data1) # str stands for 'structure'
summary(data1)

# distribution of the Age column
hist(data1$Age, main="", xlab="Age")
range(data1$Age)

# distribution of the Impressions column
hist(data1$Impressions, main="Distribution of the Impressions", xlab="# of Impressions")

range(data1$Impressions)

# distribution of the Clicks column
hist(data1$Clicks, main="", xlab="# of Clicks")

range(data1$Clicks)

data1$Age_Group <- cut(data1$Age, c(-Inf, 18, 24, 34, 44, 54, 64, Inf))
levels(data1$Age_Group) <- c("<18", "18-24", "25-34", "35-44", "45-54", "55-64", "65+")
# Name the levels of 'Age_Group' for readability
head(data1)

ImpSub <- subset(data1, Impressions>0)

ImpSub$CTR <- ImpSub$Clicks/ImpSub$Impressions
head(ImpSub)

library(ggplot2) # used for visualizations
ggplot(subset(ImpSub, Impressions>0), aes(x=Impressions, fill=Age_Group)) +
  geom_histogram(binwidth=1)

ggplot(subset(ImpSub, CTR>0), aes(x=CTR, fill=Age_Group)) +
  labs(title="Click-through rate by age group - for a Single Day") +
  geom_histogram(binwidth=.025)

# Define a new variable to segment users based on click -through- rate (CTR) behavior.
# CTR< 0.2, 0.2<=CTR <0.4, 0.4<= CTR<0.6, 0.6<=CTR<0.8, CTR>0.8
ImpSub$CTRSeg <- cut(ImpSub$CTR, c(-Inf, 0.2, 0.4, 0.6, 0.8, Inf))
levels(ImpSub$CTRSeg) <- c("0.0-0.2", "0.2-0.4", "0.4-0.6", "0.6-0.8", "0.8-0.1")
head(ImpSub)

# Get the total number of Male, Impressions, Clicks and Signed_In (0=Female, 1=Male)
ImpSubMale <- subset(ImpSub, ImpSub$Gender==1)
sapply(ImpSubMale[, 2:5], sum)

# Get the mean of Age, Impressions, Clicks, CTR and percentage of males and signed_In
sapply(ImpSub[,c(1,3,4,7)], mean) # mean of Age, Impressions, Clicks, CTR

pcntMales <- length(ImpSubMale$Gender)/length(ImpSub$Gender) # calculate percentage of Males
pcntMales # print percentage of Males

ImpSubSignedIn <- subset(ImpSub, ImpSub$Signed_In==1)
pcntSignedIn <- length(ImpSubSignedIn$Signed_In)/length(ImpSub$Signed_In)
pcntSignedIn

summarise(ImpSub, mean(Age), mean(Impressions), mean(Clicks), mean(CTR), pcntMales, pcntSignedIn)

# Get the means of Impressions, Clicks, CTR and percentage of males and signed_In  by AgeGroup.
dataVByAgeGroup <- ImpSub %>% 
  group_by(Age_Group) %>% 
  summarise(Impressions=mean(Impressions), CTR=mean(CTR), Clicks=mean(Clicks), 
            pctSigned=sum(Signed_In==1)/length(Age_Group),
            pctMales=sum(Gender==1)/length(Age_Group))

dataVByAgeGroup

# Create a table of CTRGroup vs AgeGroup counts.
countAgeGroup <- as.data.table(ddply(ImpSub, .(Age_Group), nrow))
names(countAgeGroup)[2] <- "countAgeGroup"
countAgeGroup

countCTRGroup <- as.data.table(ddply(ImpSub, .(CTRSeg), nrow))
names(countCTRGroup)[2] <- "countCTRGroup"
countCTRGroup

mergeCounts <- rbind(countCTRGroup, countAgeGroup, fill=TRUE)
mergeCounts

# Histogram of Clicks by Age
ggplot(subset(ImpSub, Age>0), aes(x=Age, fill=Age_Group)) +
  labs(title="Clicks by Age - for a Single Day") +
  geom_histogram(binwidth=0.5)
