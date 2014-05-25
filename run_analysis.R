

###############TRAINING#####################
trainingXData = read.table("./train/X_train.txt")

trainingYData = read.table("./train/y_train.txt")
colnames(trainingYData) =  "Activity"

trainingSubjectData = read.table("./train/subject_train.txt")
colnames(trainingSubjectData) = "Subject"


# merge main training data with activity & subject data
trainingData = cbind(trainingXData,trainingYData)
trainingData = cbind(trainingData,trainingSubjectData)

# Reading test data
testXData = read.table("./test/X_test.txt")
testYData = read.table("./test/y_test.txt")

colnames(testYData) = "Activity"
testSubjectData = read.table("./test/subject_test.txt")

colnames(testSubjectData) = "Subject"

# merge main test data with activity & subject data
testData = cbind(testXData,testYData)
testData = cbind(testData,testSubjectData)


#merge complete test and training data
allData<-rbind(testData,trainingData)


# Read activity level data
activityLabelData = read.table("activity_labels.txt",sep="")


#ActivityLabels
allData = merge(allData,activityLabelData,by.x="Activity",by.y="V1")

features = read.table("features.txt")

write.table(allData,"allData.txt",sep="")



#Select columns with Average and Std data sets
tidyData = allData[,c(1,2,3,4,5,6,41,42,43,44,45,46,81,82,83,84,85,86,121,122,123,124,
                            125,126,161,162,163,164,165,166,201,202,214,215,227,228,240,241,
                            253,254,266,267,268,269,270,271,294,295,296,345,346,347,348,349,
                            350,373,374,375,424,425,426,427,428,429,452,453,454,503,504,513,
                            516,517,526,529,530,531,539,542,543,552,555,556,557,558,559,560,
                            561)]
write.table(tidyData,paste("tidyData.txt",sep=""))

