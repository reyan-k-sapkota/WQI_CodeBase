library(dplyr)
library(tidyverse)
library(dslabs)
library(tidyr)



data <- read.csv("USA_dataset.csv")
usa <- data %>% filter(Country == "USA") %>% mutate()
sacramento <- usa %>% filter(Area=="Sacramento") %>% mutate()
usa_waterbodies <- usa %>% group_by(Area) %>% 
  summarise(count=n(), mean= mean(CCME_Values), standard_deviation = sd(CCME_Values),
            first= quantile(CCME_Values,0.25), second= quantile(CCME_Values,0.50),
            third= quantile(CCME_Values,0.75)) %>% filter(count > 2000) %>%
  arrange(first,desc= FALSE)%>%
  mutate()


usa_san <- usa %>% filter(Area=="San Joaquin") %>% mutate()
