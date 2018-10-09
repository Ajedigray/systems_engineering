## OR 568 Homework 1
##PLEASE MAKE SURE THE FILES/PLOTS/PACKAGES SECTION IS LARGE ENOUGH 
##FOR GRAPHS TO DISPLAY. PLEASE MAKE SURE ALL REQUIRED PACKAGES ARE
##INSTALLED

##3.1.a
#install.packages("mlbench")
#install.packages("e1071")
library(mlbench)
library(e1071)
data(Glass)
colnames(Glass)

##hist(Glass$Na, main = "Na")
##hist(Glass$Mg, main = "Mg")
##hist(Glass$Al, main = "Al")
##hist(Glass$Si, main = "Si")
##hist(Glass$K, main = "K")
##hist(Glass$Ca, main = "Ca")
##hist(Glass$Ba, main = "Ba")
##hist(Glass$Fe, main = "Fe")

#subsetting dataset to remove 'type' column
elmns <- Glass[, 1:9]
par(mfrow = c(3,3))
for (i in 1:ncol(elmns)) {
  hist(elmns[,i], xlab = paste(names(elmns[,i])), 
       main = paste(names(elmns[i])), col = "purple4")
}

##relationship (Correlation) between predictors
par(mfrow=c(1,1))
pairs(Glass, main = "Scatterplot Matrix")

par(mfrow=c(1,1))
library(corrplot)
corrplot( cor( Glass[,-10] ), order="hclust")

#3.1.b
#boxplots representing each predictor variable.
#for loop works very nicely here to iterate the whole dataset
full_elmns <- Glass[,1:10]
par(mfrow = c(3,3))
for (i in 1:ncol(elmns)) {
  boxplot(full_elmns[,i] , main = paste(names(full_elmns[i]), "Box Plot"),
          horizontal = T, col = "purple4")
}
#boxplots to visualize distribution
#this shows how each predictor does per Type
par(mfrow = c(3,3))
for (i in 1:ncol(elmns)) {
  boxplot(full_elmns[,i] ~ full_elmns[,10], main = paste(names(full_elmns[i]), "Box Plot"),
          horizontal = F, col = "purple4")
}
#boxplot( Glass$Na ~ Glass$Type, main="Na")

#d <- density(elmns$Na)
#x <- "Na"
#plot(d, main = paste("Kernal Density for" , x))
#polygon(d, col = "purple4", border = "blue")

#Kernal Density to show skewness per element
par(mfrow = c(3,3))
for (i in 1:ncol(elmns)) {
  #built-in density function to save densitiy values
  d <- density(elmns[,i])
  plot(d, main = paste("Kernel Density for", names(elmns[i])))
  #built-in polygon function necessary to represent density and to fill colors appropriately
  polygon(d, col = "purple4", border = "black")
}

#3.1.c
#install.packages("caret")
#install.packages("car")
library(car)
library(caret)
gls <- Glass[,1:9]

#preProcess and predict allow us to transform the data to accomadate for skewness
trans <- preProcess(gls, method = c("BoxCox", "center", "scale"))
glassTrans <- predict(trans, gls)

skew.g1<-sapply(Glass[,1:9], function(x){round(skewness(x),4)})
skew.g2<-sapply(glassTrans[,1:9],function(x){round(skewness(x),4)})
skew.g1
skew.g2

#install.packages("caret")
#install.packages("car")
library(car)
library(caret)

gls <- Glass[,1:9]
par(mfrow = c(3,3))
for (i in 1:ncol(glassTrans)) {
  hist(glassTrans[,i], xlab = paste(names(glassTrans[i])),
       main = paste(names(glassTrans[i])), col = "green4")
}

#for (i in 1:ncol(elmns)) {
#  s <- skewness(elmns[,i])
#  print(paste(names(elmns[i]),":", s))
#}

#3.2.a
library(mlbench)
data("Soybean")
head(Soybean)
#?Soybean
##degenerate distributions are those with zero variance
nzv <- nearZeroVar(Soybean, saveMetrics= TRUE)
show(nzv)


#3.2.b
#install.packages("VIM")
#Yes

library(VIM)
##the aggr function allows me to find and sort the frequeny of missing values per
##categorical predictor. I am then able to display the proportion of missing values
##in a separate visual
aggr(Soybean, delimiter = NULL, prop = c(T,T), bars = TRUE, numbers = TRUE, plot = TRUE,
     sortVars = T, sortCombs = T, labels = names(Soybean), cex.lab = 0.1, cex.axis = 0.7, cex.numbers = 0.6)


#install.packages("dplyr")
library(dplyr)
Soybean %>%
  mutate(Total = n()) %>% ##findng the total number to be used later
  filter(!complete.cases(.)) %>% ##here, I'm finding all na's or missing vals
  group_by(Class) %>% #grouping my results by class
  mutate(Missing = n(), Proportion=Missing/Total) %>% ##new columns to create
  select(Class, Missing, Proportion)%>% #columns to select
  unique() ##distinct values

#Soybean %>%
#  select(Class) %>%
#  unique()

#Soybean %>%
#  mutate(Total = n()) %>%
#  group_by(Class) %>%
#  select(Total, Class) %>%
#  unique()
