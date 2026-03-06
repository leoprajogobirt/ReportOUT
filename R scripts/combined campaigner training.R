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
    combined_dat %>%
      filter(.data[[i]] != "NA") %>%
      ggplot(aes(x=.data[[i]], y=after_stat(count/sum(count)), fill = session)) +
        geom_bar(position="dodge") +
        geom_text(
          aes(label = scales::percent(after_stat(count)/sum(after_stat(count)) ) ),
          stat="count", position = position_dodge(width = 1.7), 
          vjust = -1
        )
    )
} # plots by rating colour coded by which session was attended