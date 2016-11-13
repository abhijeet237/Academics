## Box Plotting

library(readODS)
Data = read_ods("/home/sonu/Desktop/DataAnalytics/MiniProject/Project4/data.ods", col_names=TRUE)

#boxplot(as.numeric(Data[,1]), as.numeric(Data[,2]), names=c("armSys", "fingSys"))

## QQ Plotting

x= as.numeric(Data[,1])
y = as.numeric(Data[,2])
#qqnorm(x);qqline(x)
#qqnorm(y);qqline(y)
#print(Data)


#CI for difference in mean

X = mean(x)
Y = mean(y)
varArmSys = var(x)
print(varArmSys)
varFingSys = var(y)
alpha = 0.05
# Assuming that the two sample have equal variances
CI  = X - Y + c(-1, 1)*qnorm(alpha/2)*sqrt(varArmSys + varFingSys)

print(CI)
# Resulting CI  (-72.63064, 63.98448)

## Performing 5% level test
Alpha = 0.05
## If |t| > PValue, we reject Null Hypothesis

# Null Hypothesis:: X - Y = 0
# Alternative Hypothesis:: X - Y != 0

## Preparing Test Statistics 

sizeArmSys = length(x)
sizeFingSys = length(y)

pooledSamVar = ((sizeArmSys-1)*varArmSys + (sizeFingSys-1)*varFingSys)/(sizeArmSys + sizeFingSys - 2) 

t = (X - Y)/pooledSamVar* (sqrt((1/sizeArmSys) + (1/sizeFingSys)))

PValue = qnorm(1-(Alpha/2), (sizeArmSys + sizeFingSys - 2))
print(PValue)
print(t)
print(PValue<=t)

if( (PValue <= t) &&  (PValue >= -t)  ) 
  {
 print("Null Hypothesis Rejected")
} 
if((PValue >= t) &&  (PValue <= -t)) 
  { 
    print("We can not Reject Null Hypothesis")
}
