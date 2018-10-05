# statistical modelling excercise
library(tidyverse)
library(ggplot2)
install.packages('emmeans')
library(emmeans)

# load data from a folder within a R project
#bubbles <- read_csv(("data/bubbles.csv"))

wheat <- read.csv('data/wheat yield.csv')

str(wheat)
View(wheat)

wheat$Variety <- relevel(wheat$Variety, ref = 'Standard') # set ref level

# Visualize Data

ggplot(wheat, aes(Variety, Yield, colour= Variety)) + 
  geom_point() + facet_wrap(~Variation)

#Subset data by Variation (High and Low)
wheat_H <- subset(wheat, Variation=="High")
wheat_L <- subset(wheat,Variation=="Low")

#Fit a linear model
lm1 <- lm(Yield ~ Variety, data = wheat_L)
anova(lml)

summary(lm1)


lm1 <- lm(Yield ~ Variety, data = wheat)
summary(lm1)
emmeans(lm1, ~Variety)

#Assessing model assumptions
plot(lm1, which=1)

# New data set

wheat2 <- read.csv('Data/wheat yield PLUS.csv')

str(wheat2)
View(wheat2)

# Visualize Data

ggplot(wheat2, aes(Variety, Yield, colour= Variety)) + 
  geom_point() #+ facet_wrap(~Variation)

#Fit a linear model lm

lm2 <- lm(Yield ~ Variety, data = wheat2)
anova(lm2)
summary(lm2)

emmeans(lm2, pairwise~Variety)
plot(lm2, which=c(1,2)) #gives first two plots only

install.packages('reshape2')
library(reshape2)

