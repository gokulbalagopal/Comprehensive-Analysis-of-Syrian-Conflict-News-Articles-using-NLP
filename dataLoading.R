
create_text=function(path){
  textfile_each_line <- readLines(path)#Convert text into lines
  head(textfile_each_line)
  text=paste(readLines('AJA_Factiva-20180306-2258.txt'),collapse=' ')#Wrap all the lines together into a single string
  return (text)
}
