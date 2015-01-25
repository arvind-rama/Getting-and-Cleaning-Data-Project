## Code Book 
### Dataset and Variable
Map to source data:
 - `test/X_test.txt` will give us the local variable, `test.x` containing all the 541 columns of raw data in the test set
 - `train/X_train.txt` will give us the local variable, `train.x` containing all the 541 columns of raw data in the training set
 - `activities.txt` will give us the local variable, `activity_labels` containing all the different types of activities: `WALKING`, `WALKING_UPSTAIRS`, `SITTING`, etc
 - `train/subject_train.txt` will give us the local variable, `train.subject` containing all the possible subject data inside the training set.
 - `test/subject_test.txt` will give us the local variable, `test.subject` containing all the possible subject data inside the test set.
 - `train/y_train.txt` will give us the local variable, `train.y` containing all the possible label data inside the training set.
 - `test/y_test.txt` will give us the local variable, `test.y` containing all the possible label data inside the test set. 

Merged and Manipulated:
 - `stdmeanfeatures`  will give us the local variable contains the filtered features , filtered by std and mean
 - `stdmeantest.x`   will give us the local variable  post filter the `test.x` data frame , based on `stdmeanfeatures`
 - `stdmeantrain.x`   will give us the local variable  post filter the `train.x` data frame , based on `stdmeanfeatures`
 - `merged_train`  will give us the local variable that is a data frame creating by merging `train.subject` and `stdmeantrain.x` and `train.y`
 - `merged_test`  will give us the local variable that is a data frame creating by merging `test.subject` and `stdmeantest.x` and `test.y`
 - `completely_merged_data`   will give us the local variable that is a data frame creating by merging `merged_train` and `merged_test`
