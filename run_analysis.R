run_analysis <-function()  {
        # this scipt import, merge and agregate the raw data into tidy data
        
        library(data.table)
        
        #0 import all raw data
        DT_X_train <- data.table(read.table("C_Assignment/train/X_train.txt"))
        DT_X_test <- data.table(read.table("C_Assignment/test/X_test.txt"))
        
        DT_y_train <- fread("C_Assignment/train/y_train.txt")
        DT_y_test <- fread("C_Assignment/test/y_test.txt")
        
        DT_subject_train <-fread("C_Assignment/train/subject_train.txt")
        DT_subject_test <-fread("C_Assignment/test/subject_test.txt")
        
        features<-fread("C_Assignment/features.txt")
        activity_label<-fread("C_Assignment/activity_labels.txt")
        
        # 1 Merges the training and the test sets to create one data set.
        
        DT_X_set<-rbindlist(list(DT_X_train,DT_X_test))
        DT_y_label<-rbindlist(list(DT_y_train,DT_y_test))
        DT_subject_label<-rbindlist(list(DT_subject_train,DT_subject_test))
        
        rm(DT_X_train,DT_X_test,DT_y_train, DT_y_test, DT_subject_train, DT_subject_test)
        gc() # removal of the raw data in order to gain memory
        
        # 2 Extracts only the measurements on the mean and standard deviation for each measurement.
        
        ncol<-grep("std|mean\\b",features$V2) #nb of the column to keep
        feature2 <- features[ncol,] #feature name to keep
        DT_X_set<-subset(DT_X_set,,ncol) #data to keep
        
        # 3-4 Appropriately labels the data set with descriptive variable names and Uses descriptive activity names to name the activities in the data set
        # NB : the "merge" function has to be done in latest because it melts the initial rows order 
        
        
        setnames(DT_X_set,feature2$V2) # label the data set with the descriptive variable
        
        Data_set<-cbind(DT_y_label,DT_subject_label,DT_X_set) #add subjects ID too in order not to lose the information after the merge
        
        colnames(Data_set)[2]<-"subject"
        
        Data_set<- merge(activity_label,Data_set,by="V1") #merge of the activity nb and activity label
        
        colnames(Data_set)[1]<-"activity_code"
        colnames(Data_set)[2]<-"activity_label"
              
        #5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
        mean_data_set <-Data_set[,lapply(.SD,mean),by=list(activity_label,subject)]
       
        write.table(mean_data_set,"mean_data_set.txt",row.names = FALSE) # export the final data into a txt file in the working directory
        
} 
