

#Bigram
bigram_tokeniser <- function(x) NGramTokenizer(x, Weka_control(min = 2, max = 2))
bigram_matrix <- TermDocumentMatrix(sample_combined, control = list(tokenize = bigram_tokeniser))
bigram <- tidy(bigram_matrix)
bigram <- as.data.frame(bigram)
bigram <- bigram %>% group_by(term) %>% summarise(sum_count=sum(count))
bigram <- bigram %>% arrange(desc(sum_count))
bigram$term_length <- sapply(strsplit(bigram$term, " "), length)
bigram <- bigram[bigram$term_length==2,]
bigram$term1 <- sapply(strsplit(bigram$term, " "), head,1)
bigram$term2 <- sapply(strsplit(bigram$term, " "), head,2)[2,]
save(bigram, file = "bigram.Rdata")
rm(bigram_matrix)
rm(bigram)

#Trigram
trigram_tokeniser <- function(x) NGramTokenizer(x, Weka_control(min = 3, max = 3))
trigram_matrix <- TermDocumentMatrix(sample_combined, control = list(tokenize = trigram_tokeniser))
trigram <- tidy(trigram_matrix)
trigram <- as.data.frame(trigram)
trigram <- trigram %>% group_by(term) %>% summarise(sum_count=sum(count))
trigram <- trigram %>% arrange(desc(sum_count))
trigram$term_length <- sapply(strsplit(trigram$term, " "), length)
trigram <- trigram[trigram$term_length==3,]
trigram$term1 <- sapply(strsplit(trigram$term, " "), head,1)
trigram$term2 <- sapply(strsplit(trigram$term, " "), head,2)[2,]
trigram$term3 <- sapply(strsplit(trigram$term, " "), head,3)[3,]
save(trigram, file = "trigram.RData")
rm(trigram_matrix)
rm(trigram)

#Quadgram
quadgram_tokeniser <- function(x) NGramTokenizer(x, Weka_control(min = 4, max = 4))
quadgram_matrix <- TermDocumentMatrix(sample_combined, control = list(tokenize = quadgram_tokeniser))
quadgram <- tidy(quadgram_matrix)
quadgram <- as.data.frame(quadgram)
quadgram <- quadgram %>% group_by(term) %>% summarise(sum_count=sum(count))
quadgram <- quadgram %>% arrange(desc(sum_count))
quadgram$term_length <- sapply(strsplit(quadgram$term, " "), length)
quadgram <- quadgram[quadgram$term_length==4,]
quadgram$term1 <- sapply(strsplit(quadgram$term, " "), head,1)
quadgram$term2 <- sapply(strsplit(quadgram$term, " "), head,2)[2,]
quadgram$term3 <- sapply(strsplit(quadgram$term, " "), head,3)[3,]
quadgram$term4 <- sapply(strsplit(quadgram$term, " "), head,4)[4,]
quadgram <- as.data.frame(quadgram)
save(quadgram, file="quadgram.Rdata")
rm(quadgram_matrix)
rm(quadgram)


rm(sample_combined)

