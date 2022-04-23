#libraries          
library(psych) 
library(car)
library(dplyr)
library(ggplot2)
library(apaTables)
library(moments)
library(xlsx)
library(papaja)
library(lavaan)

#import data
items <- read.csv("data/cleaned_itemdata.long.csv", header=TRUE)
scales <- read.csv("data/cleaned_scaledata_long.csv", header=TRUE)
scales.wide <- read.csv("data/cleaned_scaledata_wide.csv", header=TRUE)


"##########################
INSPECT SCALES:
descriptive stats (means. SDs, skew, and kurtosis)
reliability
factor analysis

ASSUMPTIONS CHECK:
Normality
-distributions (histograms and boxplots)
-Skewness and Kurtosis (see above)
-QQ-plt
-Outliers
Independence
-multicollinearity (VIF)
###########################"

##### descriptive statistics
a <- psych::describe(scales$procjust)
describeBy(scales$procjust, scales$condition)

b <- psych::describe(scales$interjust)
describeBy(scales$interjust, scales$condition)

c <- psych::describe(scales$orgjust)
describeBy(scales$orgjust, scales$condition)

d <- psych::describe(scales$genatrct)
describeBy(scales$genatrct, scales$condition)

e <- psych::describe(scales$intpurs)
describeBy(scales$intpurs, scales$condition)

f <- psych::describe(scales$prest)
describeBy(scales$prest, scales$condition)

g <- psych::describe(scales$orgatrct)
describeBy(scales$orgatrct, scales$condition)

h <- psych::describe(scales$compete)
describeBy(scales$compete, scales$condition)

i <- psych::describe(scales$socresp)
describeBy(scales$socresp, scales$condition)

j <- psych::describe(scales$support)
describeBy(scales$support, scales$condition)

k <- psych::describe(scales$innovate)
describeBy(scales$innovate, scales$condition)

desc <- rbind(a,b,c,d,e,f,g,h,i,j,k)
desc

#export to excel file
write.xlsx(desc, file="output/output.xlsx",sheetName="descriptives",col.names=TRUE,row.names=FALSE,append=TRUE)

rm(a,b,c,d,e,f,g,h,i,j,k, desc)


#### SCALE INSPECTION ####

## check reliabilities

#alpha
procjust.alpha.z <- dplyr::select(items, 3,4,5,6,7,9,10,11) ## DO NOT USE
alpha.pj <- psych::alpha(procjust.alpha.z)
alpha.pj

procjust.alpha <- dplyr::select(items, 3,4,5,6,7,8,9,10) #removed ROA items (11) due to low item-total corr
a1 <- psych::alpha(procjust.alpha)
a1
alpha.pj <- as.data.frame(a1$total)
rm(procjust.alpha, a1)

interjust.alpha <- dplyr::select(items,12,13,14,15,16,17,18,19,20)
a2 <- psych::alpha(interjust.alpha)
a2
alpha.ij <- as.data.frame(a2$total)
rm(interjust.alpha, a2)

orgjust.alpha <- dplyr::select(items, 3,4,5,6,7,8,9,10,12,13,14,15,16,17,18,19,20) ##removed ROA item (11)
a3 <- psych::alpha(orgjust.alpha)
a3
alpha.oj <- as.data.frame(a3$total)
rm(orgjust.alpha, a3)

genatrct.alpha <-dplyr::select(items,21,22,23,24,25)   
a4 <- psych::alpha(genatrct.alpha) 
a4
alpha.ga <- as.data.frame(a4$total)
rm(genatrct.alpha, a4)

intpurs.alpha <- dplyr::select(items, 26,27,28,29,30)
a5<- psych::alpha(intpurs.alpha)
a5
alpha.ip <- as.data.frame(a5$total)
rm(intpurs.alpha, a5)

prest.alpha <- dplyr::select(items,31,32,33,34,35)
a6 <- psych::alpha(prest.alpha)
a6
alpha.prest <- as.data.frame(a6$total)
rm(prest.alpha,a6)

orgatrct.alpha <- dplyr::select(items, 21,22,23,24,25,26,27,28,29,30, 31,32,33,34,35)
a7 <- psych::alpha(orgatrct.alpha, check.keys = TRUE) 
a7
alpha.oa <- as.data.frame(a7$total)
rm(orgatrct.alpha, a7)

compete.alpha <- dplyr::select(items, 36,37,38,39)
a8 <- psych::alpha(compete.alpha)
a8
alpha.c <- as.data.frame(a8$total)
rm(compete.alpha, a8)

socresp.alpha <- dplyr::select(items, 40,41,42,43)
a9 <- psych::alpha(socresp.alpha)
a9
alpha.sr <- as.data.frame(a9$total)
rm(socresp.alpha,a9)

support.alpha <- dplyr::select(items, 44,45,46,47)
a10 <- psych::alpha(support.alpha)
a10
alpha.s <- as.data.frame(a10$total)
rm(support.alpha,a10)

