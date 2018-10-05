# Day 2 - Chapter 3 Statistical Modelling: Understanding Mean Structure
library(ggplot2)
library(tidyverse)
library(reshape2)
library(emmeans)

# load data from a folder within a R project
data2 <- read.csv('data/Prac3_mock_LWR.csv')

str(data2)
View(data2)

ggplot(data2, aes(GeneB, LWR, colour=GeneA)) +
  geom_boxplot() + geom_point()

lm_data2 <- lm(LWR ~ GeneA*GeneB, data = data2) # analyses interaction as well
anova(lm_data2)
summary(lm_data2)

#compare A with each level of B # A effect in the presene and absence of B
emmeans(lm_data2, pairwise~GeneA|GeneB) 

#Assessing model assumptions
plot(lm_data2, which=c(1,2)) #gives first two plots only

