library(stringr)
library(mongolite)

#웹에서 크롤링 
url <- "https://www.clien.net/service/board/park/14745554?od=T31&po=0&category=&groupCd=community"
url_data <- readLines(url, encoding="UTF-8")

class(url_data)
length(url_data)
head(url_data)
tail(url_data)

#원하는 데이터 추출
str_detect(url_data, "post_content")
start = which(str_detect(url_data, "post_content"))
start
end = which(str_detect(url_data, "post_ccls"))
end
content_filter_data <- url_data[start:end]
content_filter_data

#데이터 정제
#1. 백터로 리턴하므로 한 개로 합치기
content_filter_data <- paste(content_filter_data,collapse = "")
content_filter_data

#2. 불피요한 기호 및 태그 없애기
                            #< > 태그만 없애겠다. 
content_gsub <- gsub("<.*?>","",content_filter_data) #싫은거 없애기 
content_gsub
content_gsub <- gsub("\t|&nbsp;","",content_gsub) #싫은거 없애기 
content_gsub


--------------------------------------------------------------------
#위 강사님
  #이건 나 
  
url_data[str_detect(url_data, "<p>")][-(1:3)]
filter_data <- url_data[str_detect(url_data, "<p>")][-(1:3)]
filter_data

str_extract(filter_data, "(?<=<p>).*(?=</p>)")
content_data  <- str_extract(filter_data, "(?<=<p>).*(?=</p>)")
content_data 

