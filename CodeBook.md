# Getting-and-cleaning-data

 A code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 
 

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

#Transformation

Basically what I did are the following:
- Load all the data sets we need
- give the names to X-test and X-train accordig to the features
- assign the names to activity based on the activity ID
- extract the mean and std by looking for the these two characters
- combine the X-test ,subject,Y-test,same for train
- combine the two data sets
- creat the clean data set using aggregate function

My final tidy data set has 180 columns which makes sense because there are thirty subjects and each has 6 activities.

I also made a lot comments in .R file. It should be not difficult to understand the code. 
Each line of code has the comment above.

# Thank you.
