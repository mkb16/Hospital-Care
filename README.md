# Hospital-Care
Analyzed the quality of over 4000 Medicare-Certified hospitals in the U.S to figure out the best and the worst hospital in each state.

## Introduction 
The data for this assignment come from the Hospital Compare web site (http://hospitalcompare.hhs.gov)
run by the U.S. Department of Health and Human Services. The purpose of the web site is to provide data and
information about the quality of care at over 4,000 Medicare-certified hospitals in the U.S. This dataset essentially
covers all major U.S. hospitals. This dataset is used for a variety of purposes, including determining
whether hospitals should be fined for not providing high quality care to patients (see http://goo.gl/jAXFX
for some background on this particular topic).

The Hospital Compare web site contains a lot of data and we will only look at a small subset for this
assignment. The zip file for this assignment contains three files
* outcome-of-care-measures.csv: Contains information about 30-day mortality and readmission rates
for heart attacks, heart failure, and pneumonia for over 4,000 hospitals.
* hospital-data.csv: Contains information about each hospital.
* Hospital_Revised_Flatfiles.pdf: Descriptions of the variables in each file (i.e the code book).

A description of the variables in each of the files is in the included PDF file named Hospital_Revised_Flatfiles.pdf.
This document contains information about many other files that are not included with this programming
assignment. You will want to focus on the variables for Number 19 (“Outcome of Care Measures.csv”) and
Number 11 (“Hospital Data.csv”). You may find it useful to print out this document (at least the pages for
Tables 19 and 11) to have next to you while you work on this assignment. In particular, the numbers of
the variables for each table indicate column indices in each table (i.e. “Hospital Name” is column 2 in the
outcome-of-care-measures.csv file).

## The following issues are addressed 

# Finding the best hospital in a state

This function called best takes two arguments: the 2-character abbreviated name of a state and an
outcome name. The function reads the outcome-of-care-measures.csv file and returns a character vector
with the name of the hospital that has the best (i.e. lowest) 30-day mortality for the specified outcome
in that state. The hospital name is the name provided in the Hospital.Name variable. The outcomes can
be one of “heart attack”, “heart failure”, or “pneumonia”. Hospitals that do not have data on a particular
outcome should be excluded from the set of hospitals when deciding the rankings.

The function also checks the validity of its arguments. If an invalid state value is passed to best, the
function should throw an error via the stop function with the exact message “invalid state”. If an invalid
outcome value is passed to best, the function should throw an error via the stop function with the exact
message “invalid outcome”.

Here is some sample output from the function.

source("best.R")  
best("TX", "heart attack")  
/n [1] "CYPRESS FAIRBANKS MEDICAL CENTER"

best("TX", "heart failure")  
[1] "FORT DUNCAN MEDICAL CENTER"  

best("MD", "heart attack")  
[1] "JOHNS HOPKINS HOSPITAL, THE"  

best("MD", "pneumonia")  
[1] "GREATER BALTIMORE MEDICAL CENTER"

best("BB", "heart attack")  
Error in best("BB", "heart attack") : invalid state  

best("NY", "hert attack")  
Error in best("NY", "hert attack") : invalid outcome  

# Ranking hospitals by outcome in a state

This function called rankhospital that takes three arguments: the 2-character abbreviated name of a
state (state), an outcome (outcome), and the ranking of a hospital in that state for that outcome (num).
The function reads the outcome-of-care-measures.csv file and returns a character vector with the name
of the hospital that has the ranking specified by the num argument. 
For example, the call rankhospital("MD", "heart failure", 5) would return a character vector containing the name of the hospital with the 5th lowest 30-day death rate for heart failure. The num argument can take values “best”, “worst”, or an integer indicating the ranking (smaller numbers are better). If the number given by num is larger than the number of hospitals in that state, then the function should return NA. Hospitals that do not have data on a particular outcome should be excluded from the set of hospitals when deciding the rankings

**Handling ties**. It may occur that multiple hospitals have the same 30-day mortality rate for a given cause
of death. In those cases ties are broken by using the hospital name. 

The function also checks the validity of its arguments. If an invalid state value is passed to rankhospital, the function should throw an error via the stop function with the exact message “invalid state”. If an invalid outcome value is passed to rankhospital, the function should throw an error via the stop function with the exact message “invalid outcome”.

Here is some sample output from the function.

source("rankhospital.R")

rankhospital("TX", "heart failure", 4)  
[1] "DETAR HOSPITAL NAVARRO"

rankhospital("MD", "heart attack", "worst")  
[1] "HARFORD MEMORIAL HOSPITAL"

rankhospital("MN", "heart attack", 5000)  
[1] NA

#  Ranking hospitals in all states

This function caleed rankall takes two arguments: an outcome name (outcome) and a hospital ranking (num). The function reads the outcome-of-care-measures.csv file and returns a 2-column data frame containing the hospital in each state that has the ranking specified in num. For example the function call rankall("heart attack", "best") would return a data frame containing the names of the hospitals that are the best in their respective states for 30-day heart attack death rates. The function should return a value
for every state (some may be NA). The first column in the data frame is named hospital, which contains
the hospital name, and the second column is named state, which contains the 2-character abbreviation for
the state name. Hospitals that do not have data on a particular outcome should be excluded from the set of
hospitals when deciding the rankings

**Handling ties.** The rankall function handles ties in the 30-day mortality rates in the same way
that the rankhospital function handles ties.

The function checks the validity of its arguments. If an invalid outcome value is passed to rankall,
the function should throw an error via the stop function with the exact message “invalid outcome”. The num
variable can take values “best”, “worst”, or an integer indicating the ranking (smaller numbers are better).
If the number given by num is larger than the number of hospitals in that state, then the function should
return NA.

Here is some sample output from the function.

source("rankall.R")
head(rankall("heart attack", 20), 10)

|     | hospital | state |
|-----|----------|-------|
| AK  |   NA     |  AK   |
| AL  | D W MCMILLAN MEMORIAL HOSPITAL | AL |
| AR | ARKANSAS METHODIST MEDICAL CENTER | AR |
| AZ | JOHN C LINCOLN DEER VALLEY HOSPITAL | AZ |
| CA | SHERMAN OAKS HOSPITAL | CA |
| CO | SKY RIDGE MEDICAL CENTER | CO |
| CT | MIDSTATE MEDICAL CENTER | CT |
| DC | NA | DC |
| DE | NA | DE |
| FL | SOUTH FLORIDA BAPTIST HOSPITAL | FL |




