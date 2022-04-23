
> ###### REGRESSIONs ######
> max.mod <- lm(Attraction ~ AVI + Justice + Innovativeness + Supportiveness + Responsibility + Competitiveness, data = scales) 
> summary(max.mod)

Call:
lm(formula = Attraction ~ AVI + Justice + Innovativeness + Supportiveness + 
    Responsibility + Competitiveness, data = scales)

Residuals:
     Min       1Q   Median       3Q      Max 
-2.12606 -0.30084  0.00938  0.28985  1.79822 

Coefficients:
                Estimate Std. Error t value Pr(>|t|)    
(Intercept)      0.28808    0.21856   1.318   0.1886    
AVI             -0.10183    0.08608  -1.183   0.2379    
Justice          0.57216    0.06240   9.169   <2e-16 ***
Innovativeness   0.03856    0.05948   0.648   0.5174    
Supportiveness   0.12328    0.06348   1.942   0.0532 .  
Responsibility   0.09701    0.07818   1.241   0.2158    
Competitiveness  0.19074    0.06298   3.028   0.0027 ** 
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.5204 on 263 degrees of freedom
  (20 observations deleted due to missingness)
Multiple R-squared:  0.6697,	Adjusted R-squared:  0.6622 
F-statistic: 88.89 on 6 and 263 DF,  p-value: < 2.2e-16




> mod1 <- lm(Justice ~ AVI, data=scales)
> summary(mod1)

Call:
lm(formula = Justice ~ AVI, data = scales)

Residuals:
     Min       1Q   Median       3Q      Max 
-1.59465 -0.37465  0.01535  0.40535  1.57535 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  3.91489    0.05235   74.79   <2e-16 ***
AVI         -0.93024    0.07364  -12.63   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.6216 on 283 degrees of freedom
  (5 observations deleted due to missingness)
Multiple R-squared:  0.3605,	Adjusted R-squared:  0.3583 
F-statistic: 159.6 on 1 and 283 DF,  p-value: < 2.2e-16




> mod2 <- lm(Competitiveness ~ AVI, data=scales)
> summary(mod2)

Call:
lm(formula = Competitiveness ~ AVI, data = scales)

Residuals:
     Min       1Q   Median       3Q      Max 
-2.72049 -0.60764  0.02951  0.64236  1.39236 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  3.72049    0.06739  55.210   <2e-16 ***
AVI         -0.11285    0.09530  -1.184    0.237    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.8086 on 286 degrees of freedom
  (2 observations deleted due to missingness)
Multiple R-squared:  0.004879,	Adjusted R-squared:  0.001399 
F-statistic: 1.402 on 1 and 286 DF,  p-value: 0.2373




> mod3 <- lm(Responsibility ~ AVI, data=scales)
> summary(mod3)

Call:
lm(formula = Responsibility ~ AVI, data = scales)

Residuals:
    Min      1Q  Median      3Q     Max 
-2.3854 -0.5210  0.1146  0.6146  1.7290 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  3.88542    0.06881  56.469  < 2e-16 ***
AVI         -0.61444    0.09748  -6.303  1.1e-09 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.8257 on 285 degrees of freedom
  (3 observations deleted due to missingness)
Multiple R-squared:  0.1224,	Adjusted R-squared:  0.1193 
F-statistic: 39.73 on 1 and 285 DF,  p-value: 1.104e-09




> mod4 <- lm(Innovativeness ~ AVI, data=scales)
> summary(mod4)

Call:
lm(formula = Innovativeness ~ AVI, data = scales)

Residuals:
     Min       1Q   Median       3Q      Max 
-2.47222 -0.56552  0.02778  0.52778  1.52778 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  3.47222    0.06646  52.249   <2e-16 ***
AVI          0.09330    0.09382   0.994    0.321    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.7975 on 287 degrees of freedom
  (1 observation deleted due to missingness)
Multiple R-squared:  0.003434,	Adjusted R-squared:  -3.872e-05 
F-statistic: 0.9888 on 1 and 287 DF,  p-value: 0.3209




> mod5 <- lm(Supportiveness ~ AVI, data=scales)
> summary(mod5)

Call:
lm(formula = Supportiveness ~ AVI, data = scales)

Residuals:
     Min       1Q   Median       3Q      Max 
-2.84028 -0.64860 -0.09028  0.65972  2.10140 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  3.84028    0.07767  49.441  < 2e-16 ***
AVI         -0.94168    0.11004  -8.558 7.25e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.9321 on 285 degrees of freedom
  (3 observations deleted due to missingness)
Multiple R-squared:  0.2044,	Adjusted R-squared:  0.2016 
F-statistic: 73.23 on 1 and 285 DF,  p-value: 7.245e-16




> mod6 <- lm(Attraction ~ AVI, data=scales)
> summary(mod6)

