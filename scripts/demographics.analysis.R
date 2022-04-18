#libraries 
library(dplyr)
library(tidyr)
library(psych)

#import data
demo <- read.csv("data/demographic_data.csv", header=TRUE)

"#########################
DATA PREP:
rename columns
separate employ column
change variable classes
demographic descriptive stats
##########################"


##### rename columns
demo <- rename(demo,
               job = JOB1, 
               sex = DEM1,
               ethnicity = DEM2,
               age = DEM3, 
               employ = DEM4,
               edu = DEM5)


##### separate employ column into employ 1 and employ 2
demo <- separate(demo, col=employ, into=c("employ1", "employ2"), sep=",")


##### change variable classes
demo <- demo %>%
  mutate(job=as.factor(job),
         sex=as.factor(sex),
         ethnicity=as.factor(ethnicity),
         age=as.numeric(age),
         employ1=as.factor(employ1),
         employ2=as.factor(employ2),
         edu=as.factor(edu),
         FAM1=as.factor(FAM1),
         FAM2=as.factor(FAM2),
         FAM3=as.factor(FAM3))


##### demographic descrtiptive stats #####

sex.perc <- demo %>% #count/proportions by sex
  group_by(sex) %>%
  summarise(n = n()) %>%
  mutate(freq = round(n / sum(n), 3)) %>%
  arrange(desc(freq))
sex.perc

# to excel output
write.xlsx(as.data.frame(sex.perc), file="output/output.xlsx",sheetName="sex%",col.names=TRUE,row.names=FALSE,append=TRUE)

ethnicity.perc <- demo %>% #count/proportions by ethnicity
  group_by(ethnicity) %>%
  summarise(n = n()) %>%
  mutate(freq = round(n / sum(n), 3)) %>%
  arrange(desc(freq))
ethnicity.perc

# to excel output
write.xlsx(as.data.frame(ethnicity.perc), file="output/output.xlsx",sheetName="ethnicity%",col.names=TRUE,row.names=FALSE,append=TRUE)

employment.perc <- demo %>% #count/proportions by ethnicity
  group_by(employ1) %>%
  summarise(n = n()) %>%
  mutate(freq = round(n / sum(n), 3)) %>%
  arrange(desc(freq))
employment.perc

employment.perc2 <- demo %>% #count/proportions by ethnicity
  group_by(employ2) %>%
  summarise(n = n()) %>%
  mutate(freq = round(n / sum(n), 3)) %>%
  arrange(desc(freq))
employment.perc2

#mean, min/max, and SD for age'
age <- describe(demo$age) 
age

#to excel output
write.xlsx(as.data.frame(age), file="output/output.xlsx",sheetName="age",col.names=TRUE,row.names=FALSE,append=TRUE)
