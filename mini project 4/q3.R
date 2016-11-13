#standard error for January 2011
s2 = 365
#standard error for May 2011
s1 = 412
#mean credit limit for January 2011
y = 2635
#mean credit limit for May 2011
x = 2887
#number of samples for calculation of mean credit limit of January 2011
m = 400
#number of samples for calculation of mean credit limit of May 2011
n = 500
alpha = 0.05

#Part A
# Calculating Confidence Interval for difference in means of two samples
a=(s1^2/n)+(s2^2/m)
z = qnorm(1-(alpha)/2)
lower_confidence = x-y-z*sqrt(a)
upper_confidence = x-y+z*sqrt(a)
lower_confidence
upper_confidence

#Part B

a=(s1^2/n)+(s2^2/m)
#calculation of degree of freedom for calculating t_alpha using Satterthewaite Equation
v = (a)^2/(((s1^4)/(n^2*(n-1)))+((s2^4)/(m^2*(m-1))))
#calculating test statistic
t = (x-y)/sqrt(a)

#calculating critical value t_alpha
t_alpha = qt(1-(alpha)/2,v)

if(t > -t_alpha)
{
  print("H_0 is accepted, i.e. mean credit limit of cards issued in May 2011 is more than that issued in January 2011")
}
if(t <= -t_alpha)
{
  print("H_0 is rejected, i.e. mean credit limit of cards issued in May 2011 is not more than that issued in January 2011")
} 
