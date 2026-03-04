library(ggplot2)
library(tidyverse)


### 2023 STBM ###
STBM23_dat <- read.csv("STBM 2023.csv")
q_STBM23 <- c("event_organisation", "useful_information", "friendly_and_welcoming_event", "suitable_and_inclusive_buildings", "interesting_and_varied", "overall_rating", "another_STBM", "interested_sponsor") #category with the different questions

for (i in q_STBM23) {
  STBM23_dat[[i]] <- as.factor(STBM23_dat[[i]])
} #changes all question data types to factors rather than strings


for (i in q_STBM23) {
  print (
    ggplot(STBM23_dat, aes(x=.data[[i]], fill = nation_state)) +
      geom_bar()
  )
} # plots by rating colour coded by which event was attended