innovate.alpha <- dplyr::select(items, 48,49,50,51)
a11 <- psych::alpha(innovate.alpha)
a11
alpha.i <- as.data.frame(a11$total)
rm(innovate.alpha,a11)


#create alpha dataframe
alphas <- rbind(alpha.pj,alpha.ij,alpha.oj,alpha.ga,alpha.ip,alpha.prest,alpha.oa,alpha.c,alpha.sr,alpha.s,alpha.i)

#export to excel file
write.xlsx(alphas, file="output/output.xlsx",sheetName="alphas",col.names=TRUE,row.names=FALSE,append=FALSE)

rm(alpha.c,alpha.ga,alpha.i,alpha.ij,alpha.ip,alpha.oa,alpha.oj,alpha.pj,alpha.prest,alpha.s,alpha.sr,alphas,procjust.alpha.z)


#test-retest (if these are done correctly, test-retest reliability is not good
#maybe not the best indicator of reliability given different treatments for the conditions
cor.test(scales.wide$A_orgjust, scales.wide$B_orgjust)
cor.test(scales.wide$A_orgatrct, scales.wide$B_orgatrct)
cor.test(scales.wide$A_compete, scales.wide$B_compete)
cor.test(scales.wide$A_socresp, scales.wide$B_socresp)
cor.test(scales.wide$A_support, scales.wide$B_support)
cor.test(scales.wide$A_innovate, scales.wide$B_innovate)



### CFA for scales   

#first need to subset 'items' dataframe into scale item dataframes
spjs <- dplyr::select(items, 3:10, 12:20)
oa <- dplyr::select(items, 21:35)
culture <- dplyr::select(items, 36:51) 

fa.parallel(spjs)
cfa1 <- fa(spjs, nfactors=2, rotate="oblimin") #best fits 7 factors (one for each subscale)
cfa1
cfa1$loadings
cfa1$dof
cfa1$PVAL
cfa1$STATISTIC #model chi
cfa1$RMSEA
cfa1$rms
cfa1$fit
fa.diagram(cfa1)
summary(cfa1)


fa.parallel(oa)
cfa2 <- fa(oa, nfactors=1, rotate="oblimin") #could not fit 3-factor model, strongly 1
cfa2
cfa2$loadings
cfa2$dof
cfa2$PVAL
cfa2$STATISTIC #model chi
cfa2$RMSEA
cfa2$rms
fa.diagram(cfa2)


fa.parallel(culture)
cfa3 <- fa(culture, nfactors=4, rotate="oblimin") ##messy 4-factor fit
cfa3
cfa3$loadings
cfa3$dof
cfa3$PVAL
cfa3$STATISTIC #model chi
cfa3$RMSEA
cfa3$rms
fa.diagram(cfa3)

# data frame to factor analyze # of variables in study 
scales.fa <- scales %>% dplyr::select(AVI.id,
                                      orgjust, 
                                      orgatrct,
                                      compete,
                                      socresp,
                                      support,
                                      innovate)
# CFA of study variables
fa.parallel(scales.fa)
study.cfa <- fa(scales.fa, nfactors=7, rotate="oblimin")
study.cfa


rm(cfa1,cfa2,cfa3,spjs,oa,culture, study.cfa, scales.fa)

##### ASSUMPTIONS CHECK #####

##### examine distributions of variables
hist(scales$procjust, breaks=20)
densityPlot(scales$procjust)

hist(scales$interjust, breaks=20) 
densityPlot(scales$interjust)

hist(scales$orgjust, breaks=20)
densityPlot(scales$orgjust)

hist(scales$genatrct, breaks=20) 
densityPlot(scales$genatrct)

hist(scales$intpurs, breaks=20) 
densityPlot(scales$intpurs)

hist(scales$prest, breaks=20) 
densityPlot(scales$prest)

hist(scales$orgatrct, breaks=20) #skewed, as are subscales
densityPlot(scales$orgatrct)

hist(scales$compete, breaks=20)
densityPlot(scales$compete)

hist(scales$socresp, breaks=20)
densityPlot(scales$socresp)

hist(scales$support, breaks=20)
densityPlot(scales$support)

hist(scales$innovate, breaks=20)
densityPlot(scales$innovate)


# QQ plot  
scales.no.na <- na.omit(scales) 

lm1 <- lm(orgatrct ~ AVI.id, data=scales.no.na)
plot(orgatrct ~ AVI.id, data=scales.no.na) 
plot(lm1)
summary(lm1)
plot(resid(lm1), xlab = "Order of observations", ylab = "residuals")
hist(resid(lm1), main = "Bin width = 0.01", xlab = "Residuals")
qqnorm(resid(lm1))
qqline(resid(lm1))

