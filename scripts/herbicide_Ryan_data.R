library(tidyverse)
library(ggplot2)
library(emmeans)
library(reshape2)

# load data from a folder within a R project
herbicide <- read.csv('data/herbicide_raw_data.csv')
str(herbicide)
View(herbicide)

# convert block to a factor (from integer)
herbicide$Block <- factor(herbicide$Block)

# create a new response variabe by adding two existing variables
herbicide$totalN <- herbicide$shootN + herbicide$bgN
str(herbicide)

# Visualize
ggplot(herbicide, aes(Rhizobia, log(totalN), colour = Herbicide)) +
  geom_boxplot() 
  #facet_wrap("Rhizobia")
  #geom_smooth(method = "lm", se=FALSE) 


# Model data
lm_herbicide <- lm(log(totalN)~Species*Herbicide*Rhizobia + Block, data=herbicide) #separate slope for each StandType
anova(lm_herbicide)
summary(lm_herbicide)

emmeans(lm_herbicide, ~Species*Herbicide)
emmeans(lm_herbicide, pairwise~Rhizobia|Species*Herbicide)
emmeans(lm_herbicide, pairwise~Herbicide|Species*Rhizobia)

#Assess model assumptions
plot(lm_herbicide, which=1)
