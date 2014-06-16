CDP
===

Cleaning Data Project

The run_analysis R funtion takes run data from a dataset measuring 30 volunteers performing 6 activities wearing a wearing a smartphone (Samsung Galaxy S II) on the waist.

Details about the input can be found at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The steps for run_analysis.R are the following:
	Load and transpose the test subject row lables.
	Load up all test data and assign row names and headers.
	Load up all trianing data and assign row names and headers.
	Merge the training and test data.
	Calculate Mean and Standard deviation using the merged data.
	Label the rows and columns of the first output file.
	Write the first output file to disk.

The first output will consist of two rows, the first being the mean of each column of the data input and a column of the standard deviation of the data input.

Below is a description of the columns of the input and output

Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

The first output is called output_A.csv

The second part of the program creates an output simular to the output in the first part but for each indiviual user and activity type.
	Ensure the second output does not exist
   		Run a loop for each physical activity (1-6)
     			Run a loop for each test subject (1-30)
      				Create header for each report
      				Write headerfor each report
      				Create each report
      				Label the rows and columns of the each of the second outputs
      				Write each of the second outputs to disk

Each report representing an activity by an individual (6 activities, 30 individuals results in 180 reports) will have a header defining the Activity and Subject.

Each activity number respresented by (1-6) respresent the following: 
1 WALKING
2 WALKING_UPSTAIRS

3 WALKING_DOWNSTAIRS

4 SITTING

5 STANDING

6 LAYING


Each of the 180 reports will have a header like the one below and the data format will be identical to output_A.csv regarding the mean and standard deviation.

	Activity	Subject
 	1		1

The second output is called output_B.csv

