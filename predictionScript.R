library(rnn)

model = readRDS("C:\\Users\\Ola\\Desktop\\Nadav\\RNN\\model.rds")

TestX1 <- read.csv("C:\\Users\\Ola\\Desktop\\Nadav\\LearningResults\\RNNData\\predict1.csv", head=FALSE, sep=",")
TestX2 <- read.csv("C:\\Users\\Ola\\Desktop\\Nadav\\LearningResults\\RNNData\\predict2.csv", head=FALSE, sep=",")

#TestX1 = array(c(TestX1[,1],TestX1[,2],TestX1[,3],TestX1[,4],TestX1[,5],TestX1[,6],TestX1[,7],TestX1[,8],TestX1[,9],TestX1[,10],TestX1[,11],TestX1[,12],TestX1[,13],TestX1[,14],TestX1[,15],TestX1[,16],TestX1[,17],TestX1[,18],TestX1[,19]),dim=c(dim(TestX1)[1],19))
#TestX2 = array(c(TestX2[,1],TestX2[,2],TestX2[,3],TestX2[,4],TestX2[,5],TestX2[,6],TestX2[,7],TestX2[,8],TestX2[,9],TestX2[,10],TestX2[,11],TestX2[,12],TestX2[,13],TestX2[,14],TestX2[,15],TestX2[,16],TestX2[,17],TestX2[,18],TestX2[,19]),dim=c(dim(TestX2)[1],19))

TestX <- array(c(as.numeric(TestX1), as.numeric(TestX2)), dim=c(dim(TestX1),2))

PredictedY  <- predictr(model, TestX[,dim(TestX)[2]:1,,drop=F])

cat(PredictedY[length(PredictedY)])





#myArgs <- commandArgs(trailingOnly = TRUE)
#
#modelPath <- myArgs[1]
#
#numericArgs <- myArgs[2:length(myArgs)]
#nums = as.numeric(numericArgs)
#
#numOfArgs <- nums[1]
#x1 <- nums[2:(numOfArgs+1)]
#x2 <- nums[(numOfArgs+2):length(nums)]
#
##making x1,x2 2D arrays
#x1 <- array(x1, dim=c(length(x1),1)
#x2 <- array(x2, dim=c(length(x2),1)
#
##combining to 3D array
#x <- array(c(x1,x2), dim=c(dim(x1),2)
#
#model <- readRDS(modelPath)
#
#prediction <- predictr(model, x[,dim(x)[2]:1,,drop=F])
#
#cat(prediction[length(d)])
