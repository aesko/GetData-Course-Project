---
title: "GetData Course Project Codebook"
author: "Henri Eskelinen"
date: "21 June 2015"
output: html_document
---

##Source of the raw data
The raw data contains accelerometer and gyroscope measurements taken using a 
Samsung Galaxy SII smartphone. The measurements were taken by 30 subjects performing six activities: lying down, sitting, standing, walking, walking downhill and walking uphill. The accelerometer measured the triaxial linear acceleration of the subject and the gyroscope took measurements for triaxial angular velocity. The measurements were processed into body motion and gravitational motion components and values such as the mean, standard deviation and kurtosis were then calculated for each activity and subject. 

The raw data can be obtained from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

##Explanation of variables
[1] Activity - Name of activity performed

[2] Subject - id number of subject performing the activity

[3] - [81] 
-Variables beginning with 't' signal a measurement of time domain while variables with 'f' prefix signal a measurement in frequency domain
-BodyAcc -> measurements of body acceleration in units of standard gravitation (g)
-GravityAcc -> measurements of body acceleration in units of standard gravitation (g)
-Gyro -> measurements of angular velocity in units of radians/second
-Jerk -> the time derivative of a measurement
-Variables are reported as either 'mean' (average), 'std' (standard deviation) or 'meanFreq' (mean frequency) of the measurement
-All variables are reported either as the X-, Y- or Z- component of acceleration / angular velocity or as magnitude, which is calculated as sqrt(x^2+y^2+z^2)
