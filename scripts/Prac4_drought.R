library(lmerTest)
library(tidyverse)
library(ggplot2)
library(emmeans)
library(reshape2)


drought <- read_csv(("data/Prac4_drought_data.csv"))   #upload data

str(drought) #check data types in data set
View(drought)

drought$plant <- factor(drought$plant) #overwrites column keeping column name same

#Set reference levels
drought$Genotype <- relevel(drought$Genotype, ref="WT")
drought$WaterCondition <- relevel(drought$WaterCondition, ref="Normal")


#Plot data

#ggplot(drought, aes(Position, PhotoRate, colour=Temp)) +
  #geom_point() + labs(x="Position", y= "Photosynthesis")


# Model data
lm_drought <- lm(Temperature~Genotype*WaterCondition, data=drought)
anova(lm_drought)
emmeans(lm_drought,~Genotype*WaterCondition)

lmer_drought <- lmer(Temperature~Genotype*WaterCondition + (1|plant), data = drought)
anova(lmer_drought)
emmeans(lmer_drought,~Genotype*WaterCondition)


