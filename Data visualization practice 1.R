#data visualization video 1 - 26.50 minutes

library(tidyverse) 
data()                   #view inbuilt data sets in R
BOD                      #view the data(elements) in specific data set 
?BOD                     #view description of the specific data set 


## data visualizing using ggplot library ##
#type 1
ggplot(data = BOD,
       mapping = aes(x = Time,
                     y = demand))+  # x= independent variable / y = dependent variable , depend on X var.
  geom_point(size = 5)+
  geom_line(colour = "red")

#type 2
ggplot(BOD,aes(Time,demand))+
  geom_point(size = 4)+
  geom_line(colour= "blue")


#methods for view a specific data sets
CO2             #view the data(elements) in specific data set 
view(CO2)


##### making plots 1 #####

#type 1
CO2 %>%                                  #we are using pipe_operator here
  ggplot(aes(conc,uptake,
             colour = Treatment))+
  geom_point(size =3, alpha = 0.7)+      #point size and transparency
  geom_smooth(method = lm,se =F)+        #draw smooth linear models
  facet_wrap(~Type)+                     #divide for groups for represent more info
  labs(title = "concentration of co2")+  #add title and name axis 
  theme_bw()                             #add table theme
  
#type 2
CO2 %>%                               #using pipe_operator
  ggplot(aes(conc,uptake,
             colour = Treatment))+
  geom_point(size =3, alpha = 0.7)+   #point size and transparency
  geom_smooth()


##### making box plots 2 #####

CO2 %>%
  ggplot(aes(Treatment,uptake))+
  geom_boxplot()+
  geom_point(alpha = 0.7,            #here we mapping the geom points only
    aes(size= conc,
                 colour = Plant))+
  facet_wrap(~Type)+
  #coord_flip()+                     #rotate the box plot
  theme_bw()+
  labs(title = "chilled vs non-chilled")


#without coord_flip - see the difference
CO2 %>%
  ggplot(aes(Treatment,uptake))+
  geom_boxplot()+
  geom_point(alpha = 0.7,                #here we mapping the geom points only
             aes(size= conc,
                 colour = Plant))+
  facet_wrap(~Type)+
  coord_flip()+                          #rotate the box plot (H and V)
  theme_bw()+
  labs(title = "chilled vs non-chilled")


##### plot 3 #####

view(mpg)

mpg %>%
  filter(cty<25) %>%              #filtering the city variable values less than 25 and piping it 
  ggplot(aes(displ,cty))+
  geom_point(alpha = 0.7,
             aes(colour = drv,
                 size = trans))+
  geom_smooth(method = lm,se =F)+
  geom_smooth(method = lm)+
  #geom_smooth()+
  facet_wrap(~year, nrow=1)+
  labs(x= "Engine size",
       y= "MPG in the city",
       title= "fuel effciency")+
  theme_bw()

########################## end of the session ##################################

  
   

  
