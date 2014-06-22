

###############Column Labels#####################
features = read.table("features.txt")
features$V2 = gsub("[[:punct:]]","",features$V2)


###############TRAINING#####################
trainingXData = read.table("./train/X_train.txt")
colnames(trainingXData) = features$V2

trainingYData = read.table("./train/y_train.txt")
colnames(trainingYData) =  "Activity"

trainingSubjectData = read.table("./train/subject_train.txt")
colnames(trainingSubjectData) = "Subject"


# Merge main training data with activity & subject data
trainingData = cbind(trainingXData,trainingYData)
trainingData = cbind(trainingData,trainingSubjectData)

# Reading test data
testXData = read.table("./test/X_test.txt")
testYData = read.table("./test/y_test.txt")

colnames(testXData) = features$V2
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


#Select columns with Average and Std data sets
selectColumns = grep("mean|std|Activity|Subject", colnames(allData))
tidyData1 = allData[,selectColumns]

#ActivityLabels
tidyData1 = merge(tidyData1,activityLabelData,by.x="Activity",by.y="V1")
tidyData1$Activity = tidyData1$V2
tidyData1$V2 = NULL



#Aggregate or find mean of every value for each Activity & subject
tidyData2 = aggregate(tidyData1,by=list(tidyData1$Activity,tidyData1$Subject), FUN=mean)
#Remove group by columns
tidyData2$Activity = NULL  
tidyData2$Subject = NULL
# Rename Group columns to activity and subject
names(tidyData2)[1] = "Activity"
names(tidyData2)[2] = "Subject"


# Write Aggregate function result to a output text file
write.table(tidyData2,file = "TidyData.txt", append = FALSE, quote = TRUE, sep = " ",
            eol = "\n", na = "NA", dec = ".", row.names = FALSE,
            col.names = TRUE, qmethod = c("escape", "double"), fileEncoding = "")

output = read.table("TidyData.txt")