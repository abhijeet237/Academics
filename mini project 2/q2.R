x = c(30.16, 30.36, 97.83, 101.59, 106.42, 30.75, 100.10, 103.30, 101.73, 25.48, 98.90, 31.41, 26.33, 32.35, 96.52, 31.93, 108.32, 99.72, 101.11, 103.92, 97.87, 97.83, 99.22, 97.51, 103.24, 29.31, 29.82, 98.42, 34.28, 27.12, 99.28, 103.77, 102.61, 27.22, 97.71, 105.96, 102.41, 30.38, 101.73, 98.59, 100.14, 99.09, 27.44, 100.37, 99.84, 97.34, 101.17, 99.14, 97.41, 99.92, 101.31, 104.61, 100.71, 30.62, 103.57, 28.35, 108.12, 100.05, 31.84, 28.80, 98.47, 27.99, 105.05, 33.33, 100.09, 23.57, 101.68, 95.62, 102.10, 98.77, 100.93, 98.68, 27.00, 102.04, 100.88, 98.79, 102.58, 27.40, 29.01, 29.57, 97.16, 96.60, 105.35, 97.74, 100.97, 101.88, 96.75, 29.01, 98.08, 99.63, 99.41, 101.96, 26.70, 31.66, 98.29, 103.51, 99.28, 99.10, 33.36, 100.36)
hist(x,prob=TRUE)
#multi line comment
if(FALSE){
plot(density(x))
LL <- function(mu, sigma,mu1, sigma1) 

{

-sum (0.7*dnorm(x, mu, sigma, log=TRUE)+0.3*dnorm(x, mu1, sigma1, log=TRUE))
#-sum(R)
}
library(stats4)
mle(LL, start = list(mu = 80, sigma=3, mu1=30, sigma1=5), method = "L-BFGS-B")
}#comment end

#if(FALSE){
library(mclust)
#BIC for parameterized Gaussian mixture models fitted by EM algorithm 
#initialized by model-based
#hierarchical clustering.
#here V indicates that data is univariate
BIC = mclustBIC(x, modelNames="V")
#Determines the best model via 
#mclustBIC for a given set of model parameterizations
#and numbers of components
Model = mclustModel(x, BIC)
#printing mu_1 and mu_2 as output
Model$parameters$mean

# printing variance_1 & variance_2
Model$parameters$variance$sigmasq
#a <- 0.7*dnorm(x,29.41,6.14)+0.3*dnorm(x,100.57,7.49)
#plot(density(pdf))
curve(0.3*dnorm(x,29.41,6.14)+0.7*dnorm(x,100.57,7.49), col=3, lty=2,lwd=2,add=TRUE)
#}
