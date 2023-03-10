```{r}
library(googlesheets4)
library(tidyverse)
library(dplyr)
library(digest)

students <- read_sheet("https://docs.google.com/spreadsheets/d/#your#link#here/edit#gid=0")
students <- students %>% 
  rowwise() %>% 
  mutate(review_hash = digest(review_column)) 

students <- students %>% mutate(review_number = row_number()) %>% ungroup()
students <- students %>% mutate(lag_hash = lag(review_hash)) %>% ungroup()
hash_chain <- students %>% digest()
students <- students %>% mutate(hash_of_sheet = hash_chain)
students

students1 <- students %>% rowwise() %>% mutate(current_hash= digest(paste(review_hash, lag_hash, sep = "")))
students2 <- students1 %>% select(review_number,review_column,review_hash,lag_hash,current_hash,hash_of_sheet)
students2
```
