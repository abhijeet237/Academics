
X_final=c()
for (j in 1:5)
{X=c()
X2=c()
for (i in 1:10000)
{  x1 = rexp(1,rate=0.2)
x2 = rexp(1,rate=0.2)
x3 = rexp(1,rate=0.2)
m=max(x1,x2,x3)
X=c(X,m)
X2 = c(X2,m^2)
}
  X_final=c(X_final,mean(X2))
}
X_final