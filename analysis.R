# Python

twitterscraper dadri%20from%3Asagarikaghose -o sagarika.json

twitterscraper malda%20from%3Asagarikaghose -o sagarikam.json

twitterscraper malda%20from%3Abdutt -o barkham.json


twitterscraper dadri%20from%3Abdutt -o barkha.json


twitterscraper malda%20from%3Arahulroushan -o rahulm.json


twitterscraper dadri%20from%3Arahulroushan -o rahul.json


twitterscraper dadri%20from%3Adhume -o dhume.json

twitterscraper malda%20from%3Adhume -o dhumem.json

twitterscraper malda%20from%3Arupasubramanya -o rupam.json

twitterscraper dadri%20from%3Arupasubramanya -o rupa.json



# R

library(jsonlite)

rahul_malda = fromJSON("rahulm.json")

nrow(rahul_malda)

rahul_dadri = fromJSON("rahul.json")

nrow(rahul_dadri)


barkha_malda = fromJSON("barkham.json")

nrow(barkha_malda)

barkha_dadri = fromJSON("barkha.json")

nrow(barkha_dadri)


sagarika_malda = fromJSON("sagarikam.json")

nrow(sagarika_malda)

sagarika_dadri = fromJSON("sagarika.json")

nrow(sagarika_dadri)







dhume_malda = fromJSON("dhumem.json")

nrow(dhume_malda)
dhume_malda$text


dhume_dadri = fromJSON("dhume.json")

nrow(dhume_dadri)


rupa_malda = fromJSON("rupam.json")

nrow(rupa_malda)

rupa_malda$text


rupa_dadri = fromJSON("rupa.json")

nrow(rupa_dadri)

rupak = as.vector(rupa_dadri$text)
library(dplyr)
library(tidyr)

text_df <- data_frame(line = 1:nrow(rupa_dadri), text = rupa_dadri$text)

text_df

head(text_df)

library(tidytext)
rupal= text_df %>%
  unnest_tokens(word, text)



nrc <- get_sentiments("nrc")



rupal %>%  inner_join(nrc) %>% count(word, sort = TRUE)
  

get_sentiments("bing")


rupal %>% inner_join(get_sentiments("bing")) %>%
  count(n=n(),sentiment) %>% 
  spread(sentiment, n, fill = 0) %>%
  mutate(sentiment = positive - negative)

rupal %>% inner_join(get_sentiments("bing")) %>%filter(sentiment=="positive")