Call:
lm(formula = Attraction ~ AVI, data = scales)

Residuals:
     Min       1Q   Median       3Q      Max 
-2.38345 -0.51345  0.05404  0.58404  1.61655 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  4.21596    0.06729  62.654   <2e-16 ***
AVI         -0.83251    0.09499  -8.764   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.799 on 281 degrees of freedom
  (7 observations deleted due to missingness)
Multiple R-squared:  0.2147,	Adjusted R-squared:  0.2119 
F-statistic:  76.8 on 1 and 281 DF,  p-value: < 2.2e-16




> mod7 <- lm(Attraction ~ Justice, data=scales)
> summary(mod7)

Call:
lm(formula = Attraction ~ Justice, data = scales)

Residuals:
     Min       1Q   Median       3Q      Max 
-1.66813 -0.37697  0.00458  0.33583  2.02453 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  0.73868    0.15831   4.666 4.79e-06 ***
Justice      0.88803    0.04489  19.781  < 2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.5838 on 276 degrees of freedom
  (12 observations deleted due to missingness)
Multiple R-squared:  0.5864,	Adjusted R-squared:  0.5849 
F-statistic: 391.3 on 1 and 276 DF,  p-value: < 2.2e-16




> mod8 <- lm(Attraction ~ Competitiveness, data=scales)
> summary(mod8)

Call:
lm(formula = Attraction ~ Competitiveness, data = scales)

Residuals:
    Min      1Q  Median      3Q     Max 
-2.8493 -0.4844  0.1237  0.4799  2.0647 

Coefficients:
                Estimate Std. Error t value Pr(>|t|)    
(Intercept)      1.56427    0.20862   7.498 8.57e-13 ***
Competitiveness  0.60935    0.05567  10.946  < 2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.7538 on 280 degrees of freedom
  (8 observations deleted due to missingness)
Multiple R-squared:  0.2997,	Adjusted R-squared:  0.2972 
F-statistic: 119.8 on 1 and 280 DF,  p-value: < 2.2e-16




> mod9 <- lm(Attraction ~ Responsibility, data=scales)
> summary(mod9)

Call:
lm(formula = Attraction ~ Responsibility, data = scales)

Residuals:
    Min      1Q  Median      3Q     Max 
-3.2609 -0.3566  0.0765  0.4243  1.7514 

Coefficients:
               Estimate Std. Error t value Pr(>|t|)    
(Intercept)     1.39255    0.16696    8.34 3.48e-15 ***
Responsibility  0.67491    0.04532   14.89  < 2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.6691 on 278 degrees of freedom
  (10 observations deleted due to missingness)
Multiple R-squared:  0.4437,	Adjusted R-squared:  0.4417 
F-statistic: 221.8 on 1 and 278 DF,  p-value: < 2.2e-16




> mod10 <- lm(Attraction ~ Innovativeness, data=scales)
> summary(mod10)

Call:
lm(formula = Attraction ~ Innovativeness, data = scales)

Residuals:
    Min      1Q  Median      3Q     Max 
-3.2342 -0.5871  0.1429  0.6358  1.5463 

Coefficients:
               Estimate Std. Error t value Pr(>|t|)    
(Intercept)     2.22732    0.22456   9.919  < 2e-16 ***
Innovativeness  0.44596    0.06227   7.162 7.05e-12 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.8297 on 280 degrees of freedom
  (8 observations deleted due to missingness)
Multiple R-squared:  0.1548,	Adjusted R-squared:  0.1518 
F-statistic: 51.29 on 1 and 280 DF,  p-value: 7.05e-12




> mod11 <- lm(Attraction ~ Supportiveness, data=scales)
> summary(mod11)

Call:
lm(formula = Attraction ~ Supportiveness, data = scales)

Residuals:
     Min       1Q   Median       3Q      Max 
-2.88174 -0.36084  0.05294  0.43203  1.60740 

Coefficients:
               Estimate Std. Error t value Pr(>|t|)    
(Intercept)     1.85324    0.13177   14.06   <2e-16 ***
Supportiveness  0.57957    0.03742   15.49   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.6562 on 278 degrees of freedom
  (10 observations deleted due to missingness)
Multiple R-squared:  0.4632,	Adjusted R-squared:  0.4612 
F-statistic: 239.8 on 1 and 278 DF,  p-value: < 2.2e-16




> # regressions controlling for Justice and/or AVI
> con1 <- lm(Attraction ~ Competitiveness + Justice, data=scales)
> summary(con1)

Call:
lm(formula = Attraction ~ Competitiveness + Justice, data = scales)

Residuals:
     Min       1Q   Median       3Q      Max 
-1.82243 -0.31447  0.03372  0.31703  1.87023 

Coefficients:
                Estimate Std. Error t value Pr(>|t|)    
