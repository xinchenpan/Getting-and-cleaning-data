library(reshape2)

## load the X_test and Y_test data sets
X_test <- read.table("X_test.txt")
Y_test <- read.table("Y_test.txt")

## We know that each row represents one type of activity
## load activity label
activity_label <- read.table("activity_labels.txt")

## change the number to the activity name
Y_test[,2] <- activity_label[,2][Y_test[,1]]

## load the features,then extract mean and standard deviation for each measurement

feature <- read.table("features.txt")
feature_mean_std <- grep("mean|std",feature[,2])

## give the name of the X_test ,Y_test and subject
names(X_test) <- feature[,2]
names(Y_test) <- c("Activity_ID","Activity")
names(subject_test) <- "Subject"

## Get the new X_test based on the indices we just extracted

X_test1 <- X_test[,feature_mean_std]
length(X_test1)

## load the subject
subject_test <- read.table("subject_test.txt")
subject_train <- read.table("subject_train.txt")

##combine the data  and the cleaning for test is complete  ^_^
test <- cbind(subject_test, Y_test, X_test1)

##Read the training data set
X_train <- read.table("X_train.txt")
Y_train <- read.table("y_train.txt")

## label the name as above
Y_train[,2] <- activity_label[,2][Y_train[,1]]
names(X_train) <- feature[,2]
names(Y_train) <- c("Activity_ID","Activity")
names(subject_train) <- "Subject"

## Get the new X_train based on the indices we just extracted
X_train1 <- X_train[,feature_mean_std]

##combine the data
train <- cbind(subject_train, Y_train, X_train1)

## merge the data
train_test <- rbind(test, train)

## calculate mean according to activity
##walking_mean <- rowMeans((subset(train_test, train_test[,3]=='WALKING')[,4:length(train_test)]))
##walkingup_mean <-  rowMeans((subset(train_test, train_test[,3]=='WALKING_UPSTAIRS')[,4:length(train_test)]))
##walkingdown_mean <- rowMeans((subset(train_test, train_test[,3]=='WALKING_DOWNSTAIRS')[,4:length(train_test)]))
##sitting_mean <- rowMeans((subset(train_test, train_test[,3]=='SITTING')[,4:length(train_test)]))
##standing_mean <- rowMeans((subset(train_test, train_test[,3]=='STANDING')[,4:length(train_test)]))
##laying_mean <- rowMeans((subset(train_test, train_test[,3]=='LAYING')[,4:length(train_test)]))

#Clearly not a good idea ! ???

## Use aggregate function

tidy_data <- aggregate(train_test[,4:ncol(train_test)],by=list(Subject = train_test[,1],Activity= train_test[,3]),mean)
head(tidy_data)


write.table(format(tidy_data, scientific=T), "tidy_data.txt",row.names=FALSE)
