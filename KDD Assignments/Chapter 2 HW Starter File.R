#Name:Raka Choudhury, ID:800960315
#Name:Gandhi Amarnadh,ID: 800954124
#
#Answer questions in comments that are listed starting with (A)
#numbered questions have the answer provided in R code
#Place your Answer to (A) etc. within a comment
#You first need to import dataset churn.txt stringsAsFactors = FALSE
#(A) What kinds of files can R work with?
# text, csv, xml, xlsx, sql, sqlite
churn <- read.csv(file="C:/Users/gandh/Documents/CS/sem2/kdd/churn.txt", stringsAsFactors = FALSE)
#33 Explore whether there are missing values for any of the variables
#one way to do this is with sapply
#(B) What is sapply?
#sapply can be a useful function to explore the part of/entire dataset
#and to apply common function to the selected set.
#(C) Are there missing values for any of the variables?
#No
sapply(churn, function(x) sum(is.na(x)))
#multiple ways to do this
churn[!complete.cases(churn),]
#
#lets look at cars to see incomplete data
#read file, replace a few variables with NA and run commands
#you may  need to change the location of cars.txt
cars <- read.csv(file="C:/Users/gandh/Documents/CS/sem2/kdd/cars.txt", stringsAsFactors = FALSE)
cars[2,2] <-cars[4,4] <- NA
#(D) Using the commands above for the missing value determination
#(D) describe the output and determine where the missing values are
sapply(cars, function(x) sum(is.na(x)))
#8,125
#34 compare the area code and state fields
churn $State
churn $Area.Code
#note length is count in R
#library necessary for count function
library(plyr)
#table command for contingency table
table(churn$State,churn$Area.Code)
#count gives you n way frequency for pairs
count(churn,vars = c("State","Area.Code"))
#
#another method
statetable <- table(churn$State); statetable
cat("Number of states represented: ", length(statetable))
areacode <- table(churn$Area.Code); areacode
cat("Number of area codes represented: ", length(areacode))
#(E) What did you find when you compare area code to State?
#There are 3 area codes and 51 states represented.
#(E) is the data realistic?  Do you need to look up the area codes for states
#(E) in order to effectively answer the question?
#No, it seems there is many to many relationship between states and area codes.
#35 use a graph to show outliers among number of calls to customer service
# Simple Dotplot note cex controls size of labels
# note outliers 7 and 8 plus beyond
dotchart(churn$CustServ.Calls,labels=row.names(churn$CustServ.Calls),cex=.7, main="Title")
#
#(F) look up dotchart in Help and describe some of the parameters
#xlabel/ylabel: label on axes, cex: character size, main: plot label,
#groups - An optional factor indicating how the elements of x are being grouped. 
#If x is a matrix, groups will be default to the columns of x.
#35 another method 
# Q-Q Plot for variable Cust Service Calls
#(G) look up QQ plot in Help and describe some of the parameters
# x first sample, y second data sample, xlab/ylab plot labels, qtype: type of computation
attach(churn)
qqnorm(CustServ.Calls)
qqline(CustServ.Calls)
#
#(H) are there deviations from normality?
#yes, there are deviations
#36 use z score method to identify outliers and the Inter Quartile Range Method
# helpful link http://stats.seandolinar.com/calculating-z-scores-with-r/
#z score
#DATA LOAD
#(I) what is the next command doing?
#assigining custServ.calls to vector custservicecalls
# hist command plots histogram of no.of calls and  the frequency 
#pop_sd vector taking the standard deviation value
#pop_mean vector taking the mean of the column
custservicecalls <- churn$CustServ.Calls
hist(custservicecalls) #histogram
#POPULATION PARAMETER CALCULATIONS
pop_sd <- sd(custservicecalls)*sqrt((length(custservicecalls)-1)/(length(custservicecalls)))
pop_mean <- mean(custservicecalls)
pop_sd
pop_mean
zscore.custservicecalls <- (churn$CustServ.Calls - pop_mean) / pop_sd
hist(zscore.custservicecalls, breaks=11,xlim=c(-5,5), main="histogram of Z-score",
     xlab="Z score of cust service call",ylab="Counts")
box(which = "plot", lty="solid", col="black")
# show the lower range outliers
zscore.custservicecalls[zscore.custservicecalls < -3]
# show the upper range outliers
zscore.custservicecalls[zscore.custservicecalls > 3]
#(J) lower range outliers : numeric(0) and upper range outliers: [1] 4.133787 4.133787 5.654360 3.373500 3.373500 3.373500 4.133787 3.373500 3.373500
#[10] 3.373500 3.373500 3.373500 3.373500 4.894073 3.373500 4.133787 4.133787 4.133787
#[19] 4.894073 3.373500 3.373500 3.373500 5.654360 3.373500 3.373500 3.373500 3.373500
#[28] 4.133787 3.373500 3.373500 4.133787 3.373500 3.373500 4.133787 3.373500
# IQR
summary(churn$CustServ.Calls) #shows quantiles
#  Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#0.000   1.000   1.000   1.563   2.000   9.000 
quantile(custservicecalls)
intquar = IQR(custservicecalls); intquar
# set variables for lower and upper
#ranges of iqr
lowerquar <- 1 - 1.5; lowerquar
upperquar <- 2 + 1.5; upperquar
#(K) what does the next commend (cat) do?
# cat is log/printing statement and its logging lowerquar and upperquar data 
cat("IQR is ", lowerquar, " up to ", upperquar)
IQR(custservicecalls)

