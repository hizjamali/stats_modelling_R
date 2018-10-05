library(tidyverse)
library(ggplot2)
library(emmeans)

# load data from a folder within a R project
cabbage <- read.csv('data/Prac3_cabbage_data.csv')
str(cabbage)
View(cabbage)

# Vusalize
ggplot(cabbage, aes(Date, VitC, colour=Cult)) +
  geom_boxplot() 

# Model data
lm_2 <- lm(VitC~Cult*Date, data=cabbage)
anova(lm2)
#+ constrains model to look within a date; similar to blocking maybe?
lm3 <- lm(VitC~Cult+Date, data = cabbage)
anova(lm3)
emmeans(lm3, pairwise~Cult)

#Assess model assumptions
plot(lm3, which=1:2)