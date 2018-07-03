players = read.csv("best.csv")





best.now = players %>% group_by(Age) %>%
  top_n(100,wt=Best.Rating) %>%
  arrange(Age, desc(Best.Rating)) %>%
  filter(Age < 29,
         Age > 17)  %>%
  ungroup() %>%
  filter(Best.Rating > mean(Best.Rating),
         Best.Pot.Rating > mean(Best.Pot.Rating))
  


players %>% group_by(Age) %>%
  top_n(25,wt=Best.Pot.Rating) %>%
  arrange(Age, desc(Best.Pot.Rating)) %>%
  filter(Age < 24,
         Best.Rating > mean(Best.Rating)) %>%
  ungroup() %>%
         filter(Best.Pot.Rating > mean(Best.Pot.Rating)) %>%
  write.csv("future.csv",row.names = FALSE,na="")





