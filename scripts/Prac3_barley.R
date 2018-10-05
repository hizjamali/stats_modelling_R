library(tidyverse)
library(ggplot2)
library(emmeans)
library(reshape2)

# load data from a folder within a R project
barley <- read.csv('data/Prac3_barley_yield.csv')
str(barley)
View(barley)

#Restructure data to comibe column 4 and 5 to tidy data
barley2 <- gather(barley, key = "Year", value = "Yield", 4:5)
#OR barley2 <- barley %>% gather(key = "Year", value="Yield", Y1, Y2)
str(barley2) 
View(barley2)

# Visualize
ggplot(barley2, aes(Var, Yield, colour=Year)) +
  geom_boxplot() 
  #facet_wrap("Year")


# Model data
lm_4 <- lm(Yield~Var+Loc, data=barley2)
anova(lm_4)

lm_5 <- lm(Yield~Var+Loc+Year, data=barley2) #remove location effect
anova(lm_5)

#Do pairwise comparison for each Var,Loc and Year as specified in lm_5 above
emmeans(lm_5, pairwise~Var)

#Assess model assumptions
plot(lm_5, which=1:2)