#boxplot module

library(gdata)
library(xlsx)
#reading input file
data = read.xlsx("bp.xlsx", sheetName = "Sheet1", header = TRUE)

#converting the data into numberic foramt for frther calculation
armsys=as.numeric(data[,1])
fingsys = as.numeric(data[,2])
#boxplot(armsys,fingsys, names=c("armSys", "fingSys"))

#PART B

#histogram of armsys and a normal curve with mean and standard deviation equal to that of sample

#hist(armsys,prob=TRUE)
#a=mean(armsys)
#v=sd(armsys)
#curve(dnorm(x,mean = a,sd=v), col=3, lty=2,lwd=2,add=TRUE)

#histogram of fingsys and a normal curve with mean and standard deviation equal to that of sample
#hist(fingsys,prob=TRUE)
#b = mean(fingsys)
#c = sd(fingsys)
#curve(dnorm(x,mean=b,sd=c),col=3,lty=2,lwd=2,add=TRUE)

#Q-Q plot for both datasets to identify whether their distribution is normal or not
#qqnorm(armsys)
#qqline(armsys)

#qqnorm(fingsys)
#qqline(fingsys)

#Part C

X = mean(armsys)
Y = mean(fingsys)
v1 = var(armsys)
v2 = var(fingsys)
alpha = 0.05

# Assuming that the two sample have equal variances

CI  = X - Y + c(-1, 1)*qnorm(1-(alpha/2))*sqrt((v1/200) + (v2/200))

print(CI)

# Part D
Alpha = 0.05

# If |t| > PValue, we reject Null Hypothesis

# Null Hypothesis:: X - Y = 0
# Alternative Hypothesis:: X - Y != 0

# Preparing Test Statistics 

l1 = length(armsys)
l2 = length(fingsys)

pooledSamVar = ((l1 - 1)*v1 + (l2 - 1)*v2)/(l1 + l2 - 2) 

t = (X - Y)/pooledSamVar*sqrt(1/l1 + 1/l2)

PValue = qt(1-(Alpha/2), (l1 + l2 - 2))

if( t<=-PValue && t>=PValue  ) {
  print("Null Hypothesis Rejected")
} else { print("We can not Reject Null Hypothesis")
}