#HW for Chapter 5 Part 2
#Name: Raka Choudhury
#UNCC Id: 800960315
#Sanjay Tiwari 800968058
#Gandhi amarnadh 800954124


                               # Question 2
#Table 5.10 contains information on the mean duration of customer service calls between a training
# and a test data set. Test whether the partition is valid for this variable,using alpha=0.10.
#TABLE 5.10 Summary statistics for duration of customer service calls
#Data set Sample Mean Sample Standard Deviation Sample Size
#Training set ??x1 = 20.5 s1 = 5.2 n1 = 2000
#Test set ??x2 = 20.4 s2 = 4.9 n2 = 600
#-----------------------------------------------------------------------------
#Code
xbar1 <- 20.5
xbar2 <- 20.4
s1 <- 5.2
s2 <- 4.9
n1 <- 2000
n2 <- 600
# Make the degrees of freedom the smaller of the two sample sizes
dfs <- min(n1-1, n2-1)
# Calculate test statistic
tdata <- (xbar1-xbar2) / sqrt((s1^2/n1)+(s2^2/n2))
# Find and display the p-value
pvalue <- 2*pt(tdata, df = dfs, lower.tail=FALSE)
tdata; pvalue

#Output
#[1] 0.4321896  #tvalue
#[1] 0.6657591  #pvalue

#Conclusion
#Partition seems valid.
#p-value(0.6657591)>t-value(0.4321896)
#Since the p-value is larger, there is no evidence that the mean duration of customer 
#service calls differs between the training data set and the test data set. 
#For this variable , the partition seems valid.
#--------------------------------------------------
#--------------------------------------------------

                                     # Question 4
#Table 5.11 contains the counts for the marital status variable for the training and test set
#data. Test whether the partition is valid for this variable, using alpha=0.10
#TABLE 5.11 Observed frequencies for marital status
#Data set Married Single Other Total
#Training set 800 750 450 2000
#Test set 240 250 110 600
#Total 1040 1000 560 2600
#-----------------------------------------------------------------------------
#Code
# Create Table 5.11
table5.11 <- as.table(rbind(c(800, 750, 450),
                           c(240, 250, 110)))
dimnames(table5.11) <- list(Data.Set =
                             c("Training Set", "Test Set"),
                           Status = c("Married", "Single", "Other"))
Xsq_data <- chisq.test(table5.11)
# Show the test statistic,
# p-value, expected frequencies
Xsq_data$statistic
Xsq_data$p.value
Xsq_data$expected

#Output
#Xsq_data$p.value [1] 0.05492505
#Xsq_data$expected
#Status
#Data.Set       Married   Single    Other
#Training Set     800 769.2308 430.7692
#Test Set         240 230.7692 129.2308

#Result
#p-value(0.05492505) is lesser than given alpha(0.10).
#Since the p-value is lesser, the partition seems invalid.
#--------------------------------------------------
#--------------------------------------------------

                                   # Question 5
#The multinomial variable payment preference takes the values credit card, debit card, and
#check. Now, suppose we know that 50% of the customers in our population prefer to pay
#by credit card, 20% prefer debit card, and 30% prefer to pay by check. We have taken a
#sample from our population, and would like to determine whether it is representative of
#the population. The sample of size 200 shows 125 customers preferring to pay by credit
#card, 25 by debit card, and 50 by check. Test whether the sample is representative of the
#population, using alpha=0.05??? = 
#-----------------------------------------------------------------------------
#Code
label = c("CreditCard", "DebitCard", "Check")
P = c(0.5, 0.2, 0.3)
names(P) <- label
n = 200
O = c(125, 25, 50)
names(O) <- label
E = n * P
alpha = 0.05

#Directly using available R function
chisq.test(O, p = P)
#Output
#X-squared = 13.542, df = 2, p-value = 0.001147
#Conclusion
#Null hypothesis rejected.Not homogenous.
#pvalue(0.001147) is lesser than alpha(0.05).Hence,null hypothesis is false.

# Calculating ChiSquared_Data using mathematical formula
ChiSquared_data = sum((O - E)^2 / E)

# number of categories
k = length(label)
p_value = pt(ChiSquared_data, df=c(k-1), lower.tail = FALSE)
print(paste("ChiSquared data: ", ChiSquared_data))
print(paste("p_value: ", p_value))
if(p_value > alpha) {
  print("Null Hypothesis could not be disproved")
} else {
  print("Null hypothesis rejected. Not homogenous.")
}
#Output 
#p_value < alpha.So, "Null hypothesis rejected. Not homogenous."
#Hence, final conclusion (Null hypothesis rejected) is same using both cases
#(directly using chisq.test and calculating mathematically)
#--------------------------------------------------
#--------------------------------------------------

                                   # Question 7
