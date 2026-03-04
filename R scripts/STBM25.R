library(ggplot2)
library(tidyverse)


### 2025 STBM ###
STBM25_dat <- read.csv("STBM 2025.csv")
q_STBM25 <- c("event_rating", "event_organisation", "event_communication") #category with the different questions
responses_STBM25 <- c("Very Poor", "Poor", "Average", "Good", "Very Poor", "Excellent")

for (i in q_STBM25) {
  STBM25_dat[[i]] <- as.factor(STBM25_dat[[i]])
} #changes all question data types to factors rather than strings


for (i in q_STBM25) {
  print (
    ggplot(STBM25_dat, aes(x=factor(.data[[i]], responses_STBM25), fill = event)) +
      geom_bar()
  )
} # plots by rating colour coded by which event was attended