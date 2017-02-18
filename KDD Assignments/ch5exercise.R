#Exercise For Chapter 5
#Name:Raka Choudhury
#UNCC Id:800960315

#The help() function provides access to the documentation pages for R functions,data sets etc.
help("t.test")

#c() allows to enter data manually to a vector
training = c(18,22,21,17,20,17,23,20,22,21)
test = c(16,20,14,21,20,18,13,15,17,21)

#The plots show similar overall ditribution for both training and test dataset
#Both datasets have 10 values each.Highest density for training dataset(around 0.15) is higher compared to that of test dataset(around 0.08)
#par can be used to set or query graphical parameters
#set figure so next two plots appear side-by-side
par(mfrow=c(1,2))               # set graphics window to plot side by side
#plot is a generic function for plotting of objects
#density plots[plot(density(x)) where x is a numeric vector] - To view the distribution of a variable
#1st plot is for the training dataset and 2nd plot is for test dataset
plot(density(training), main="training")
plot(density(test), main="test")

#boxplots are made.For training dataset, mean Scores on Digit Span Task 
#is higher(20.1 -> between 20 and 22) compared to that of test dataset(17.5 -> between 16 and 18)
#par can be used to set or query graphical parameters
# plot and label y-axis
# group names on x-axis
# main title
boxplot(training, test, ylab = "Scores on Digit Span Task",names = c("training","test"),main = "Digit Span Performance by Training Test Status")  

#standard numerical summaries 
#For training dataset,mean is higher(20.1) compared to that of test dataset(17.5)
#But standard deviation for both test and training datasets are equal(2.13177) 
#mean() and sd() are directly available functions for calculating mean and standad deviation
mean(training)
#20.1
sd(training)
#2.13177
mean(test)
#17.5
sd(test)
#2.13177

#Standard Errors:
#Getting standard error values
sqrt(var(training)/length(training))     # assumes no missing values
#0.6741249
sqrt(var(test)/length(test))             # ditto
#0.9339284

#If p value is less than 0.05 - variable is significant.Here p-value is less than 0.05.
#Hypothesis is not true.Here T-value is greater than 0.
#According to t-test,the value of t differs from 0 by an amount which has 
#probability less than 0.05 of being attained if that hypothesis were true.
#Therefore the result is evidence of some strength that the hypotesis is not true,and the mean is different.
#data:  training and test
#t = 2.2573, df = 16.376, p-value = 0.03798
#alternative hypothesis: true difference in means is not equal to 0
#95 percent confidence interval:
#0.1628205 5.0371795
#sample estimates:
#mean of x mean of y 
#20.1      17.5 
#mean values are different but this difference may or may not mean much.T test is useful in such scenarios.
t.test(training, test)

t.test(training, test, alternative="greater", var.equal=T)
#95 percent confidence interval:
# 0.6026879       Inf

#Here we can specify values for conf.level to vary the confidence interval(in %)
t.test(training, test, alternative="greater", var.equal=T,conf.level=.8)
#80 percent confidence interval:
# 1.607084      Inf

scores = c(training, test)   #combine data sets
groups = c("training","test")#Make sure these are in the right order!
groups = rep(groups, times=c(10,10))      # 10 training, 10 test
mj.data = data.frame(groups, scores)
mj.data

#This is very useful as it can be used for clearing up unnecessary values.
#Remove objects no longer needed. 
#useful for Clean up
#rm can be used to remove objects. 
#Specified objects will get removed
rm(scores, groups)                        
attach(mj.data)

by(scores, groups, mean)                  # or tapply(scores,groups,mean)
#groups: test
#[1] 17.5
#groups: training
#[1] 20.1

by(scores, groups, sd)
#groups: test
#[1] 2.953341
#groups: training
#[1] 2.13177

#boxplot function also accepts a formula interface
boxplot(scores ~ groups)                  

t.test(scores ~ groups)

detach(mj.data)
t.test(scores ~ groups, data=mj.data)  
#t = -2.2573, df = 16.376, p-value = 0.03798
#95 percent confidence interval:
#-5.0371795 -0.1628205

wilcox.test(training, test)     
# W = 76.5, p-value = 0.04715
