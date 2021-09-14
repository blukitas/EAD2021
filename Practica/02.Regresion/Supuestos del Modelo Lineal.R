#################
# What happens if errors are NOOT normal ?????
#################
n<-100 # sample size
homo<-TRUE
HeteCoef<-10
# Errors with BETA(1/5,1/5) distribution !!!! 
hist(rbeta(100000,1/5,1/5),100) # FAR from Normal
# Genrate Y values
GenY<-function(x,homo=TRUE,HeteCoef=3)
{
  error<-rbeta(n,1/5,1/5)-0.5
  if (homo==FALSE)
  {
    hetero<-HeteCoef*x # heteroced
    error<-error*hetero # heteroced    
  }
  y<-3*x+4+error
y  
}
####### Let us see 1 case
x<-runif(n)
y<-GenY(x,homo=homo,HeteCoef=HeteCoef)
ajus<-lm(y~x)
plot(x,y)
abline(ajus)
#plot(ajus)
#summary(ajus)
# Simulation
N<-10000 # number of replications, just to infer proprly the actual distribution of the estimates
# I fit N linear models and save the adjusted coefs
betas<-rep(NA,N)
betas.sd<-rep(NA,N)
for (i in 1:N)
{
  x<-runif(n) # uniform feature
  y<-GenY(x,homo=homo,HeteCoef=HeteCoef)
  ajus<-lm(y~x) # linear fitting
  betas[i]<-coef(ajus)[2] # saving slope coef
  betas.sd[i]<-summary(ajus)$coefficients[2,2] # saving slope sd
  }
# standarize betas est
betas.stand<-(betas-3)/betas.sd
hist(betas.stand,50,prob=T,xlim=c(-5,5),ylim=c(0,0.4))
lines(density(betas.stand),lwd=1,col='green')
secu<-seq(from=-4,to=4,by=0.01)
# Now a norml distr. overlapping
lines(secu,dnorm(secu,mean=0,sd=1),col='red',lwd=1)
#
#qqnorm(betas)


