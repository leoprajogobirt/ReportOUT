library(tidytext)
library(dplyr)
library(SnowballC)
library(openxlsx)

stbm <- read.csv ("STBM25 comments.csv")
loop <- c("improve")
tidy_list <- list() #new list to populate

for (i in loop){
  i_tidy <- unnest_tokens(stbm, output = word, input = i) #new column with just the words in enjoy
  i_tidy <- as.data.frame(i_tidy$word) #removes other columns so only word column is left and turns into dataframe from vector
  names(i_tidy)[names(i_tidy) == 'i_tidy$word'] <- 'word' #renames column
  
  i_tidy <- i_tidy %>%
    anti_join(stop_words) #removes stop words such as the
  
  i_tidy<-i_tidy %>%
    mutate_at("word", funs(wordStem((.), language="en"))) #stems words to root
  
  i_tidy <- i_tidy %>%
    count(word, sort = TRUE) #count of each words
  
  tidy_list[[i]] <- i_tidy #appends dataframe to tidy_list
  
}

words <- Reduce(full_join, tidy_list)

write.xlsx(words,
           file = "SaferToBeMe improvements.xlsx",
           colNames = TRUE)