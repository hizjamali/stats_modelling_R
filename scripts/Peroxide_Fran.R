library(lmerTest)
library(tidyverse)
library(ggplot2)
library(emmeans)
library(reshape2)


peroxide <- read.csv(("data/Peroxide_PCR.csv"))   #upload data

str(peroxide) #check data types in data set
View(peroxide)

peroxide$Treat_dose <- factor(peroxide$Treat_dose) #overwrites column keeping column name same
peroxide$Treat_temp <- factor(peroxide$Treat_temp)
#photo$Temp <- factor(photo$Temp)

#Plot data
ggplot(peroxide, aes(Treat_temp, Amoeba_abundance, colour=Treat_dose)) +
  geom_boxplot() #+ labs(x="Position", y= "Photosynthesis")


# Model data
lmer3=lmer(Amoeba_abundance~Treat_dose + Treat_temp + (1|Tank), data=peroxide)
anova(lmer3)
summary(lmer3)

#check model assumptions
plot(lmer3) 


emmeans(lmer1, ~Temp)
emmeans(lmer1, pairwise~Temp)

