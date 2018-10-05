install.packages("lmerTest")
library(lmerTest)
library(tidyverse)
library(ggplot2)
library(emmeans)
library(reshape2)


photo <- read_csv(("data/Prac4_photosynthesis.csv"))   #upload data

str(photo) #check data types in data set
View(photo)

photo$Position <- factor(photo$Position) #overwrites column keeping column name same
photo$Temp <- factor(photo$Temp)

#Plot data
ggplot(photo, aes(Position, PhotoRate, colour=Temp)) +
  geom_point() + labs(x="Position", y= "Photosynthesis")


# Model data
lmer1=lmer(PhotoRate~Temp + (1|Position), data=photo)
anova(lmer1)
summary(lmer1)
emmeans(lmer1, ~Temp)
emmeans(lmer1, pairwise~Temp)

