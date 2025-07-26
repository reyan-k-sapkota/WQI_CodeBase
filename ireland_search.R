library(dplyr)
library(tidyverse)
library(dslabs)
library(tidyr)

data <- read.csv("Ireland_dataset.csv")
lake <- data%>% filter(Waterbody.Type== "Lake") %>% mutate()
ireland_lake <- lake %>% filter(Country=="Ireland") %>% mutate()
ireland_sep <- ireland_lake %>% separate(Area,c("area1","area2"),extra="merge",conver=TRUE,sep= ",")
ireland_erne <- ireland_sep %>% filter(area1=="Erne") %>% mutate()
ireland_summary <- ireland_sep %>% group_by(area1) %>% summarise(count = n()) %>% mutate()
shannon <- c("Upper Shannon (A)",	"Upper Shannon (B)","Upper Shannon (C)","Upper Shannon (E)",	
"Upper Shannon (F)","Lower Shannon (A)","Lower Shannon (C)","Lower Shannon (D)")
ireland_shannon <- ireland_sep %>% filter(area1 %in% shannon) %>% mutate()
