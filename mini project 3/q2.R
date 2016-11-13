#here CI = 90% => alpha = 0.1
#confidence interval for difference in mean sugar contents of the two cereal types
#Given: 
#1. both n_1 & n_2 are < 30
#2. var_x & var_y is unknown

#Part A
children = c( 40.3, 55, 45.7, 43.3, 50.3, 45.9, 53.5, 43, 44.2, 44, 47.4, 44, 33.6, 55.1, 48.8, 50.4, 37.8, 60.3, 46.5)
adult = c(20, 30.2, 2.2, 7.5, 4.4, 22.2, 16.6, 14.5, 21.4, 3.3, 6.6, 7.8, 10.6, 16.2,14.5, 4.1, 15.8, 4.1, 2.4, 3.5, 8.5, 10, 1, 4.4, 1.3, 8.1, 4.7, 18.4)
#qqplot to check whether distribution of children cereal & adult cereal is normal or not
qqnorm(children)
qqnorm(adult)

#Assumption
#1. Distribution of adult cereals is also Normal N(u2,s2)
#Module to calculate CI for difference in mean of children & adult cereal

alpha = 0.1 #as CI = 90%
n1 = length(children)
s1 = var(children)#it is square of sd
X = mean(children)

n2 = length(adult)
s2 = var(adult)#it is square of sd
Y = mean(adult)

#B part
#here we use F-test to compare variance of two population
F = s1/s2#generating test statistic
#Calculating critical values
F1 = qf(0.95,n1-1,n2-1)
F2 = qf(0.05,n1-1,n2-1)
if(F<F1 || F>F2)
{print("Variances of children cereal population and adult cereal population are not equal")}


#C part
#here qt is used to calculate value of t-dist. given alpha/2 & n1+n2-2 as degree of freedom
lowerCI = X-Y-qt(0.05,44)*sqrt((s1/n1)+(s2/n2))
upperCI = X-Y+qt(0.05,44)*sqrt((s1/n1)+(s2/n2))

lowerCI
upperCI