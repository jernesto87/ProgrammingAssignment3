# ProgrammingAssignment3 - Getting and Cleaning Data Course Project

The script works by directly executing the run_analysis.r file making sure that the "prog-assignment-3" folder containing the Samsung data is also available and located within the same directory.

The flow of the script starts by extracting only the mean and standard deviation columns from the train and test datasets. In addition, train and test subjects are also extracted to create two custom datasets including the mentioned columns.

Once created the two mentioned custom datasets a single one is created by merging them.

After that, the descriptive activity names are applied as obtained from the activity file and applied to the merged dataset from the previous step.

Then, variable names are updated to make them more descriptive and removing abbreviations based on the current codebook.
Once the previous process is completed, the modified names are applied to the merged datset.

Ultimately, an independent dataset with the average of each variable per each activity and subject is generated. Once the final dataset is generated, it is written to the current working directory and also displayed in console.



