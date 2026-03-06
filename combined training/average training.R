library(ggplot2)
library(tidyverse)

### Working with just averages ###
average_dat <- read.csv("campaigner training averages by year.csv")
q_combined <- c("skills_development.", "confidence_development.", "teacher_rating",
                "topic_relevance", "resource_rating", "overall_rating", "total")

average_dat$session <- as.factor(average_dat$session)

for (i in q_combined) {
  print (
      average_dat %>%
      filter(.data[[i]] != "NA") %>%
        ggplot(aes(x=session, y=.data[[i]], label=.data[[i]])) +
        geom_col() +
        theme_classic() +
        geom_text(vjust=-1)
  )
}

  ggplot(average_dat, aes(x=session, y=total, label=total)) +
  geom_segment( aes(x=session, xend=session, y=0, yend=total), color="skyblue") +
  geom_point( color="blue", size=4, alpha=0.6) +
  theme_light() +
  coord_flip() +
  theme(
    panel.grid.major.y = element_blank(),
    panel.border = element_blank(),
    axis.ticks.y = element_blank()
  )
  
  
ggplot(data, aes(x=x, y=y)) +
  geom_segment( aes(x=x, xend=x, y=0, yend=y), color="skyblue") +
  geom_point( color="blue", size=4, alpha=0.6) +
  theme_light() +
  coord_flip() +
  theme(
    panel.grid.major.y = element_blank(),
    panel.border = element_blank(),
    axis.ticks.y = element_blank()
  )