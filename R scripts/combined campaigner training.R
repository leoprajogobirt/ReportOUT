library(ggplot2)
library(tidyverse)


### Campaigner training combined ###
combined_dat <- read.csv("training_combined.csv")
q_combined <- c("skills_development.", "confidence_development.", "teacher_rating",
              "topic_relevance", "resource_rating", "overall_rating")
  
for (i in q_combined) {
  combined_dat[[i]] <- as.factor(combined_dat[[i]])
} #changes all question data types to factors rather than strings

combined_dat$session <- as.factor(combined_dat$session) #changes session data types to factors

for (i in q_combined) {
  print (
    ggplot(subset(combined_dat, i != "NA"), aes(x=.data[[i]], fill = session)) +
      geom_bar()
  )
} # plots by rating colour coded by which session was attended