#Table 5.12 contains the amount spent (in dollars) in a random sample of purchases where
#the payment was made by credit card, debit card, and check, respectively. Test whether
#the population mean amount spent differs among the three groups, using ???? = 0.05.
#TABLE 5.12 Purchase amounts for three payment methods
#Credit Card Debit Card Check
# 100          80       50
# 110          120      70
# 90           90       80
# 100          110      80
#-----------------------------------------------------------------------------
#Code
#Given alpha = 0.05
CREDIT_CARD <- c(100, 110, 90, 100)
DEBIT_CARD <- c(80, 120, 90, 110)
CHECK <- c(50, 70, 80, 80)
ab <- append(CREDIT_CARD,DEBIT_CARD)
datavalues <- append(ab, CHECK)
datalabels <- factor(c(rep("CREDIT_CARD", length(CREDIT_CARD)),
                       rep("DEBIT_CARD", length(DEBIT_CARD)),
                       rep("CHECK", length(CHECK))))
anova.results <- aov(datavalues ~ datalabels)
summary(anova.results)

#Output
#            Df Sum Sq Mean Sq F value Pr(>F)  
#datalabels   2   2400    1200       6 0.0221 *
#Residuals    9   1800     200                 
#Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

#Conclusion
#Pr(>F) 0.0221 is less than alpha(0.05)
#We reject the hypothesis.
#Hence,the population mean amount spent differs among the three groups.
#--------------------------------------------------
#--------------------------------------------------

#Import cereals dataset for Next Questions 
cereals = read.csv(file = "D:/R workspace/cereals.CSV")

#                                    Question 11
#What is the estimated regression equation?
#-----------------------------------------------------------------------------
#Code
#Estimated regression equation for rating based on fiber
# rating = B_0 + B_1 * fiber
#Rating is dependent variable.Fiber is independent variable.
rating <- cereals$Rating
fiber <- cereals$Fiber
#lm - Fitting Linear Models.Used to carry out regression.
lm.out <- lm(rating ~ fiber)
s <- summary(lm.out)$coefficients
Equation = paste(" Rating = ", s[1,1], ifelse(s[2,1] >= 0, " + ", " - "), s[2,1], "*Fiber")
print(Equation)
#Output
#Regression equation is (using coefficients):
#Rating =  35.256594829153  +  3.44297816629585 *Fiber

# Plot for Cereal Rating by Fiber Content
plot(cereals$Fiber, cereals$Rating,main = "Cereal Rating by Fiber Content",xlab = "Fiber Content",ylab = "Rating")
abline(lm.out)
#--------------------------------------------------
#--------------------------------------------------

#                                    Question 15
#How closely does our model fit the data? Which statistic are you using to measure this?
#-----------------------------------------------------------------------------
#Code
summary(lm.out)
#r^2(r.squared) is a measure of how closely the linear regression model fits the data.
#Values closer to 90-100% indicate a good fit.
r_sq <- summary(lm.out)$r.squared
r_sq
# Output: r_sq value turns out to be 0.3412434
# 34% is a very bad fit.
#--------------------------------------------------
#--------------------------------------------------

#                                    Question 16
#Find a point estimate for the rating for a cereal with a fiber content of 3 grams.
#-----------------------------------------------------------------------------
#Code
fiber<-3
point_estimate = s[1,1] + s[2,1] * fiber
#s[1,1]=35.25659,s[2,1]=3.442978
point_estimate
# Output
#point_estimate=45.58553
#This is Point estimate of Rating of Cereal with 3g fiber content.
#--------------------------------------------------
#--------------------------------------------------

#                                    Question 18
#Find a 95% prediction interval for a randomly chosen cereal with a fiber content of 3 grams.
#-----------------------------------------------------------------------------
#Code
prediction_interval=0.95
#Predicted values based on linear model object
estimate = predict(lm.out, data.frame(fiber=3), interval = "prediction", level=prediction_interval)
estimate
#estimate[2]=22.55513,estimate[3]=68.61593
# Output
# Prediction interval is: (22.55513,68.61593)
# Rating of randomly chosen cereal with a fiber content of 3 grams lies between 22.55513 and 68.61593