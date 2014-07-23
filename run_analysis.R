#Project work for cleaning data

today = as.Date(Sys.time())
today
#Converting a data frame into vector
#Reading the colnames and changeing them to a vector
getwd()
setwd("/Users/hpalagiri/Documents/Proj-R/Coursera/class-datasharing/data/proj/UCI HAR Dataset")
#Getting the colnames into a vector
namesDF = read.table(file="features.txt", stringsAsFactors=FALSE)
colnames(namesDF)
class(namesDF)
nameV = namesDF["V2"]
class(nameV)
nameV[3,]
nameVector = unname(unlist(nameV))
str(nameVector)
nameVector[1]
class(nameVector)
is.vector(nameVector)

#reading the train related data and merging them
x.trainDF = read.table (file = "train/X_train.txt")
dim (x.trainDF)
colnames(x.trainDF) = nameVector
#creating a new column in the train DF trying to add the activity labels into it.
y_trainDF = read.table (file="train/y_train.txt")
colnames(y_trainDF) = c("Activity_Label")
subject.trainDF = read.table(file = "train/subject_train.txt")
colnames(subject.trainDF) = c("Subject")

trainDF = cbind.data.frame(subject.trainDF, y_trainDF,x.trainDF)
colnames(trainDF)

#reading the test related data and merging them
x.testDF = read.table(file="test/X_test.txt")
dim (x.testDF)
colnames(x.testDF) = nameVector
y.testDF =read.table(file="test/y_test.txt")
colnames(y.testDF) = c("Activity_Label")
subject.testDF = read.table (file="test/subject_test.txt")
colnames(subject.testDF) = c("Subject")

testDF = cbind.data.frame(subject.testDF, y.testDF, x.testDF)
colnames(testDF)

#Step 1
#Merging both test and train data sets.

mergeData = rbind(trainDF, testDF)

dim(mergeData)

class(mergeData$Activity_Label)
#Converting the Activity_Label to factor 
mergeData$Activity_Label = as.factor(mergeData$Activity_Label)



#Reading the activity labels file
activityLabels = read.table ("activity_labels.txt")
colnames(activityLabels)
m = match (mergeData$Activity_Label, activityLabels$V1)
mergeData$Activity_Name = activityLabels[m,2]
mergeData$Activity_Name[100]

#Step 3 : extracting mean and std columns
#
names = colnames(mergeData)
temp = grep (pattern="mean\\(|std\\(", ignore.case=TRUE,x=names,perl = TRUE)

#Get all the columns into a sperate data set.
class(mergeData)
newDF = (mergeData[,temp])
colnames(newDF)
dim(newDF)
newDF$Subject = mergeData$Subject
newDF$Activity_Name = mergeData$Activity_Name
colnames(newDF)

#Converting the col names into lower case 
colnames(newDF) = tolower(colnames(newDF))
names(newDF)

#Taking out the - from the col names

names(newDF) = sub ("-", ".",names(newDF))
names(newDF)


#Taking out () we had to double back slash it.
colnames(newDF) = sub("\\(\\)", "", names(newDF))

names(newDF)

attach(newDF)
cleanDS = aggregate(x=newDF, by=list(subject, activity_name), FUN= mean, na.rm = TRUE)

cleanDS[3,]

#dropping both Subject and activity_name as they are redundant.
#taking that out.
drop = c("subject", "activity_name")
submitDS = cleanDS[,!(names(cleanDS) %in% drop)]
submitDS[3,]

write.table(x=submitDS, file="tidyData.txt", sep=" ")
dim(submitDS)
colnames(submitDS)

#Group.1 is the Subject
#Group.2 is the Activity Name 
