
############################################################################
# TO-DO
# 
# 
# 
############################################################################

library(dplyr)

##The clean_data() function below is the master function.
##It cleans the training and test data sets separately to reduce memory usage.
##After that, the data sets are combined and the labels for the activities
##are read in as factors.

clean_data <- function(){
        #load and process training set data
        training_set <- cleaner(6, 7, 8)
        
        #load and process test set data
        test_set <- cleaner(3, 4, 5)
        
        #merge the cleaned and filtered training and test sets
        fulldata <- rbind(training_set, test_set)
       
        #fetch proper labels for Activity
        cleandata <- label(fulldata)
        
        #calculate average values for measurements for each activity and subject
        groupdata <- group_by(cleandata, Activity, Subject)
        meandata <- summarise_each(groupdata, funs(mean))
        
        write.table(meandata, 'ActivityData.txt', row.name=FALSE)
}


##load and process a given datatable
cleaner <- function(x, y, z){
        #load data set and activity labels
        path <- loadPATHS()
        featuredata <- read.table(path[x], sep = '')
        labeldata <- read.table(path[y], sep = '')
        subjectdata <- read.table(path[z], sep = '')
        
        #bind labels with data, assign collumn names
        tempdata <- cbind(labeldata, subjectdata)
        maindata <- cbind(tempdata, featuredata)
        store <- loadSTORE()
        names(maindata) <- c('Activity', 'Subject', store[[1]])
        
        #filter desired collumns
        sel1 <- grep('mean', names(maindata))   #index of names containing 'mean'
        sel2 <- grep('std', names(maindata))    #index of names containing 'std'
        maindata <- maindata[, c(1, 2, c(sel1, sel2)[order(c(sel1, sel2))])]
        maindata
}


##replace numbers Activity collumn with proper labels for the Activities
label <- function (data){
        store <- loadSTORE()
        
        for(i in 1:nrow(data)){
                data$ActTemp[i] <- store[[2]][data$Activity[i]]         
        }
        
        data$Activity <- data$ActTemp
        data <- select(data, -ActTemp)
        data$Activity <- as.factor(tolower(data$Activity))
        data
}


##load paths, return as character vector
loadPATHS <- function(){
        #file paths
        features_path <- 'UCI HAR Dataset/features.txt'
        act_labels_path <- 'UCI HAR Dataset/activity_labels.txt'
        x_test_path <- 'UCI HAR Dataset/test/X_test.txt'
        y_test_path <- 'UCI HAR Dataset/test/y_test.txt'
        sub_test_path <- 'UCI HAR Dataset/test/subject_test.txt'
        x_train_path <- 'UCI HAR Dataset/train/X_train.txt'
        y_train_path <- 'UCI HAR Dataset/train/y_train.txt'
        sub_train_path <- 'UCI HAR Dataset/train/subject_train.txt'
        
        c(features_path,    #1
          act_labels_path,  #2
          x_test_path,      #3
          y_test_path,      #4
          sub_test_path,    #5
          x_train_path,     #6
          y_train_path,     #7
          sub_train_path    #8
        )
}


##load features and activity labels, return as list of vectors
loadSTORE <- function(){
        #load data
        path <- loadPATHS()
        features <- as.character(read.table(path[1], sep = '')[, 2])
        act_labels <- as.character(read.table(path[2], sep = '')[, 2])
        
        list(features,
             act_labels)
}