#
#37 transform the day minutes attribute using Z-score standardization
pop_sd_daymin <- sd(churn$Day.Mins)*sqrt((length(churn$Day.Mins)-1)/(length(churn$Day.Mins)))
pop_mean_daymin <- mean(churn$Day.Mins)
pop_sd_daymin
pop_mean_daymin
zscore.daymin <- (churn$Day.Mins - pop_mean_daymin) / pop_sd_daymin
hist(zscore.daymin, breaks=11,xlim=c(-5,5), main="histogram of Z-score",
     xlab="Z score of day mins",ylab="Counts")
box(which = "plot", lty="solid", col="black")
# IQR
summary(churn$CustServ.Calls)
quantile(churn$CustServ.Calls)
#
#(K) comment on the results of the z score standardization
zscore.daymin[zscore.daymin < -3]
#LOWER OUTLIER: [1] -3.071566 -3.301096 -3.301096 -3.156033 -3.253354 -3.157869
zscore.daymin[zscore.daymin > 3]
#uPPER OUTLIER: 3.140422 3.066972 3.039429
#38 Work with Skewness
#
#a calculate skewness of day minutes
dayminutes_skew <- (3*(mean(churn$Day.Mins)-median(churn$Day.Mins))) / sd(churn$Day.Mins)
dayminutes_skew

#(L) are day minutes skewed significantly?
#no
#b calculate skewness of z score standardized day minutes and comment
zscore.daymin_skew <- (3*(mean(zscore.daymin)-median(zscore.daymin)))/sd(zscore.daymin)
zscore_dayminutes_skew <- (3*(mean(zscore.daymin)-median(zscore.daymin))) / sd(zscore.daymin)
zscore_dayminutes_skew
zscore_dayminutes_skew
#(M) are zscore dayminutes skewed significantly?  why or why not?
#NO.the skewness is almost zero
#39 construct a normal probability plot of day minutes and comment on the normality
#(N) what does the next command do?  Why do we need to require graphics?
#the next command is used for loading package graphics so that functions from graphics package can be used, require returns True/false if the package is loaded or not
require(graphics)
#note ylim based on min and max of invsqrt_daymin
invsqrt_daymin <- 1/sqrt(churn$Day.Mins)
par(mfrow = c(1,1))
qqnorm(invsqrt_daymin,
       datax = TRUE,
       col = "red",
       ylim = c(0.04, 0.15),
       main = "Normal Q-Q Plot of Inverse
       Square root of Day Minutes")
qqline(invsqrt_daymin,
       col = "blue",
       datax = TRUE)
#(N) is the data normally distributed?
# No there are deviations
#40 work with international minutes
#a normal probability plot
invsqrt_intlmin <- 1/sqrt(churn$Intl.Mins)
par(mfrow = c(1,1))
qqnorm(invsqrt_intlmin,
       datax = TRUE,
       col = "red",
       ylim = c(0.20, .50),
       main = "Normal Q-Q Plot of Inverse
       Square root of Intl Minutes")
qqline(invsqrt_intlmin,
       col = "blue",
       datax = TRUE)
#(O) is the data normally distributed?'
#NO
#(O) if no, what is stopping the variable from being normally distributed?
#The left and right extremities of variable data is stopping it from being normalized.

#c construct a flag variable
#flag variable would be 0 or 1 depending on if int minutes is 0 or gt 0
churn["IntlMinutes"] <- 0
churn$IntlMinutes <- churn$Intl.Mins > 0
churn$IntlMinutes

#d construct a normal probability plot of the derived variable nonzero international
# minutes and comment on the normality
hasintMins <- subset(churn, IntlMinutes == TRUE)$Intl.Mins
qqnorm(hasintMins, datax = TRUE, col="blue")
qqline(hasintMins, col="red", datax=TRUE)
#
#41 Transform the night minutes attribute using Z score standardization and using a graph
# (P) comment on the range of the standardized values
#op_sd_nightmin [1] 50.56626
#pop_mean_nightmin [1] 200.872
pop_sd_nightmin <- sd(churn$Night.Mins)*sqrt((length(churn$Night.Mins)-1)/(length(churn$Night.Mins)))
pop_mean_nightmin <- mean(churn$Night.Mins)
pop_sd_nightmin
pop_mean_nightmin
zscore.nightmin <- (churn$Night.Mins - pop_mean_nightmin) / pop_sd_nightmin
hist(zscore.nightmin, breaks=11,xlim=c(-5,5), main="histogram of Z-score",
     xlab="Z score of night mins",ylab="Counts")
box(which = "plot", lty="solid", col="black")
#(Q) comment on other steps necessary to take with this
#(Q) data in order to complete preprocessing (based on chapter 2)
#summary, quantile, identification of lower outlier and upper outlier,min-max normalization,z-score standardization etc. have been used.
#handling missing data, removal of duplicate records,removal of unimportant variables,usage of flag variables 
#are some methods that can still be applied to this data.
