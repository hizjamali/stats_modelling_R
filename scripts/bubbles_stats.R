# statistical modelling excercise
library(tidyverse)
library(ggplot2)
install.packages('emmeans')
library(emmeans)

# load data from a folder within a R project
bubbles <- read_csv(("data/bubbles.csv"))

# Create unique ID by uniting two columns but keep original columns
bubbles1 <- as.tibble(bubbles) %>% 
  unite(date_pot, datetime, pot, sep = "_", remove = FALSE)
