#libraries
library(careless)
library(tidyr)
library(dplyr)
library(reshape2)


#import data
df <- read.csv("data/data_04.13.22.csv", header=TRUE)


"DATA PREPARATION FROM RAW FILE
-Delete unnecessary rows
-Delete unnecessary columns
-Delete cases that fail ATCs
-Screen extremely fast response
-Recode response options
-Change variable classes
-Recode reverse scored items
-Screen careless responding
-Restructure dataframes 
-Compute scale scores
-create subsets
-create indicator variable for cond.
-Export to CSV files
"

## DELETE ROWS ##
# Delete unnecessary rows ##
df <- slice(df, -c(1:2))

# Delete all cases that did not agree to consent #
df <- subset(df, IC!="No, I do not want to be in this research study.")

# Delete cases that were practice runs by researchers #
df <- subset(df, JOB1!="cory test" & JOB1!="a")



## DELETE COLUMNS ##
df <- df %>%
  select(-c(StartDate,
            EndDate,
            Status,
            IPAddress,
            Progress,
            Finished,
            RecordedDate,
            ResponseId,
            RecipientLastName,
            RecipientFirstName,
            RecipientEmail,
            ExternalReference,
            LocationLatitude,
            LocationLongitude,
            DistributionChannel,
            UserLanguage,
            IC,
            TIMEA_First.Click,
            TIMEA_Last.Click,
            TIMEA_Page.Submit,
            TIMEA_Click.Count,
            TIMEB_First.Click,
            TIMEB_Last.Click,
            TIMEB_Page.Submit,
            TIMEB_Click.Count,
            ATC3,
            GROUP))


## DELETE CASES THAT FAIL ATCs ##  <------ consider changing to 3 out of 4 (the breakdown is odd: ~33 missed AT1, ~15 missed ATC2, ~3-5 missed ATC4 and OCP1B_17 respectively)
df <- subset(df, 
               ATC1=="Strongly agree" & 
               ATC2=="Somewhat disagree" & 
               ATC4=="Neither agree nor disagree" & 
               OCP1B_17=="Very much") 


## DELETE FAST RESPONSE ##
df$Duration..in.seconds. <- as.numeric(df$Duration..in.seconds.)
df <- df %>% 
  filter(Duration..in.seconds. > 300)

# delete ATCs and Duration columns
df <- df %>%
  select(-c(Duration..in.seconds.,
            ATC1,
            ATC2,
            ATC4,
            OCP1B_17))


### RECODE RESPONSE OPTIONS ###
df[df=="Strongly disagree"] <- 1
df[df=="Somewhat disagree"] <- 2
df[df=="Neither agree nor disagree"] <-3
df[df=="Somewhat agree"] <- 4
df[df=="Strongly agree"] <- 5
df[df=="Not at all"] <- 1
df[df=="Minimally"] <- 2
df[df=="Moderately"] <- 3
df[df=="Considerably"] <- 4
df[df=="Very much"] <- 5



### CHANGE VARIABLE CLASSES ###
df[,2:99] <- lapply(df[,2:99], as.numeric)


### RECODE REVERSE SCORED ITEMS ###
df$GA2A <- 6 - df$GA2A
df$GA2B <- 6 - df$GA2B

### SCREEN CARELESS RESPONSE #
longstring <- longstring(df[,2:99], avg=TRUE)
boxplot(longstring)
longstring
ls <- longstring$longstr
df$ls <- ls #bind longstring values to df 
names(df)

df <- df %>% #deletes cases with longstrings >= 28 (outliers)
  filter(ls < 28)

df$ls <- NULL #remove ls column
rm(ls, longstring)


### RESTRUCTURE DATAFRAME / CREATE SUBSETS ###
#create item and demo subset 
items.wide <- df[,2:99]
demo <- df[c(1, 100:115)]


#rename demo columns for cbind later
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


