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
    ggplot(STBM25_dat, aes(x=.data[[i]], y=after_stat(count/sum(count)))) +
      geom_bar() +
      geom_text(
        aes(label = scales::percent(after_stat(count)/sum(after_stat(count)) ) ),
        stat="count", position = position_dodge(width = 1.7), 
        vjust = -1
      )
  )
} # plots by rating colour coded by which session was attended
