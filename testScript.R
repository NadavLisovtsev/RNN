library(rnn)

model <- readRDS("C:\\Users\\Ola\\Desktop\\Nadav\\RNN\\model.rds")

# MAKE PREDICTIONS
TestX1 <- read.csv("C:\\Users\\Ola\\Desktop\\Nadav\\LearningResults\\RNNData\\testX1.csv", head=FALSE, sep=",")
TestX2 <- read.csv("C:\\Users\\Ola\\Desktop\\Nadav\\LearningResults\\RNNData\\testX2.csv", head=FALSE, sep=",")
TestY <- read.csv("C:\\Users\\Ola\\Desktop\\Nadav\\LearningResults\\RNNData\\testY.csv", head=FALSE, sep=",")

TestX1 = array(c(TestX1[,1],TestX1[,2],TestX1[,3],TestX1[,4],TestX1[,5],TestX1[,6],TestX1[,7],TestX1[,8],TestX1[,9],TestX1[,10],TestX1[,11],TestX1[,12],TestX1[,13],TestX1[,14],TestX1[,15],TestX1[,16],TestX1[,17],TestX1[,18],TestX1[,19]),dim=c(dim(TestX1)[1],19))
TestX2 = array(c(TestX2[,1],TestX2[,2],TestX2[,3],TestX2[,4],TestX2[,5],TestX2[,6],TestX2[,7],TestX2[,8],TestX2[,9],TestX2[,10],TestX2[,11],TestX2[,12],TestX2[,13],TestX2[,14],TestX2[,15],TestX2[,16],TestX2[,17],TestX2[,18],TestX2[,19]),dim=c(dim(TestX2)[1],19))
TestY = array(c(TestY[,1],TestY[,2],TestY[,3],TestY[,4],TestY[,5],TestY[,6],TestY[,7],TestY[,8],TestY[,9],TestY[,10],TestY[,11],TestY[,12],TestY[,13],TestY[,14],TestY[,15],TestY[,16],TestY[,17],TestY[,18],TestY[,19]),dim=c(dim(TestY)[1],19))

TestX <- array( c(TestX1,TestX2), dim=c(dim(TestX1),2) )
PredictedY  <- predictr(model, TestX[,dim(TestX)[2]:1,,drop=F])

D = abs(TestY - PredictedY)
meanError = mean(D)
cat(meanError)