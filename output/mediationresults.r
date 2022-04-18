
> summary(m1)
Call: mediate(y = Attraction ~ AVI + (Justice), data = scales)

Direct effect estimates (traditional regression)    (c') X + M on Y 
          Attraction   se     t  df     Prob
Intercept       0.68 0.22  3.15 287 1.80e-03
AVI             0.01 0.08  0.10 287 9.24e-01
Justice         0.90 0.05 16.75 287 2.21e-44

R = 0.78 R2 = 0.6   F = 217.76 on 2 and 287 DF   p-value:  2.89e-58 

 Total effect estimates (c) (X on Y) 
          Attraction   se     t  df      Prob
Intercept       4.21 0.07 63.52 288 1.96e-171
AVI            -0.83 0.09 -8.87 288  7.73e-17

 'a'  effect estimates (X on M) 
          Justice   se      t  df      Prob
Intercept    3.91 0.05  75.75 288 3.26e-192
AVI         -0.93 0.07 -12.74 288  8.49e-30

 'b'  effect estimates (M on Y controlling for X) 
        Attraction   se     t  df     Prob
Justice        0.9 0.05 16.75 287 2.21e-44

 'ab'  effect estimates (through mediators)
    Attraction  boot   sd lower upper
AVI      -0.84 -0.84 0.09 -1.03 -0.67
> m1

Mediation/Moderation Analysis 
Call: mediate(y = Attraction ~ AVI + (Justice), data = scales)

The DV (Y) was  Attraction . The IV (X) was  AVI . The mediating variable(s) =  Justice .

Total effect(c) of  AVI  on  Attraction  =  -0.83   S.E. =  0.09  t  =  -8.87  df=  288   with p =  7.7e-17
Direct effect (c') of  AVI  on  Attraction  removing  Justice  =  0.01   S.E. =  0.08  t  =  0.1  df=  287   with p =  0.92
Indirect effect (ab) of  AVI  on  Attraction  through  Justice   =  -0.84 
Mean bootstrapped indirect effect =  -0.84  with standard error =  0.09  Lower CI =  -1.03    Upper CI =  -0.67
R = 0.78 R2 = 0.6   F = 217.76 on 2 and 287 DF   p-value:  1.25e-73 

 To see the longer output, specify short = FALSE in the print statement or ask for the summary


> summary(m2)
Call: mediate(y = Attraction ~ AVI + (Competitiveness), data = scales)

Direct effect estimates (traditional regression)    (c') X + M on Y 
                Attraction   se      t  df     Prob
Intercept             2.08 0.18  11.26 287 1.37e-24
AVI                  -0.77 0.08 -10.01 287 1.99e-20
Competitiveness       0.57 0.05  12.09 287 1.82e-27

R = 0.69 R2 = 0.48   F = 132.25 on 2 and 287 DF   p-value:  1.97e-41 

 Total effect estimates (c) (X on Y) 
          Attraction   se     t  df      Prob
Intercept       4.21 0.07 63.52 288 1.96e-171
AVI            -0.83 0.09 -8.87 288  7.73e-17

 'a'  effect estimates (X on M) 
          Competitiveness   se     t  df      Prob
Intercept            3.72 0.07 55.40 288 1.25e-155
AVI                 -0.11 0.09 -1.19 288  2.36e-01

 'b'  effect estimates (M on Y controlling for X) 
                Attraction   se     t  df     Prob
Competitiveness       0.57 0.05 12.09 287 1.82e-27

 'ab'  effect estimates (through mediators)
    Attraction  boot   sd lower upper
AVI      -0.06 -0.06 0.06 -0.18  0.04
> m2

Mediation/Moderation Analysis 
Call: mediate(y = Attraction ~ AVI + (Competitiveness), data = scales)

The DV (Y) was  Attraction . The IV (X) was  AVI . The mediating variable(s) =  Competitiveness .

Total effect(c) of  AVI  on  Attraction  =  -0.83   S.E. =  0.09  t  =  -8.87  df=  288   with p =  7.7e-17
Direct effect (c') of  AVI  on  Attraction  removing  Competitiveness  =  -0.77   S.E. =  0.08  t  =  -10.01  df=  287   with p =  2e-20
Indirect effect (ab) of  AVI  on  Attraction  through  Competitiveness   =  -0.06 
Mean bootstrapped indirect effect =  -0.06  with standard error =  0.06  Lower CI =  -0.18    Upper CI =  0.04
R = 0.69 R2 = 0.48   F = 132.25 on 2 and 287 DF   p-value:  8.19e-54 

 To see the longer output, specify short = FALSE in the print statement or ask for the summary



 > summary(m3)
Call: mediate(y = Attraction ~ AVI + (Responsibility), data = scales)

Direct effect estimates (traditional regression)    (c') X + M on Y 
               Attraction   se     t  df     Prob
Intercept            1.93 0.18 10.49 287 5.24e-22
AVI                 -0.47 0.08 -5.92 287 9.41e-09
Responsibility       0.59 0.05 12.94 287 1.83e-30

R = 0.71 R2 = 0.5   F = 145.75 on 2 and 287 DF   p-value:  2.06e-44 

 Total effect estimates (c) (X on Y) 
          Attraction   se     t  df      Prob
Intercept       4.21 0.07 63.52 288 1.96e-171
AVI            -0.83 0.09 -8.87 288  7.73e-17

 'a'  effect estimates (X on M) 
          Responsibility   se     t  df      Prob
Intercept           3.89 0.07 56.68 288 3.04e-158
AVI                -0.61 0.10 -6.34 288  9.03e-10

 'b'  effect estimates (M on Y controlling for X) 
               Attraction   se     t  df     Prob
Responsibility       0.59 0.05 12.94 287 1.83e-30

 'ab'  effect estimates (through mediators)
    Attraction  boot   sd lower upper
AVI      -0.36 -0.36 0.07  -0.5 -0.23
> m3

Mediation/Moderation Analysis 
Call: mediate(y = Attraction ~ AVI + (Responsibility), data = scales)

The DV (Y) was  Attraction . The IV (X) was  AVI . The mediating variable(s) =  Responsibility .

Total effect(c) of  AVI  on  Attraction  =  -0.83   S.E. =  0.09  t  =  -8.87  df=  288   with p =  7.7e-17
Direct effect (c') of  AVI  on  Attraction  removing  Responsibility  =  -0.47   S.E. =  0.08  t  =  -5.92  df=  287   with p =  9.4e-09
Indirect effect (ab) of  AVI  on  Attraction  through  Responsibility   =  -0.36 
Mean bootstrapped indirect effect =  -0.36  with standard error =  0.07  Lower CI =  -0.5    Upper CI =  -0.23
R = 0.71 R2 = 0.5   F = 145.75 on 2 and 287 DF   p-value:  2.16e-57 

 To see the longer output, specify short = FALSE in the print statement or ask for the summary


 > summary(m4)
Call: mediate(y = Attraction ~ AVI + (Innovativeness), data = scales)

Direct effect estimates (traditional regression)    (c') X + M on Y 
               Attraction   se      t  df     Prob
Intercept            2.56 0.19  13.49 287 1.81e-32
AVI                 -0.88 0.08 -10.58 287 2.65e-22
Innovativeness       0.48 0.05   9.13 287 1.25e-17

R = 0.63 R2 = 0.39   F = 92.3 on 2 and 287 DF   p-value:  1.11e-31 

 Total effect estimates (c) (X on Y) 
          Attraction   se     t  df      Prob
Intercept       4.21 0.07 63.52 288 1.96e-171
AVI            -0.83 0.09 -8.87 288  7.73e-17

 'a'  effect estimates (X on M) 
          Innovativeness   se     t  df      Prob
Intercept           3.47 0.07 52.43 288 2.34e-149
AVI                 0.09 0.09  1.00 288  3.20e-01

 'b'  effect estimates (M on Y controlling for X) 
               Attraction   se    t  df     Prob
Innovativeness       0.48 0.05 9.13 287 1.25e-17

 'ab'  effect estimates (through mediators)
    Attraction boot   sd lower upper
AVI       0.04 0.04 0.04 -0.04  0.13
> m4

Mediation/Moderation Analysis 
Call: mediate(y = Attraction ~ AVI + (Innovativeness), data = scales)

The DV (Y) was  Attraction . The IV (X) was  AVI . The mediating variable(s) =  Innovativeness .

Total effect(c) of  AVI  on  Attraction  =  -0.83   S.E. =  0.09  t  =  -8.87  df=  288   with p =  7.7e-17
Direct effect (c') of  AVI  on  Attraction  removing  Innovativeness  =  -0.88   S.E. =  0.08  t  =  -10.58  df=  287   with p =  2.6e-22
Indirect effect (ab) of  AVI  on  Attraction  through  Innovativeness   =  0.04 
Mean bootstrapped indirect effect =  0.04  with standard error =  0.04  Lower CI =  -0.04    Upper CI =  0.13
R = 0.63 R2 = 0.39   F = 92.3 on 2 and 287 DF   p-value:  7.69e-42 

 To see the longer output, specify short = FALSE in the print statement or ask for the summary


 > summary(m5)
Call: mediate(y = Attraction ~ AVI + (Supportiveness), data = scales)

Direct effect estimates (traditional regression)    (c') X + M on Y 
               Attraction   se     t  df     Prob
Intercept            2.25 0.17 13.65 287 4.85e-33
AVI                 -0.35 0.08 -4.16 287 4.28e-05
Supportiveness       0.51 0.04 12.56 287 3.94e-29

R = 0.7 R2 = 0.49   F = 139.66 on 2 and 287 DF   p-value:  4.37e-43 

 Total effect estimates (c) (X on Y) 
          Attraction   se     t  df      Prob
Intercept       4.21 0.07 63.52 288 1.96e-171
AVI            -0.83 0.09 -8.87 288  7.73e-17

 'a'  effect estimates (X on M) 
          Supportiveness   se     t  df      Prob
Intercept           3.84 0.08 49.63 288 3.53e-143
AVI                -0.94 0.11 -8.60 288  5.11e-16

 'b'  effect estimates (M on Y controlling for X) 
               Attraction   se     t  df     Prob
Supportiveness       0.51 0.04 12.56 287 3.94e-29

 'ab'  effect estimates (through mediators)
    Attraction  boot   sd lower upper
AVI      -0.48 -0.48 0.07 -0.63 -0.34
> m5

Mediation/Moderation Analysis 
Call: mediate(y = Attraction ~ AVI + (Supportiveness), data = scales)

The DV (Y) was  Attraction . The IV (X) was  AVI . The mediating variable(s) =  Supportiveness .

Total effect(c) of  AVI  on  Attraction  =  -0.83   S.E. =  0.09  t  =  -8.87  df=  288   with p =  7.7e-17
Direct effect (c') of  AVI  on  Attraction  removing  Supportiveness  =  -0.35   S.E. =  0.08  t  =  -4.16  df=  287   with p =  4.3e-05
Indirect effect (ab) of  AVI  on  Attraction  through  Supportiveness   =  -0.48 
Mean bootstrapped indirect effect =  -0.48  with standard error =  0.07  Lower CI =  -0.63    Upper CI =  -0.34
R = 0.7 R2 = 0.49   F = 139.66 on 2 and 287 DF   p-value:  8.37e-56 

 To see the longer output, specify short = FALSE in the print statement or ask for the summary



 > summary(mm.max)
Call: mediate(y = Attraction ~ AVI + (Justice) + (Innovativeness) + 
    (Responsibility) + (Supportiveness) + (Competitiveness), 
    data = scales)

Direct effect estimates (traditional regression)    (c') X + M on Y 
                Attraction   se     t  df     Prob
Intercept             0.22 0.21  1.05 283 2.97e-01
AVI                  -0.07 0.08 -0.89 283 3.77e-01
Justice               0.61 0.06 10.31 283 2.34e-21
Innovativeness        0.03 0.06  0.48 283 6.31e-01
Responsibility        0.09 0.07  1.20 283 2.33e-01
Supportiveness        0.13 0.06  2.16 283 3.13e-02
Competitiveness       0.19 0.06  3.13 283 1.92e-03

R = 0.83 R2 = 0.68   F = 102.46 on 6 and 283 DF   p-value:  5.46e-68 

 Total effect estimates (c) (X on Y) 
          Attraction   se     t  df      Prob
Intercept       4.21 0.07 63.52 288 1.96e-171
AVI            -0.83 0.09 -8.87 288  7.73e-17

 'a'  effect estimates (X on M) 
          Justice   se      t  df      Prob
Intercept    3.91 0.05  75.75 288 3.26e-192
AVI         -0.93 0.07 -12.74 288  8.49e-30
          Innovativeness   se     t  df      Prob
Intercept           3.47 0.07 52.43 288 2.34e-149
AVI                 0.09 0.09  1.00 288  3.20e-01
          Responsibility   se     t  df      Prob
Intercept           3.89 0.07 56.68 288 3.04e-158
AVI                -0.61 0.10 -6.34 288  9.03e-10
          Supportiveness   se     t  df      Prob
Intercept           3.84 0.08 49.63 288 3.53e-143
AVI                -0.94 0.11 -8.60 288  5.11e-16
          Competitiveness   se     t  df      Prob
Intercept            3.72 0.07 55.40 288 1.25e-155
AVI                 -0.11 0.09 -1.19 288  2.36e-01

 'b'  effect estimates (M on Y controlling for X) 
                Attraction   se     t  df     Prob
Justice               0.61 0.06 10.31 283 2.34e-21
Innovativeness        0.03 0.06  0.48 283 6.31e-01
Responsibility        0.09 0.07  1.20 283 2.33e-01
Supportiveness        0.13 0.06  2.16 283 3.13e-02
Competitiveness       0.19 0.06  3.13 283 1.92e-03

 'ab'  effect estimates (through mediators)
    Attraction  boot   sd lower upper
AVI      -0.76 -0.57 0.09 -0.76  -0.4

 'ab' effects estimates for each mediator for Attraction 

 > mm.max

Mediation/Moderation Analysis 
Call: mediate(y = Attraction ~ AVI + (Justice) + (Innovativeness) + 
    (Responsibility) + (Supportiveness) + (Competitiveness), 
    data = scales)

The DV (Y) was  Attraction . The IV (X) was  AVI . The mediating variable(s) =  Justice Innovativeness Responsibility Supportiveness Competitiveness .

Total effect(c) of  AVI  on  Attraction  =  -0.83   S.E. =  0.09  t  =  -8.87  df=  288   with p =  7.7e-17
Direct effect (c') of  AVI  on  Attraction  removing  Justice Innovativeness Responsibility Supportiveness Competitiveness  =  -0.07   S.E. =  0.08  t  =  -0.89  df=  283   with p =  0.38
Indirect effect (ab) of  AVI  on  Attraction  through  Justice Innovativeness Responsibility Supportiveness Competitiveness   =  -0.76 
Mean bootstrapped indirect effect =  -0.57  with standard error =  0.09  Lower CI =  -0.76    Upper CI =  -0.4
R = 0.83 R2 = 0.68   F = 102.46 on 6 and 283 DF   p-value:  8.37e-74 

 To see the longer output, specify short = FALSE in the print statement or ask for the summary
> 