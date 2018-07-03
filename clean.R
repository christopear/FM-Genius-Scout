library(tidyverse)
library(data.table)


z = fread("players.csv") %>%
  mutate_if(grepl("Rating", colnames(.)) | colnames(.) %in% c("Fitness", "Mtc Exc","Con"), function(x) {
    as.numeric(gsub("[%].*$","",x))/100
  }) %>%
  mutate(`Date Of Birth` = as.Date(`Date Of Birth`, format="%d.%m.%Y"),
         `Joined Club` = as.Date(`Joined Club`, format="%d.%m.%Y")) %>%
  mutate_if(colnames(.) %in% c("Value","Sale Value","Wage","Minimum Fee","Relegation Fee","Non Promotion Fee"), function(x) {as.numeric(gsub(",","",x))})



z = z[,which(colnames(z) %in% c("Name",
                                "Nation",
                                "Club",
                                "Age",
                                "Value",
                                "Wage",
                                "Sale Value",
                                "Based")
             |
               grepl("Rating", colnames(z)))]


z %>% melt(c("Name",
             "Nation",
             "Club",
             "Age",
             "Value",
             "Wage",
             "Sale Value",
             "Based")) %>%
  filter(grepl("GK|DC|WBL|WBR|MC|AMC|FS",variable)) %>%
  dcast(Name + Nation + Club + Age + Value + Wage + `Sale Value` + Based ~ variable, fun.aggregate = mean, value.var = "value") %>%
  mutate(`Best Rating` = pmax(`GK Rating`, `DC Rating`, `WBL Rating`, `WBR Rating`, `MC Rating`, `AMC Rating`, `FS Rating`),
         `Best Pot Rating` = pmax(`GK Pot Rating`, `DC Pot Rating`, `WBL Pot Rating`, `WBR Pot Rating`, `MC Pot Rating`, `AMC Pot Rating`, `FS Pot Rating`)) %>%
  write.csv("best.csv",row.names = FALSE, na = "")