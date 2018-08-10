#Instructions

Set the working directory in the main.R file and please install, the following packages before you proceed:
tm,
stringr,
wordcloud,
SnowballC,
RColorBrewer,
ggplot2,
tidytext,
topicmodels

#Implementation

• Loadeded the data.
• Splitted the input data.
• Built a corpus object containing all splitted articles
• Cleaned up the corpus
• Created a document term matrix
• Did summaries on the doument term matrix as exploration and stored some output in a file
• Created some plots for exploration
• Ran the topic model function and store some output of the model in a file.


1.main.R - the main script will first make a call to the function in dataLoading.R for the loading and
splitting. After that, the script should contain all the code for the cleaning, creation of the document
term matrix, summaries and write the first output file . It should then call 2 functions
in plots.R before it creates the topic model and the last two output files.

2.dataLoading.R - contains a single function that will read the data file, split up into articles and
return the splitted articles . The function should have one
argument - the path to the data file.

3.plots.R - contains 2 functions. A) a function that will create a historgram of terms and B) a function
that will create a wordcloud plot of terms. Each of the functions will have 3 arguments - the terms, the
number of occurances for each of the terms (frequencies) and the limit (e.g the histogram should only
be created for terms that occur more than a 100 times, the wordcloud only for terms that occur more
than 70 times).