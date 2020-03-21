library("dplyr")
exam <- read.csv("csv_exam.csv")
exam
exam %>% filter(class==1) #전체데이터에서 class가 1인것을 보여줌
exam %>% 
  filter(class==1) %>% 
  filter(math>=50)      #필터는 조건을 정의

#select                 #select - 추출하고 싶은 변수를 정의 
exam %>% select(-math)
exam %>% select(id,math,english)

exam %>% 
  filter(class==1) %>% 
  select(id,math)



#arrange
exam %>% arrange(id)
exam %>% arrange(desc(id))
exam %>% arrange(class,desc(english))

#metate - 파생변수 추가 *없는 컬럼 추가
exam %>% 
  mutate(total=math+english+science) %>% 
  head()
      
exam %>% 
  mutate(total=math+english+science,
         mean=total/3) %>% 
  head

exam %>% 
  mutate(total=math+english+science,
         mean=total/3,
         info = ifelse(science>=70,"통과","재시험")) %>% 
  head

exam %>% 
  group_by(class) %>% 
  summarise(math_sum=sum(math),
            math_mean=mean(math),
            math_med=median(math),
            math_count=n())














                 