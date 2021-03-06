#libraries                 
library(psych)
library(car)
library(dplyr)
library(ggplot2)
library(apaTables)
library(corrplot)
library(Hmisc)
library(ggcorrplot)
library(xlsx)
library(mediation)
library(tidyr)
library(lm.beta)

#import data
scales <- read.csv("data/cleaned_scaledata_long.csv", header=TRUE)


#rename and recode 
scales <- scales %>%
  rename(id = id,
         Sex = sex,
         Ethnicity = ethnicity,
         Age = age,
         Employment = employ1,
         Condition = condition,
         AVI = AVI.id,
         P_Justice=procjust,
         I_Justice=interjust,
         Justice=orgjust,
         G_Attraction = genatrct,
         Pursuit = intpurs, 
         Prestige = prest,
         Attraction = orgatrct,
         Competitiveness =compete,
         Responsibility = socresp,
         Supportiveness = support,
         Innovativeness = innovate)


scales$Sex <- as.numeric(recode(scales$Sex, 
                     "Male" = "1",
                     "Female" = "2",
                     "Other" = "3",
                     "Prefer not to respond" = "4"))
scales$Ethnicity <- as.numeric(recode(scales$Ethnicity,
                           "White" = "1",
                           "Black or African American" = "2",
                           "American Indian or Alaska Native" = "3",
                           "Asian" = "4",
                           "Native Hawaiian or Pacific Islander" = "5",
                           "Other" = "6",
                           "Prefer not to respond" = "7"))
scales$Employment <- as.numeric(recode(scales$Employment,
                                       "Employed full time" = "1",
                                       "Employed part time" = "2",
                                       "Unemployed looking for work" = "3",
                                       "Unemployed not looking for work" = "4",
                                       "Retired" = "5",
                                       "Student" = "6"))
scales$Age <- as.numeric(scales$Age)

scales$Condition <- NULL
      
                  


"##########################
DATA ANALYSIS:
correlations
regression
mediation
###########################"

##### first, create data subsets for correlations #####
prim.corr.df <- subset(scales, 
                       select=c(Sex,
                                Ethnicity,
                                Age,
                                Employment,
                                AVI,
                                Justice,
                                Attraction,
                                Competitiveness,
                                Responsibility,
                                Supportiveness,
                                Innovativeness)) #df for cor's both conditions

corr.df <- scales[,2:17] #subscales both conditions

corr.df.AVI <- scales[scales$AVI == "1",] ##dfs for cor's for AVI cond
corr.df.AVI <- corr.df.AVI[,2:17] ## subscales
corr.df.AVI <- subset(corr.df.AVI, 
                      select=c(Sex,
                               Ethnicity,
                               Age,
                               Employment,
                               Justice,
                               Attraction,
                               Competitiveness,
                               Responsibility,
                               Supportiveness,
                               Innovativeness)) #broad scales

corr.df.trad <- scales[scales$AVI== "0",] ##df for cor's for AVI cond
corr.df.trad <- corr.df.trad[,2:17] #subscales
corr.df.trad <- subset(corr.df.trad, 
                       select=c(Sex,
                                Ethnicity,
                                Age,
                                Employment,
                                Justice,
                                Attraction,
                                Competitiveness,
                                Responsibility,
                                Supportiveness,
                                Innovativeness)) #broad scales



##### correlation analyses #####
prim.corr.matrix <- round(cor(prim.corr.df, use = "complete.obs"),3)
ggcorrplot(prim.corr.matrix, title = "Full Scales", lab=TRUE) 
prim.corr.matrix

corr.matrix <- round(cor(corr.df, use = "complete.obs"),3) 
ggcorrplot(corr.matrix, title = "Subscales", lab=TRUE) 
corr.matrix

corr.matrix.AVI <- round(cor(corr.df.AVI, use = "complete.obs"),3) 
ggcorrplot(corr.matrix.AVI, title="Full Scales, AVI Condition", lab=TRUE)
corr.matrix.AVI

corr.matrix.trad <- round(cor(corr.df.trad, use = "complete.obs"),3) 
ggcorrplot(corr.matrix.trad, title="Full Scales, Traditional Condition", lab=TRUE)
corr.df.trad



