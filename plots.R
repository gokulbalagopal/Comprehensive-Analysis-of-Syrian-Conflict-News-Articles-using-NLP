#Histogram
plot_histogram=function(terms,freq,min_freq){
  #print(terms)
 # print(freq)
  df_new=data.frame(term=terms,frequency=freq)
  rownames(df_new)=df_new$term
  wof=df_new[df_new$frequency>min_freq,]
  print(wof$word)
  p1=ggplot(data=wof,aes(term, frequency)) +
    geom_bar(stat="identity", fill="darkred", colour="blue") +
    theme(axis.text.x=element_text(angle=45, hjust=1))
  p1
  
}
#Wordcloud
plot_word=function(terms,freq,min_freq_wordcloud){
  p2=wordcloud(terms,freq,min.freq = min_freq_wordcloud,random.order=FALSE,scale=c(3,0.8))
  p2#Gray Scale

  p3=wordcloud(terms,freq,min.freq = min_freq_wordcloud,random.order=FALSE,scale=c(3,0.8),colors=brewer.pal(3, "Dark2"))
  p3#Colored
}

