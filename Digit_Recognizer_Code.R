setwd("C:/Users/mattb/Desktop/Init/Programming/Data Science/Kaggle/Digit_Recognizer/Data")

# 28 X 28 matrix - 784 pixels in total - 785 columns first column is label of number

library(lattice)

library(ggplot2)

install.packages("caret")
library(caret)

install.packages("randomForest")
library(randomForest)

digit.test <- read.csv("test.csv", header = TRUE)
digit.train <- read.csv("train.csv", header = TRUE)

digit.train$label <- as.factor(digit.train$label)
                     
str(digit.train)
                     
table(digit.train$label)
                    
prop.table(table(digit.train$label))*100
                                                
randomforest1 <- randomForest(label ~ ., data = digit.train, ntree = 50)
                                                
pred1 <- predict(randomforest1, digit.test)
                                                
output <- data.frame(pred1)

output.submit = data.frame(ImageId = seq(1,length(output$pred1)), Label = output$pred1)

# Write the solution to file
write.csv(output.submit, file = 'mod1_Solution.csv', row.names = F)

#result was over 96% accuracy



