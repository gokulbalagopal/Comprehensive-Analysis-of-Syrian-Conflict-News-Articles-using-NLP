#Setting the path to the working directory
setwd('C:/Users/balag/OneDrive/Desktop/cacds_r_and_udemy/cacds/R project/final_project/')

#Loading libraries
library(tm)
library(stringr)
library(wordcloud)
library(SnowballC) 
library(RColorBrewer) 
library(ggplot2)
library(tidytext)
library(topicmodels)

#Sourcing  functions
source('dataLoading.R')
source('plots.R')

#Creating a function for dividing the text into articles
path='AJA_Factiva-20180306-2258.txt'
alldata=create_text(path)

#Cleaning the Data and creating corpus
text1=alldata
text2=gsub(pattern='\\W',replace=" ",text1)#remove the special characters and replace it with white space 
text2=gsub(pattern='\\d',replace=" ",text2)#remove the digits and replace it with white space
text2=tolower(text2)#Convert the words in upper case to lower case 
text2=removeWords(text2,stopwords())#remove stop-words like 'and','that','the' etc.
text2=removeWords(text2,c('al','also','said','jazeera','copyright','ajazen','english','march','february'))
text2=gsub(pattern='\\b[A-z]\\b{1}',replace=' ',text2)#remove single character words and replace it with white space
text2=stripWhitespace(text2)#Replacing multiple white spaces with single white space
text2#corpus
corp=Corpus(VectorSource(text2))
dtm=DocumentTermMatrix(corp)#Document-Term-Matrix
inspect(dtm)#Inspecting DTM
tdm =TermDocumentMatrix(corp)#Term-Document-Matrix
tdm_matrix=as.matrix(tdm)
dtm_matrix=as.matrix(dtm)
is.vector(str(dtm_matrix))

#Summaries
#calculate frequencies -  total counts (over all docs) for each term
df=as.data.frame(tdm_matrix)
head(df)
colnames(df)=c('frequency')
freq=df$frequency
df$words=rownames(df)

#calulate total number of terms using freq
total_no_terms= sum(freq)

#List all terms in decreasing order of freq and write to disk as file "word_freq.csv"
df_des=df[order(df$frequency,decreasing = TRUE),]
rownames(df_des)=1:length(df$frequency)
head(df_des)
write.csv(df_des, file = "word_freq.csv")

#Plot Function
colnames(df)=c('frequency')
df$terms=rownames(df)
plot_word(df$terms,df$frequency,70)
plot_histogram(df$terms,df$frequency,100)

#Use the following parameters for Gibbs sampling
burnin = 4000
iter = 2000
thin = 500
seed =list(2003,5,63,100001,765)
nstart = 5
best = TRUE

#Number of topics
k = 5

#Run LDA using Gibbs sampling
ldaoutput =LDA(dtm,k, method="Gibbs", control=list(nstart=nstart, seed = seed, best=best, burnin = burnin, iter = iter, thin=thin))

#write out results
#The LDA algorithm returns an object that contains a lot of information. 
#Of particular interest to us is the top terms in each topic


#top 6 terms in each topic
ldaoutput.terms = as.matrix(terms(ldaoutput,6))
  write.csv(ldaoutput.terms,file=paste("ldamodel",k,"TopicsToTerms.csv"))