#### create item.long dataset
#rename items for creating items.long
items.wide.z <- items.wide %>%
  rename(A_TBD1 = TBD1A,
         A_TBD2 = TBD2A,
         A_CJR1 = CJR1A,
         A_PJR1 = PJR1A,
         A_OTP1 = OTP1A,
         A_COA1 = COA1A, 
         A_COA2 = COA2A, 
         A_COA3 = COA3A, 
         A_RO1 = RO1A, 
         A_TRM1 = TRM1A,
         A_TRM2 = TRM2A,
         A_TRM3 = TRM3A, 
         A_TRM4 = TRM4A,
         A_TWC1 = TWC1A, 
         A_TWC2 = TWC2A, 
         A_TWC3 = TWC3A,
         A_TWC4 = TWC4A,
         A_TWC5 = TWC5A, 
         A_GA1 = GA1A, 
         A_GA2 = GA2A, 
         A_GA3 = GA3A,
         A_GA4 = GA4A,
         A_GA5 = GA5A,
         A_IP1 = IP1A,
         A_IP2 = IP2A,
         A_IP3 = IP3A,
         A_IP4 = IP4A,
         A_IP5 = IP5A,
         A_PRS1 = PRS1A,
         A_PRS2 = PRS2A,
         A_PRS3 = PRS3A,
         A_PRS4 = PRS4A,
         A_PRS5 = PRS5A, 
         A_OCP1 = OCP1A_1,
         A_OCP2 = OCP1A_2,
         A_OCP3 = OCP1A_3,
         A_OCP4 = OCP1A_4,
         A_OCP5 = OCP1A_5,
         A_OCP6 = OCP1A_6,
         A_OCP7 = OCP1A_7,
         A_OCP8 = OCP1A_8,
         A_OCP9 = OCP1A_9,
         A_OCP10 = OCP1A_10,
         A_OCP11 = OCP1A_11,
         A_OCP12 = OCP1A_12,
         A_OCP13 = OCP1A_13,
         A_OCP14 = OCP1A_14,
         A_OCP15 = OCP1A_15,
         A_OCP16 = OCP1A_16,
         B_TBD1 = TBD1B,
         B_TBD2 = TBD2B, 
         B_CJR1 = CJR1B,
         B_PJR1 = PJR1B,
         B_OTP1 = OTP1B,
         B_COA1 = COA1B, 
         B_COA2 = COA2B, 
         B_COA3 = COA3B, 
         B_RO1 = RO1B, 
         B_TRM1 = TRM1B,
         B_TRM2 = TRM2B,
         B_TRM3 = TRM3B, 
         B_TRM4 = TRM4B, 
         B_TWC1 = TWC1B, 
         B_TWC2 = TWC2B, 
         B_TWC3 = TWC3B,
         B_TWC4 = TWC4B,
         B_TWC5 = TWC5B, 
         B_GA1 = GA1B, 
         B_GA2 = GA2B, 
         B_GA3 = GA3B,
         B_GA4 = GA4B,
         B_GA5 = GA5B,
         B_IP1 = IP1B,
         B_IP2 = IP2B,
         B_IP3 = IP3B,
         B_IP4 = IP4B,
         B_IP5 = IP5B,
         B_PRS1 = PRS1B,
         B_PRS2 = PRS2B,
         B_PRS3 = PRS3B,
         B_PRS4 = PRS4B,
         B_PRS5 = PRS5B, 
         B_OCP1 = OCP1B_1,
         B_OCP2 = OCP1B_2,
         B_OCP3 = OCP1B_3,
         B_OCP4 = OCP1B_4,
         B_OCP5 = OCP1B_5,
         B_OCP6 = OCP1B_6,
         B_OCP7 = OCP1B_7,
         B_OCP8 = OCP1B_8,
         B_OCP9 = OCP1B_9,
         B_OCP10 = OCP1B_10,
         B_OCP11 = OCP1B_11,
         B_OCP12 = OCP1B_12,
         B_OCP13 = OCP1B_13,
         B_OCP14 = OCP1B_14,
         B_OCP15 = OCP1B_15,
         B_OCP16 = OCP1B_16)
                       
                       
#create items.long
id <- 1:145 #match # of rows in scales.wide before moving forward
items.wide.z$id <- id #creating ID to track subject

long <- items.wide.z %>% #step 1. create long df
  pivot_longer(c(A_TBD1:B_OCP16),
               names_to = c(".value","item"), names_sep = "_")

longer <- melt(long, id=c("id","item")) #step 2. create longer df

items.long <- spread(longer, key = item, value=value) #step 3. spread df by scale

# reorder columns
col_order <- c("id", "variable", "TBD1", "TBD2", "CJR1", "PJR1", "OTP1", "COA1", "COA2", "COA3", "RO1", "TRM1", "TRM2", "TRM3","TRM4","TWC1","TWC2","TWC3","TWC4","TWC5","GA1","GA2","GA3","GA4","GA5","IP1","IP2","IP3","IP4","IP5","PRS1","PRS2","PRS3","PRS4","PRS5","OCP1","OCP2","OCP3","OCP4","OCP5","OCP6","OCP7","OCP8","OCP9","OCP10","OCP11","OCP12","OCP13","OCP14","OCP15","OCP16")

items.long <- items.long[, col_order]

# change name of column from 'variable' to 'condition'
items.long <- rename(items.long, condition = variable)

# rename levels of 'condition' 
levels(items.long$condition) <- c("AVI", "Traditional")


### COMPUTE (MEAN) SCALE SCORES ###
items.wide$A_procjust <- round(with(items.wide,(TBD1A+TBD2A+CJR1A+PJR1A+OTP1A+COA1A+COA2A+COA3A+RO1A) / 9),2) #procedural justice A

items.wide$A_interjust <- round(with(items.wide, (TRM1A+TRM2A+TRM3A+TRM4A+TWC1A+TWC2A+TWC3A+TWC4A+TWC5A) / 9),2) #interpersonal justice A

items.wide$A_orgjust <- round(with(items.wide, (A_procjust + A_interjust) / 2),2) #organizational justice A

items.wide$A_genatrct <- round(with(items.wide, (GA1A+GA2A+GA3A+GA4A+GA5A) / 5),2) #general attraction A

