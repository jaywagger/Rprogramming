#형태소분석 

# install.packages("KoNLP") 더 이상 지원이 안됌  
#KoNLP zip 파일을 풀고 C:\IoTJY\bigdata\R\R-3.6.3\library에 붙여넣기 
#하위도 다 설치해주기 

install.packages("KoNLP")
install.packages("Sejong")
install.packages("hash")
install.packages("rJava")
install.packages("tau")
install.packages("RSQLite")
install.packages("devtools")
library(KoNLP)
library(stringr)

#### KoNLP의 함수를 테스트 
extractNoun("롯데마트가 판매하고 있는 흑마늘 양념 치킨이 논란이 되고 있다.")

SimplePos09("롯데마트가 판매하고 있는 흑마늘 양념 치킨이 논란이 되고 있다.")

#분석할 샘플데이터 로딩
load("comments.Rdata")
load("score.Rdata")

length(comments)
length(score)

head(comments,10)
head(score,10)

sampledata <- comments[1:1000]
class(sampledata)

#띄어쓰기 기준으로 짜르고 리스트에 넣기 
#형태소 분석을 하기 위해서 명사분리 
data_list= list() #댓글을 분리하면 명사의 갯수가 다르므로 리스트를 이용
for (i in 1:length(sampledata)) {
  data <- SimplePos09(sampledata[i]) #1개씩
  data_list[[i]] <- data
}
#data_list[[22]]
head(data_list,20)

#명사 추출: /로 분할: sapply
# /로 분할: 리시트의 모든 요소에 저장된 문자열을 분리 
#그 후 N이 있는 문자열의 첫번째 요소 가져오기 

#sapply 복습 
# sapply(data.frame(test=c(1,2,3,4,5,6),
#                   test2=c(7,8,9,10,11,12)
#                   ), #반복작업할 데이터 
#        function(x){
#          x[2]
#         } #반복해서 적용할 함수 
#        )

class(data_list)
wordlist <- sapply(str_split(data_list,"/"), function(x){
                                              x[1]
                                            }
                   )
class(wordlist)
head(wordlist,10)




