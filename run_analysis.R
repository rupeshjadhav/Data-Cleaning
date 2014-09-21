setwd("D:\\Data Science\\John Hopkins - Data Science Specialisation\\getwd\\data\\getdata_projectfiles_UCI HAR Dataset\\UCI HAR Dataset")

#

train <- read.csv("./train/X_train.txt", sep="", header=FALSE)
train[,562] <- read.csv("./train/Y_train.txt", sep="", header=FALSE)
train[,563] <- read.csv("./train/subject_train.txt", sep="", header=FALSE)

test <- read.csv("./test/X_test.txt", sep="", header=FALSE)
test[,562] <- read.csv("./test/Y_test.txt", sep="", header=FALSE)
test[,563] <- read.csv("./test/subject_test.txt", sep="", header=FALSE)

allData <- rbind(train, test)

#

alabs <- read.csv("activity_labels.txt", sep="", header=FALSE)


fture <- read.csv("features.txt", sep="", header=FALSE)
fture[,2] = gsub('-mean', 'Mean', fture[,2])
fture[,2] = gsub('-std', 'Std', fture[,2])
fture[,2] = gsub('[-()]', '', fture[,2])


#

colsMSD <- grep(".*Mean.*|.*Std.*", fture[,2])
fture <- fture[colsMSD,]
colsMSD <- c(colsMSD, 562, 563)
allData <- allData[,colsMSD]
colnames(allData) <- c(fture$V2, "Activity", "Subject")
colnames(allData) <- tolower(colnames(allData))

#

Fact = 1
for (FactLabel in alabs$V2) {
  allData$activity <- gsub(Fact, FactLabel, allData$activity)
  Fact <- Fact + 1
}

allData$activity <- as.factor(allData$activity)
allData$subject <- as.factor(allData$subject)

#

tidy = aggregate(allData, by=list(activity = allData$activity, subject=allData$subject), mean)
tidy[,90] = NULL
tidy[,89] = NULL
write.table(tidy, "tidy.txt", sep="\t", row.name=FALSE)
