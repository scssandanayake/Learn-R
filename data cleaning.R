######## DATA CLEANING #########

library(tidyverse)
#data() #view inbuilt data set
view(starwars)

###########variable types
glimpse(starwars) #view full detail abput data set
class(starwars$gender)  #check what is the class of a variable
unique(starwars$gender) #what can we found inside a perticular variable/column

starwars$gender <- as.factor(starwars$gender) #change default variable type to factor variable because we interested about levels
class(starwars$gender)

levels(starwars$gender) #check the levels of any variable

starwars$gender <- factor((starwars$gender),
                          levels = c("masculine","feminine")) #swap the levels with concatanation

levels(starwars$gender) #view new swaped levels

##########selecting variables
names(starwars) # know the column names of the data set / table

starwars %>% #using pipe operator to access from the data set (shift+ctrl+M)
  select(name, height, ends_with("color")) %>% 
  names() #names means columns in this data set

unique(starwars$hair_color)

starwars %>%
  select(name, height, ends_with("color")) %>%
  filter(hair_color %in% c("blond", "brown") & #within hair_color it can be blond or brown
           height < 180) 

######### missng data
mean(starwars$height ,na.rm = TRUE) #not availalbe & remove

starwars %>% 
  select(name, gender, hair_color, height) #get/look all the observations 

starwars %>% 
  select(name, gender, hair_color, height) %>%  #remove all not avilable data within selcted columns
  na.omit()

starwars %>% 
  select(name, gender, hair_color, height) %>%  #understand where the missingness value is
  filter(complete.cases(.)) #this will do the exact oeration of OMIT data
  
starwars %>% 
  select(name, gender, hair_color, height) %>%
  filter(!complete.cases(.)) #thsi do the oppesite of above function by '!' only giving variables that have missing values in above columns.
  #incomplete cases  

starwars %>% 
  select(name, gender, hair_color, height) %>%
  filter(!complete.cases(.)) %>% 
  drop_na(height) #remove the missing values

starwars %>% 
  select(name, gender, hair_color, height) %>%
  drop_na(height) %>%
  view()

starwars %>% 
  select(name, gender, hair_color, height) %>%
  filter(!complete.cases(.)) %>% 
  mutate(hair_color = replace_na(hair_color, "none"))
  #NA values will be overwrite with excisting variable/name for replacing any observation

starwars %>% 
  select(name, gender, hair_color, height) %>%
  filter(!complete.cases(.)) %>% 
  mutate(hair_color2 = replace_na(hair_color, "none"))
  #create a new variable and replace NA values with desired name

########## duplicates
#example by creating a new data frame
Names <- c("peter", "john", "age", "peter")
Age <- c(22,33,44,22)

friends <- data.frame(Names, Age)
#view
duplicated(friends) #wiew the duplicate data

friends[!duplicated(friends),]
#show duplicated observations

friends[!duplicated(friends),] #[tell what rows,tell what columns]
#show not duplicate observations

friends %>% 
  distinct() #tidyverse easy function to view not duplicated observations
  #view

########## re-cording variables
starwars %>%  select(name, gender)

starwars %>% 
  select(name , gender) %>% 
  mutate(gender = recode(gender,
                         "masculine" = 1,
                         "feminine" = 2)) #recoding categorical to numerical

starwars %>% 
  select(name , gender) %>%
  mutate(gender_coded = recode(gender,
                       "masculine" = 1,
                       "feminine" = 2)) %>%  #add to a new column
  view()















