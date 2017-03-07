library(rnn)

# load data
X1 <- read.csv("C:\\Users\\Ola\\Desktop\\Nadav\\LearningResults\\RNNData\\var1.csv", head=FALSE, sep=",")
X2 <- read.csv("C:\\Users\\Ola\\Desktop\\Nadav\\LearningResults\\RNNData\\var2.csv", head=FALSE, sep=",")
Y <- read.csv("C:\\Users\\Ola\\Desktop\\Nadav\\LearningResults\\RNNData\\Y.csv", head=FALSE, sep=",")

# re-arrange data
x1 = array(c(X1[,1],X1[,2],X1[,3],X1[,4],X1[,5],X1[,6],X1[,7],X1[,8],X1[,9],X1[,10],X1[,11],X1[,12],X1[,13],X1[,14],X1[,15],X1[,16],X1[,17],X1[,18],X1[,19]),dim=c(dim(X1)[1],19))
x2 = array(c(X2[,1],X2[,2],X2[,3],X2[,4],X2[,5],X2[,6],X2[,7],X2[,8],X2[,9],X2[,10],X2[,11],X2[,12],X2[,13],X2[,14],X2[,15],X2[,16],X2[,17],X2[,18],X2[,19]),dim=c(dim(X2)[1],19))
y = array(c(Y[,1],Y[,2],Y[,3],Y[,4],Y[,5],Y[,6],Y[,7],Y[,8],Y[,9],Y[,10],Y[,11],Y[,12],Y[,13],Y[,14],Y[,15],Y[,16],Y[,17],Y[,18],Y[,19]),dim=c(dim(Y)[1],19))

# build 3D arrays
X <- array( c(x1,x2), dim=c(dim(x1),2) )
Y <- array( y, dim=c(dim(y),1) )

#train rnn
 model <- trainr(Y=Y[,dim(Y)[2]:1,,drop=F], # we inverse the time dimension
                 X=X[,dim(X)[2]:1,,drop=F], # we inverse the time dimension
                 learningrate   =  0.1,
                 hidden_dim     = 100,
                 batch_size = 100,
                 numepochs = 2)

#save model to disk
saveRDS(model, "C:\\Users\\Ola\\Desktop\\Nadav\\RNN\\model.rds")

# MAKE PREDICTIONS
#TestX1 <- read.csv("C:\\Users\\Ola\\Desktop\\Nadav\\LearningResults\\RNNData\\var1.csv", head=FALSE, sep=",")
#TestX2 <- read.csv("C:\\Users\\Ola\\Desktop\\Nadav\\LearningResults\\RNNData\\var2.csv", head=FALSE, sep=",")
#TestY <- read.csv("C:\\Users\\Ola\\Desktop\\Nadav\\LearningResults\\RNNData\\Y.csv", head=FALSE, sep=",")
#
#TestX1 = array(c(TestX1[,1],TestX1[,2],TestX1[,3],TestX1[,4],TestX1[,5],TestX1[,6],TestX1[,7],TestX1[,8],TestX1[,9],TestX1[,10],TestX1[,11],TestX1[,12],TestX1[,13],TestX1[,14],TestX1[,15],TestX1[,16],TestX1[,17],TestX1[,18],TestX1[,19]),dim=c(dim(TestX1)[1],19))
#TestX2 = array(c(TestX2[,1],TestX2[,2],TestX2[,3],TestX2[,4],TestX2[,5],TestX2[,6],TestX2[,7],TestX2[,8],TestX2[,9],TestX2[,10],TestX2[,11],TestX2[,12],TestX2[,13],TestX2[,14],TestX2[,15],TestX2[,16],TestX2[,17],TestX2[,18],TestX2[,19]),dim=c(dim(TestX2)[1],19))
#TestY = array(c(TestY[,1],TestY[,2],TestY[,3],TestY[,4],TestY[,5],TestY[,6],TestY[,7],TestY[,8],TestY[,9],TestY[,10],TestY[,11],TestY[,12],TestY[,13],TestY[,14],TestY[,15],TestY[,16],TestY[,17],TestY[,18],TestY[,19]),dim=c(dim(TestY)[1],19))
#
#TestX <- array( c(TestX1,TestX2), dim=c(dim(TestX1),2) )
#PredictedY  <- predictr(model, TestX[,dim(TestX)[2]:1,,drop=F])
#
#D = abs(TestY - PredictedY)
#meanError = mean(D)
#cat(meanError)

