library(tidyverse)
library(ggplot2)
library(emmeans)
library(reshape2)

# load data from a folder within a R project
forest <- read.csv('data/Prac3_forest.csv')
str(forest)
View(forest)


# Visualize
ggplot(forest, aes(QuadDiam, Density, colour=StandType)) +
  geom_point() +
  geom_smooth(method = "lm", se=FALSE)

  

# Model data
lm_forest <- lm(Density~QuadDiam*StandType, data=forest) #separate slope for each StandType
anova(lm_forest)
summary(lm_forest)

lm_forest1 <- lm(Density~QuadDiam+StandType, data=forest) #slope is foreced same for all StandTypes in this model
anova(lm_forest1)
summary(lm_forest1)
#Do pairwise comparison for each Var,Loc and Year as specified in lm_5 above
emmeans(lm_forest1, pairwise~StandType)

#Assess model assumptions
plot(lm_forest1, which=1:2)