(Intercept)      0.08634    0.17507   0.493    0.622    
Competitiveness  0.30615    0.04447   6.885 3.95e-11 ***
Justice          0.75262    0.04620  16.290  < 2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.541 on 274 degrees of freedom
  (13 observations deleted due to missingness)
Multiple R-squared:  0.6454,	Adjusted R-squared:  0.6428 
F-statistic: 249.3 on 2 and 274 DF,  p-value: < 2.2e-16

> con2 <- lm(Attraction ~ Innovativeness + Justice, data=scales)
> summary(con2)

Call:
lm(formula = Attraction ~ Innovativeness + Justice, data = scales)

Residuals:
     Min       1Q   Median       3Q      Max 
-1.93788 -0.32811  0.00375  0.31516  1.73426 

Coefficients:
               Estimate Std. Error t value Pr(>|t|)    
(Intercept)     0.10485    0.18824   0.557    0.578    
Innovativeness  0.24350    0.04337   5.615 4.83e-08 ***
Justice         0.82335    0.04420  18.628  < 2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.5548 on 274 degrees of freedom
  (13 observations deleted due to missingness)
Multiple R-squared:  0.6286,	Adjusted R-squared:  0.6259 
F-statistic: 231.8 on 2 and 274 DF,  p-value: < 2.2e-16

> con3 <- lm(Attraction ~ Responsibility + Justice, data=scales)
> summary(con3)

Call:
lm(formula = Attraction ~ Responsibility + Justice, data = scales)

Residuals:
     Min       1Q   Median       3Q      Max 
-2.15347 -0.28366 -0.00357  0.29740  1.61709 

Coefficients:
               Estimate Std. Error t value Pr(>|t|)    
(Intercept)     0.36606    0.15704   2.331   0.0205 *  
Responsibility  0.33110    0.04593   7.209 5.59e-12 ***
Justice         0.65414    0.05229  12.511  < 2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.5371 on 272 degrees of freedom
  (15 observations deleted due to missingness)
Multiple R-squared:  0.6478,	Adjusted R-squared:  0.6453 
F-statistic: 250.2 on 2 and 272 DF,  p-value: < 2.2e-16

> con4 <- lm(Attraction ~ Supportiveness + Justice, data=scales)
> summary(con4)

Call:
lm(formula = Attraction ~ Supportiveness + Justice, data = scales)

Residuals:
     Min       1Q   Median       3Q      Max 
-1.97816 -0.36389 -0.02526  0.32870  1.75105 

Coefficients:
               Estimate Std. Error t value Pr(>|t|)    
(Intercept)     0.65992    0.14852   4.443 1.29e-05 ***
Supportiveness  0.27374    0.04050   6.759 8.45e-11 ***
Justice         0.64463    0.05504  11.712  < 2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.5392 on 272 degrees of freedom
  (15 observations deleted due to missingness)
Multiple R-squared:  0.6437,	Adjusted R-squared:  0.6411 
F-statistic: 245.7 on 2 and 272 DF,  p-value: < 2.2e-16

> con5 <- lm(Attraction ~ AVI + Justice + Competitiveness, data=scales)
> summary(con5)

Call:
lm(formula = Attraction ~ AVI + Justice + Competitiveness, data = scales)

Residuals:
     Min       1Q   Median       3Q      Max 
-1.83963 -0.31482  0.04005  0.30620  1.90361 

Coefficients:
                Estimate Std. Error t value Pr(>|t|)    
(Intercept)      0.31930    0.21769   1.467    0.144    
AVI             -0.14977    0.08379  -1.788    0.075 .  
Justice          0.68563    0.05935  11.553  < 2e-16 ***
Competitiveness  0.32625    0.04570   7.140 8.49e-12 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.5389 on 273 degrees of freedom
  (13 observations deleted due to missingness)
Multiple R-squared:  0.6495,	Adjusted R-squared:  0.6456 
F-statistic: 168.6 on 3 and 273 DF,  p-value: < 2.2e-16

> con6 <- lm(Attraction ~ AVI + Innovativeness + Justice, data=scales)
> summary(con6)

Call:
lm(formula = Attraction ~ AVI + Innovativeness + Justice, data = scales)

Residuals:
     Min       1Q   Median       3Q      Max 
-1.97005 -0.29809  0.01617  0.32745  1.76716 

Coefficients:
               Estimate Std. Error t value Pr(>|t|)    
(Intercept)     0.31844    0.22637   1.407   0.1607    
AVI            -0.14671    0.08701  -1.686   0.0929 .  
Innovativeness  0.26508    0.04508   5.880 1.19e-08 ***
Justice         0.76088    0.05756  13.219  < 2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.553 on 273 degrees of freedom
  (13 observations deleted due to missingness)
Multiple R-squared:  0.6324,	Adjusted R-squared:  0.6284 
F-statistic: 156.5 on 3 and 273 DF,  p-value: < 2.2e-16