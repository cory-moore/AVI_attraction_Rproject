

## Procedural and Interpersonal Justice
#alpha
a3 <- psych::alpha(orgjust.alpha)
> a3

Reliability analysis   
Call: psych::alpha(x = orgjust.alpha)

  raw_alpha std.alpha G6(smc) average_r S/N    ase mean   sd median_r
      0.91      0.91    0.94      0.38  10 0.0073  3.4 0.82     0.41

 lower alpha upper     95% confidence boundaries
0.9 0.91 0.93 

#CFA
> cfa1$dof
[1] 103
> cfa1$PVAL
[1] 3.224665e-39
> cfa1$STATISTIC
[1] 416.0278
> cfa1$rms
[1] 0.05122445
> cfa1$RMSEA
     RMSEA      lower      upper confidence 
0.10231197 0.09236739 0.11293558 0.90000000 


## Organizational Culture Dimensions
#alphas
#compete
a8 <- psych::alpha(compete.alpha)
> a8

Reliability analysis   
Call: psych::alpha(x = compete.alpha)

  raw_alpha std.alpha G6(smc) average_r S/N   ase mean   sd median_r
      0.71      0.72    0.68      0.39 2.6 0.028  3.7 0.81     0.39

 lower alpha upper     95% confidence boundaries
0.66 0.71 0.77 

> a9 <- psych::alpha(socresp.alpha)
> a9

Reliability analysis   
Call: psych::alpha(x = socresp.alpha)

  raw_alpha std.alpha G6(smc) average_r S/N   ase mean   sd median_r
      0.83      0.83    0.78      0.54 4.8 0.017  3.6 0.88     0.55

 lower alpha upper     95% confidence boundaries
0.79 0.83 0.86 

> a10 <- psych::alpha(support.alpha)
> a10

Reliability analysis   
Call: psych::alpha(x = support.alpha)

  raw_alpha std.alpha G6(smc) average_r S/N   ase mean sd median_r
      0.87      0.87    0.84      0.62 6.5 0.013  3.4  1     0.63

> a11 <- psych::alpha(innovate.alpha)
> a11

Reliability analysis   
Call: psych::alpha(x = innovate.alpha)

  raw_alpha std.alpha G6(smc) average_r S/N  ase mean  sd median_r
      0.69      0.69    0.64      0.36 2.2 0.03  3.5 0.8     0.33


## fit indices
> cfa3$dof
[1] 62
> cfa3$PVAL
[1] 0.07865495
> cfa3$STATISTIC #model chi
[1] 78.34289
> cfa3$RMSEA
     RMSEA      lower      upper confidence 
0.02995024 0.00000000 0.04905806 0.90000000 
> cfa3$rms
[1] 0.01925539


## Organizational Attraction
#alpha
> a7 <- psych::alpha(orgatrct.alpha, check.keys = TRUE) 
> a7

Reliability analysis   
Call: psych::alpha(x = orgatrct.alpha, check.keys = TRUE)

  raw_alpha std.alpha G6(smc) average_r S/N    ase mean   sd median_r
      0.96      0.96    0.96      0.63  26 0.0031  3.8 0.89     0.64

# fit
> cfa2$dof
[1] 90
> cfa2$PVAL
[1] 1.299747e-11
> cfa2$STATISTIC #model chi
[1] 210.1878
> cfa2$RMSEA
     RMSEA      lower      upper confidence 
0.06777141 0.05604938 0.07998018 0.90000000 
> cfa2$rms
[1] 0.03364803