#교재 p150
#-----------------------------------------
#1.
#cty 연비 
mpg %>% 
  group_by(class) %>% 
  summarise(cty_mean=mean(cty))
#-----------------------------------------
#2.
mpg %>% 
  group_by(class) %>% 
  summarise(cty_mean=mean(cty)) %>% 
  arrange(desc(cty_mean))
#-----------------------------------------
#3.
mpg %>% 
  group_by(manufacturer) %>% 
  summarise(hwy_mean=mean(hwy)) %>% 
  arrange(desc(hwy_mean)) %>% 
  head(3)

?arrange
#-----------------------------------------
#4.
mpg
mpg %>% 
  group_by(manufacturer) %>% 
  filter(class=="compact") %>% 
  summarise(compact_no=n())







