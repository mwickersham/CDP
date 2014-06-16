run_analysis<-function(){
  ###load and transpose the test subject row lables
  subject_test <- read.table("~/R/UCI HAR Dataset/test/subject_test.txt", quote="\"")
  colnames(subject_test)<-"Subject"
  subject_train <- read.table("~/R/UCI HAR Dataset/train/subject_train.txt", quote="\"")
  colnames(subject_train)<-"Subject"
  features <- read.table("~/R/UCI HAR Dataset/features.txt", quote="\"")
  features<-t(features)
  features<-features[-1,]
  ###load up all test data and assign row names and headers
  X_test <- read.table("~/R/UCI HAR Dataset/test/X_test.txt", quote="\"")
  colnames(X_test)<-features
  Y_test <- read.table("~/R/UCI HAR Dataset/test/Y_test.txt", quote="\"")
  colnames(Y_test)<-"Activity"
  ###load up all trianing data and assign row names and headers
  X_train <- read.table("~/R/UCI HAR Dataset/train/X_train.txt", quote="\"")
  colnames(X_train)<-features
  Y_train <- read.table("~/R/UCI HAR Dataset/train/Y_train.txt", quote="\"")
  colnames(Y_train)<-"Activity"
  ###merge the training and test data
  test_data<-cbind(X_test,Y_test,subject_test)
  train_data<-cbind(X_train,Y_train,subject_train)
  df<-rbind(train_data,test_data)
  ### calculate Mean and Standard deviation using the merged data
  output1<-colMeans(df[1:561],na.rm = FALSE, dims = 1)
  output2<-apply(df[1:561],2,sd)
  outputa<-rbind(output1,output2)
  ### label the rows and columns of the first output file
  colnames(outputa)<-features
  rownames(outputa)<-c("Mean","Standard Deviation")
  ### write the first output file to disk
  write.table(outputa,file="Output_A.csv",sep=",",col.names=NA)
  ###ensure the second output does not exist
  unlink("Output_B.csv")
  ###a loop for each activity
  for (cntact in 1:6){
    ###a loop for each test subject
    for(cntsub in 1:30){
      ##create label for each report
      actsublab<-cbind(cntact,cntsub)
      colnames(actsublab)<-c("Activity","Subject")
      rownames(actsublab)<-" "
      ##write label for each report
      write.table(actsublab,file="Output_B.csv",sep=",",append=T,col.names=NA)
      ##create each report
      subdf<-subset(df,df[["Activity"]]==cntact&df[["Subject"]]==cntsub)
      output1<-colMeans(subdf[1:561],na.rm = FALSE, dims = 1)
      output2<-apply(subdf[1:561],2,sd)
      outputa<-rbind(output1,output2)
      ### label the rows and columns of the each of the second outputs
      colnames(outputa)<-features
      rownames(outputa)<-c("Mean","Standard Deviation")
      ### write each of the second outputs to disk
      write.table(outputa,file="Output_B.csv",sep=",",append=T,col.names=NA)
      }
    }
  }
