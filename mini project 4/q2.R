x = 9.02#sample mean
u = 10#population mean
s = 2.22#sample standared error
n = 20#sample size
#calculating test statistic
t= (x-u)/(s/sqrt(n))
t
#PART E
# mean of the whole population
X = 10
#Sample mean, standard deviation and sample size
X_bar = 9.02
sd = 2.22
n= 20

#test statistic t
t = (X_bar - X)/(sd/sqrt(n))
t
#to generate p-values given value of test statistic & degree of freedom
pt(t,df=n-1)
count <- 0
for(i in 1:10000){
  t_sim <- rt(1,n-1)
  if(t_sim < t){
    count <- count + 1
  }
}
p_val <- count/10000
p_val

#PART F
aplha=0.05
if (p_val<alpha)
{
  print("Reject Null Hypothesis")
}else{
  print("Accept Null Hypothesis")
}