lm2 <- lm(orgjust ~ AVI.id, data=scales.no.na)
plot(orgjust ~ AVI.id, data=scales.no.na) 
plot(lm2)
summary(lm2)
plot(resid(lm2))
hist(resid(lm2))
qqnorm(resid(lm2))
qqline(resid(lm2))

lm3 <- lm(innovate ~ AVI.id, data= scales.no.na)
plot(innovate ~ AVI.id, data=scales.no.na) 
plot(lm3)
summary(lm3)
qqnorm(resid(lm3))
qqline(resid(lm3))

lm4 <- lm(support ~ AVI.id, data= scales.no.na)
plot(support ~ AVI.id, data=scales.no.na) 
plot(lm4)
summary(lm4)

lm5 <- lm(compete ~ AVI.id, data= scales.no.na)
plot(compete ~ AVI.id, data=scales.no.na) 
plot(lm5)
summary(lm5)

lm6 <- lm(socresp ~ AVI.id, data= scales.no.na)
plot(socresp ~ AVI.id, data=scales.no.na) 
plot(lm6)
summary(lm6)

lm7 <- lm(orgatrct ~ orgjust, data=scales.no.na)
plot(orgatrct ~ orgjust, data=scales.no.na)
abline(lm7, col="red")
plot(lm7)
summary(lm7)
plot(resid(lm7))
hist(resid(lm7))
qqnorm(resid(lm7))
qqline(resid(lm7))

lm8 <- lm(orgatrct ~ innovate, data=scales.no.na)
plot(orgatrct ~ jitter(innovate,2), data=scales.no.na)
abline(lm8, col="red")
plot(lm8)
summary(lm8)
plot(resid(lm8))
hist(resid(lm8))

lm9 <- lm(orgatrct ~ compete, data=scales.no.na)
plot(orgatrct ~ jitter(compete,2), data=scales.no.na)
abline(lm9, col="red")
plot(lm9)
summary(lm9)
plot(resid(lm9))
hist(resid(lm9))

lm10 <- lm(orgatrct ~ support, data=scales.no.na)
plot(orgatrct ~ jitter(support,2), data=scales.no.na)
abline(lm10, col="red")
plot(lm10)
summary(lm10)
plot(resid(lm10))
hist(resid(lm10))
qqnorm(resid(lm10))
qqline(resid(lm10))

lm11 <- lm(orgatrct ~ socresp, data=scales.no.na)
plot(orgatrct ~ jitter(socresp,2), data=scales.no.na)
abline(lm11, col="red")
plot(lm11)
summary(lm11)
plot(resid(lm11))
hist(resid(lm11))

lm.max <- lm(orgatrct ~ orgjust + compete + support + socresp + innovate + AVI.id, data=scales.no.na)
summary(lm.max) ## interesting output 
plot(lm.max)

rm(lm1, lm2, lm3, lm4, lm5, lm6, lm6, lm7, lm8, lm9, lm10, lm11,lm.max)


## CONSIDER REMOVING PROBLEMATIC OBSERVATIONS LATER

## investigate collinearity   
collinear <- lm(orgjust ~ innovate, data=scales.no.na)
plot(orgatrct ~ jitter(innovate,2), data=scales.no.na)
abline(collinear, col="red")
plot(collinear)
summary(collinear)

collinear1 <- lm(orgjust ~ compete, data=scales.no.na)
plot(orgjust ~ jitter(compete,2), data=scales.no.na)
abline(collinear1, col="red")
plot(collinear1)
summary(collinear1)

collinear2 <- lm(orgjust ~ support, data=scales.no.na) 
plot(orgjust ~ jitter(support,2), data=scales.no.na)             
abline(collinear2, col="red")
plot(collinear2)
summary(collinear2)

collinear3 <- lm(orgjust ~ socresp, data=scales.no.na)
plot(orgjust ~ jitter(socresp,2), data=scales.no.na)
abline(collinear3, col="red")
plot(collinear3)
summary(collinear3)

collinear4 <- lm(innovate ~ orgjust, data=scales.no.na)
plot(jitter(innovate,2) ~ orgjust, data=scales.no.na)
abline(collinear4, col="red")
plot(collinear4)
summary(collinear4)

collinear5 <- lm(compete ~ orgjust, data=scales.no.na)
plot(jitter(compete,2) ~ orgjust, data=scales.no.na)
abline(collinear5, col="red")
plot(collinear5)
summary(collinear5)

collinear6 <- lm(socresp ~ orgjust, data=scales.no.na)
plot(jitter(socresp,2) ~ orgjust, data=scales.no.na)
abline(collinear6, col="red")
plot(collinear6)
summary(collinear6)

rm(collinear, collinear1, collinear2, collinear3, collinear4, collinear5, collinear6)


## VIF

vif <- lm(orgjust ~ AVI.id + compete + support + socresp + innovate, data=scales)
car::vif(vif)

