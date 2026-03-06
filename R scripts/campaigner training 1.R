library(ggplot2)
library(tidyverse)


### Campaigner training session 1 ###
session_dat <- read.csv("training_1.csv")
q_session <- c("skills_development.", "confidence_development.", "teacher_quality",
                "inspired_as_campaigner.", "topic_relevance", "resource_quality",
                "course_organisation")

for (i in q_session) {
  session_dat[[i]] <- as.factor(session_dat[[i]])
} #changes all question data types to factors rather than strings

for (i in q_session) {
  print (
    ggplot(subset(session_dat, i != "NA"), aes(x=.data[[i]], y=after_stat(count/sum(count)), fill)) +
      geom_bar() +
      geom_text(
        aes(label = scales::percent(after_stat(count)/sum(after_stat(count)) ) ),
        stat="count", position = position_dodge(width = 1.7), 
        vjust = -1
      )
  )
} # plots by rating colour coded by which session was attended