#excel
write.xlsx(as.data.frame(prim.corr.matrix), file="output/output.xlsx",sheetName="cor.primary", col.names=TRUE,row.names=TRUE,append=TRUE)

write.xlsx(as.data.frame(corr.matrix), file="output/output.xlsx",sheetName="cor.subscales",col.names=TRUE,row.names=TRUE,append=TRUE)

write.xlsx(as.data.frame(corr.matrix.AVI), file="output/output.xlsx",sheetName="cor.AVI",col.names=TRUE,row.names=TRUE,append=TRUE)

write.xlsx(as.data.frame(corr.matrix.trad), file="output/output.xlsx",sheetName="cor.Trad",col.names=TRUE,row.names=TRUE,append=TRUE)


rm(prim.corr.df, cor, corr.df, corr.df.AVI, corr.df.trad, corr.matrix, corr.matrix.AVI, corr.matrix.trad, prim.corr.matrix)



###### REGRESSIONs ######
max.mod <- lm(Attraction ~ AVI + Justice + Innovativeness + Supportiveness + Responsibility + Competitiveness, data = scales) 
summary(max.mod)
tidy.mod.max <- tidy(max.mod)

mod1 <- lm(Justice ~ AVI, data=scales)
summary(mod1)
lm.beta(mod1)
tidy.mod1 <- tidy(mod1)

mod2 <- lm(Competitiveness ~ AVI, data=scales)
summary(mod2)
tidy.mod2 <- tidy(mod2)

mod3 <- lm(Responsibility ~ AVI, data=scales)
summary(mod3)
tidy.mod3 <- tidy(mod3)

mod4 <- lm(Innovativeness ~ AVI, data=scales)
summary(mod4)
tidy.mod4 <- tidy(mod4)

mod5 <- lm(Supportiveness ~ AVI, data=scales)
summary(mod5)
tidy.mod5 <- tidy(mod5)

mod6 <- lm(Attraction ~ AVI, data=scales)
summary(mod6)
tidy.mod6 <- tidy(mod6)

mod7 <- lm(Attraction ~ Justice, data=scales)
summary(mod7)
tidy.mod7 <- tidy(mod7)

mod8 <- lm(Attraction ~ Competitiveness, data=scales)
summary(mod8)
tidy.mod8 <- tidy(mod8)

mod9 <- lm(Attraction ~ Responsibility, data=scales)
summary(mod9)
tidy.mod9 <- tidy(mod9)

mod10 <- lm(Attraction ~ Innovativeness, data=scales)
summary(mod10)
tidy.mod10 <- tidy(mod10)

mod11 <- lm(Attraction ~ Supportiveness, data=scales)
summary(mod11)
tidy.mod11 <- tidy(mod11)


# regressions controlling for Justice and/or AVI
con1 <- lm(Attraction ~ Competitiveness + Justice, data=scales)
summary(con1)

con2 <- lm(Attraction ~ Innovativeness + Justice, data=scales)
summary(con2)

con3 <- lm(Attraction ~ Responsibility + Justice, data=scales)
summary(con3)

con4 <- lm(Attraction ~ Supportiveness + Justice, data=scales)
summary(con4)

con5 <- lm(Attraction ~ AVI + Justice + Competitiveness, data=scales)
summary(con5)

con6 <- lm(Attraction ~ AVI + Innovativeness + Justice, data=scales)
summary(con6)


#Excel
write.xlsx(as.data.frame(tidy.mod1), file="output/output.xlsx",sheetName="lm1.justice",col.names=TRUE,row.names=FALSE,append=TRUE)

write.xlsx(as.data.frame(tidy.mod2), file="output/output.xlsx",sheetName="lm2.compete",col.names=TRUE,row.names=FALSE,append=TRUE)

write.xlsx(as.data.frame(tidy.mod3), file="output/output.xlsx",sheetName="lm3.responsibility",col.names=TRUE,row.names=FALSE,append=TRUE)

write.xlsx(as.data.frame(tidy.mod4), file="output/output.xlsx",sheetName="lm4.innovate",col.names=TRUE,row.names=FALSE,append=TRUE)

