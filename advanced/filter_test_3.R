test1 <- data.frame(id=c(1,2,3,4,5),
                    mid_grade=c(77,56,99,100,99))

test2 <- data.frame(id=c(1,2,3,4,5),
                    final_grade=c(84,76,100,100,100))
test1
test2

#2개 데이터 join하기              join key
join_data <- left_join(test1,test2,by="id" ) 
join_data

namedata <- data.frame(class=c(1,2,3,4,5),
                       student=c("JY","jeff","jun","hyeran","nuri"),
                       stringsAsFactors = F) #factor타입은 순서를 기재할 수 있는 문자
str(namedata)

exam
namedata
exam_newz %>%  left_join(exam,namedata,by="class")

#bind_rows
groupA <- data.frame(id=c(1,2,3,4,5),
                     mid_grade=c(77,56,99,100,99))

groupB <- data.frame(id=c(6,7,8,9,10),
                     mid_grade=c(77,56,99,100,99))
groupC <- bind_rows(groupA,groupB)
groupC















