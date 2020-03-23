#크롤링 
#클리앙 웹사이트: 심플하고 쉬운 웹사이트 https://www.clien.net/service/
install.packages("mongolite")
library(stringr)
library(mongolite)

#mongoDB에 저장하기 위해서는 크로링해야 한다. 
#mongoDB 연동 빅데이터 db에 넣는다는 뜻 
con <- mongo(collection = "crawl",
             db = "bigdata",
             url = "mongodb://127.0.0.1")
#----------------------------------------------

url <- "https://www.clien.net/service/group/community?&od=T31&po=0"
url_data <- readLines(url, encoding="UTF-8")
url_data #링크의 데이터를 가져왔다

#정보확인
#class(url_data)    character이다
#length(url_data)    2033줄이다
head(url_data)
tail(url_data)
#==============================================================================
url_data[200] #200번째 데이터 

#조건에 만족하는 데이터를 필터링 

#str_detect(데이터,조건) 문자열에 패턴을 적용하고 일치여부를 True or False로 리턴턴
str_detect(url_data,"subject_fixed") #subject_fixed와 일치하는 부분 true 리턴

####1. 웹사이트내에서 필요한 데이터만 추출####
url_data[str_detect(url_data,"subject_fixed")] #true 만 print
filter_data <- url_data[str_detect(url_data,"subject_fixed")]
filter_data

#####2. 추출한 데이터 수정: 필요한 문자열만 추출####: str_extract() => 패턴일치 리턴
                    #후방(?<=) 전방 둘다  사용 
str_extract(filter_data,"(?<=\">).*(?=</span>)") #제목만 추출됌 

title_data <- str_extract(filter_data,"(?<=\">).*(?=</span>)")
title_data

#조회수 많은 순서, 각 제목 링크 등이 필요하다
#위 같은 작업 반복. 

####데이터 필터링: hit_data ####
hit_data <- url_data[str_detect(url_data,"<span class=\"hit\">")] #"" 때문에 \ 사용
hit_data #잘 나옴. 전방 후방 작업만 하면 조회수 가져올 수 있음
hit <- str_extract(hit_data,"(?<=\">).*(?=</span>)")[-1] #공지사항 제외 
hit #조회만 가져옴옴

#####데이터 필터링: url링크 #### 
#myurl <- url_data[str_detect(url_data,"list_subject")]

#다른 방식으로 
which(str_detect(url_data,"subject_fixed"))-3 #true 인 위치값만 -쓸때없는 부분 제외

myurl <- url_data[which(str_detect(url_data,"subject_fixed"))-3]
myurl
url_val <- str_extract(myurl,"(?<=href=\").*(?=data-role)")
url_val #30개 딱 맞음 하지만 www같이 도메인이 추가되야 함
url_val <- paste0("https://www.clien.net",url_val)
url_val
#뒷부분 제거는 애초에 extract에서 하면 되지만 새로운 기능을 보여주기 위해
str_sub(url_val,end=-3)
url_val <- str_sub(url_val,end=-3)

url_val #완성: 실행해봐야함. 


#### csv파일로 생성####
title_data
final_data <- cbind(title_data,hit,url_val)
final_data
write.csv(final_data,"crawl_data.csv")
#R파일로 저장 
save(final_data,file = "crawl_data.RData")

####mongoDB에 저장 ####
#빅데이터DB 내용을 비우고
if(con$count()>0){
  con$drop()
}
class(final_data) #매트릭스로 되어있음. data.frame으로 변환해야 함 
final_data <- data.frame(final_data)
class(final_data)
#mongoDB 빅데이터DB에 넣기 
con$insert(final_data)
#성공