write.xlsx(as.data.frame(tidy.mod5), file="output/output.xlsx",sheetName="lm5.support",col.names=TRUE,row.names=FALSE,append=TRUE)

write.xlsx(as.data.frame(tidy.mod6), file="output/output.xlsx",sheetName="lm6.attract",col.names=TRUE,row.names=FALSE,append=TRUE)

write.xlsx(as.data.frame(tidy.mod7), file="output/output.xlsx",sheetName="lm7.attract2",col.names=TRUE,row.names=FALSE,append=TRUE)

write.xlsx(as.data.frame(tidy.mod8), file="output/output.xlsx",sheetName="lm8.attract3",col.names=TRUE,row.names=FALSE,append=TRUE)

write.xlsx(as.data.frame(tidy.mod9), file="output/output.xlsx",sheetName="lm9.attract4",col.names=TRUE,row.names=FALSE,append=TRUE)

write.xlsx(as.data.frame(tidy.mod10), file="output/output.xlsx",sheetName="lm10.attract5",col.names=TRUE,row.names=FALSE,append=TRUE)

write.xlsx(as.data.frame(tidy.mod11), file="output/output.xlsx",sheetName="lm11.attract6",col.names=TRUE,row.names=FALSE,append=TRUE)

write.xlsx(as.data.frame(tidy.mod.max), file="output/output.xlsx",sheetName="lm.max.attract",col.names=TRUE,row.names=FALSE,append=TRUE)




##### MEDIATIONs #####

#multiple regressions needed for meditate()
mod12 <- lm(Attraction ~ AVI + Competitiveness, data=scales)
mod13 <- lm(Attraction ~ AVI + Responsibility, data=scales)
mod14 <- lm(Attraction ~ AVI + Supportiveness, data=scales)
mod15 <- lm(Attraction ~ AVI + Innovativeness, data=scales)
mod16 <- lm(Attraction ~ AVI + Justice, data=scales)


#simple mediation models

# x = AVI, m = OCP dimensions, y = attraction
me1 <- mediation::mediate(mod2, mod12, treat="AVI", mediator="Competitiveness",sims=500, dropobs=TRUE) 
summary(me1)
lm.beta(me1)
tidy.me1 <- tidy(me1, conf.int = TRUE, conf.level = .95)

me2 <- mediation::mediate(mod3, mod13, treat="AVI", mediator="Responsibility",sims=500, dropobs=TRUE)
summary(me2)
tidy.me2 <- tidy(me2, conf.int = TRUE, conf.level = .95)
tidy.me2

me3 <- mediation::mediate(mod5, mod14, treat="AVI", mediator="Supportiveness",sims=500, dropobs=TRUE)
summary(me3)
tidy.me3 <- tidy(me3, conf.int = TRUE, conf.level = .95)

me4 <- mediation::mediate(mod4, mod15, treat="AVI", mediator="Innovativeness",sims=500, dropobs=TRUE) 
summary(me4)
tidy.me4 <- tidy(me4, conf.int = TRUE, conf.level = .95)

# x = AVI, m = Justice, y = attraction
me5 <- mediation::mediate(mod1, mod16, treat="AVI", mediator="Justice",sims=500, dropobs=TRUE)
summary(me5)
tidy.me5 <- tidy(me5, conf.int = TRUE, conf.level = .95)


#excel 
write.xlsx(as.data.frame(tidy.me1), file="output/output.xlsx",sheetName="med1.compete",col.names=TRUE,row.names=FALSE,append=TRUE)

write.xlsx(as.data.frame(tidy.me2), file="output/output.xlsx",sheetName="med2.responsibility",col.names=TRUE,row.names=FALSE,append=TRUE)

write.xlsx(as.data.frame(tidy.me3), file="output/output.xlsx",sheetName="med3.support",col.names=TRUE,row.names=FALSE,append=TRUE)

write.xlsx(as.data.frame(tidy.me4), file="output/output.xlsx",sheetName="med4.innovate",col.names=TRUE,row.names=FALSE,append=TRUE)

write.xlsx(as.data.frame(tidy.me5), file="output/output.xlsx",sheetName="med5.justice",col.names=TRUE,row.names=FALSE,append=TRUE)