items.wide$A_intpurs <- round(with(items.wide, (IP1A+IP2A+IP3A+IP4A+IP5A) / 5),2) #intent to pursue A

items.wide$A_prest <- round(with(items.wide, (PRS1A+PRS2A+PRS3A+PRS4A+PRS5A) / 5),2) #prestige A

items.wide$A_orgatrct <- round(with(items.wide, (A_genatrct+A_intpurs+A_prest) / 3),2) #organizational attraction A

items.wide$A_compete <- round(with(items.wide, (OCP1A_1+OCP1A_2+OCP1A_3+OCP1A_4) / 4),2) #competitiveness A

items.wide$A_socresp <- round(with(items.wide, (OCP1A_5+OCP1A_6+OCP1A_7+OCP1A_8) / 4),2) #social responsibility A

items.wide$A_support <- round(with(items.wide, (OCP1A_9+OCP1A_10+OCP1A_11+OCP1A_12) / 4),2) #supportiveness A

items.wide$A_innovate <- round(with(items.wide, (OCP1A_13+OCP1A_14+OCP1A_15+OCP1A_16) / 4),2) #innovativeness A

items.wide$B_procjust <- round(with(items.wide,(TBD1B+TBD2B+CJR1B+PJR1B+OTP1B+COA1B+COA2B+COA3B+RO1B) / 9),2) #procedural justice B

items.wide$B_interjust <- round(with(items.wide, (TRM1B+TRM2B+TRM3B+TRM4B+TWC1B+TWC2B+TWC3B+TWC4B+TWC5B) / 9),2) #interpersonal justice B

items.wide$B_orgjust <- round(with(items.wide, (B_procjust + B_interjust) / 2),2) #organizational justice B

items.wide$B_genatrct <- round(with(items.wide, (GA1B+GA2B+GA3B+GA4B+GA5B) / 5),2) #general attraction B

items.wide$B_intpurs <- round(with(items.wide, (IP1B+IP2B+IP3B+IP4B+IP5B) / 5),2) #intent to pursue B

items.wide$B_prest <- round(with(items.wide, (PRS1B+PRS2B+PRS3B+PRS4B+PRS5B) / 5),2) #prestige B

items.wide$B_orgatrct <- round(with(items.wide, (B_genatrct+B_intpurs+B_prest) / 3),2) #organizational attraction B

items.wide$B_compete <- round(with(items.wide, (OCP1B_1+OCP1B_2+OCP1B_3+OCP1B_4) / 4),2) #competitiveness B

items.wide$B_socresp <- round(with(items.wide, (OCP1B_5+OCP1B_6+OCP1B_7+OCP1B_8) / 4),2) #social responsibility B

items.wide$B_support <- round(with(items.wide, (OCP1B_9+OCP1B_10+OCP1B_11+OCP1B_12) / 4),2) #supportiveness B

items.wide$B_innovate <- round(with(items.wide, (OCP1B_13+OCP1B_14+OCP1B_15+OCP1B_16) / 4),2) #innovativeness B



#### create scale subset
scales.wide <- items.wide[,99:120]
id <- 1:145 #match # of rows in scales.wide before moving forward
scales.wide$id <- id #creating ID to track subject

scales.wide <- cbind(scales.wide, demo[c("sex","ethnicity","age","employ1")]) #bind demo variables

long <- scales.wide %>% #step 1. create long df
  pivot_longer(c(A_procjust:B_innovate),
               names_to = c(".value","scale"), names_sep = "_")

longer <- melt(long, id=c("id","sex","ethnicity","age","employ1","scale")) #step 2. create longer df

scales.long <- spread(longer, key = scale, value=value) #step 3. spread df by scale

# reorder columns
col_order <- c("id","sex","ethnicity","age","employ1","variable", "procjust", "interjust", "orgjust", "genatrct", "intpurs", "prest", "orgatrct", "compete", "socresp", "support", "innovate")

scales.long <- scales.long[, col_order]

# change name of column from 'variable' to 'condition'
scales.long <- rename(scales.long, condition = variable)

# rename levels of 'condition' 
levels(scales.long$condition) <- c("AVI", "Traditional")

# create indicator variable for condition
scales.long$AVI.id <- ifelse(scales.long$condition == "AVI", 1, 0)

scales.long <- scales.long %>% # relocates AVI.id column to more convenient spot in df
  relocate(AVI.id, .before = procjust)

#remove extra columns from 'items' data frame before export
items <- items %>%
  select(-c(99:120))

rm(df, long, longer)

##### Export dataframes to CSV files to be imported for analysis in other scripts
write.csv(demo, "data/demographic_data.csv", row.names = FALSE)
write.csv(items.wide, "data/cleaned_itemdata.wide.csv", row.names = FALSE)
write.csv(items.long, "data/cleaned_itemdata.long.csv", row.names = FALSE)
write.csv(scales.wide, "data/cleaned_scaledata_wide.csv", row.names = FALSE)
write.csv(scales.long, "data/cleaned_scaledata_long.csv", row.names = FALSE)
