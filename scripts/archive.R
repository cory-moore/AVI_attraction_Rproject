
## looking at variables by groups  ## NOT REQUIRED
desc_orgjust <- scales %>% 
  group_by(condition) %>% 
  summarise(count = length(Organizational_Justice),
            means= mean(Organizational_Justice),
            SDs = sd(Organizational_Justice))

desc_orgatrct <- scales %>% 
  group_by(condition) %>% 
  summarise(count = length(Organizational_Attraction),
            means= mean(Organizational_Attraction),
            SDs = sd(Organizational_Attraction))
desc_orgjust
desc_orgatrct


rm(desc_orgatrct, desc_orgjust)


###### ANOVAs #####
aov1<- aov(Organizational_Justice ~ AVI + Error(id/AVI), data = scales) #Error(id/AVI) makes this a within-subjects ANOVA
summary(aov1)

aov2 <- aov(Innovativeness ~ AVI + Error(id/AVI), data=scales)
summary(aov2)

aov3 <- aov(Supportiveness ~ AVI + Error(id/AVI), data=scales)
summary(aov3)

aov4 <- aov(Competiveness ~ AVI + Error(id/AVI), data=scales)
summary(aov4)

aov5 <- aov(Social_Responsibility ~ AVI + Error(id/AVI), data=scales)
summary(aov5)

aov6 <- aov(Organizational_Attraction ~ AVI + Error(id/AVI), data=scales)
summary(aov6)

rm(aov1, aov2, aov3, aov4, aov5, aov6)