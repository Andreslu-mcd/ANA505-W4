#Week 4: dplyr package

#Task: Write the function to get a dataset from Base R: HairEyeColor
#and give the dataset a new name of your choice

library(datasets)

w4_dataset <- datasets::HairEyeColor

#See the top rows of the data
#TASK: Write the function to see the top rows of the data

head(w4_dataset)

#Install and call the package dplyr
#TASK: Write the functions to install and call dplyr

install.packages("dplyr")
install.packages("tidyverse")


#Let's just see the hair and sex columns
#Task: Write the function to 'select' just the hair and sex columns 
#(hint: use the 'select' function)

library("dplyr")
library("tidyverse")

w4_dataset <- as_tibble(w4_dataset)

select(w4_dataset, c("Hair", "Sex"))


#Let's name the dataset with just the two columns, Hair and Sex
#TASK: Write the function to save the two columns as one new dataset
#and give it a name

w4_dataset_hair_sex <- select(w4_dataset, c("Hair", "Sex"))


#Let's get rid of the Sex column in the new dataset created above
#TASK: Write the function that deselects the sex column
#(hint: use the 'select' function to not select a -column)

select(w4_dataset_hair_sex, !c("Sex"))

#Let's rename a column name
#TASK: Write the function that renames 'sex' to 'gender'

w4_dataset %>% rename("Gender" = "Sex")

#Let's make a new dataset with the new column name
#TASK: Write the function that names a new dataset that includes the 'gender' column

w4_dataset_gender <- w4_dataset %>% rename("Gender" = "Sex")

#Let's 'filter' just the females from our dataset
#TASK: Write the function that includes only rows that are 'female'

w4_dataset_females <- filter(w4_dataset, Sex == "Female")

#Let's 'group' our data by gender
#TASK: Write the function to group the data by gender (hint: group_by)

group_by(w4_dataset, Sex)

#Let's see how many students were examined in the dataset (total the frequency)
#TASK: replace 'datasetname' with the name of your dataset and get the total
#TASK: After you run it, write the total here:____ (couldn´t calculate the total as we´re given an error)

total=mutate(w4_dataset, total=cumsum(Freq))

## This yields an error: ! Problem while computing `total = cumsum(Freq)`.

#Since we have a females dataset, let's make a males dataset
#TASK: Write the function that includes only rows that are 'male'

w4_dataset_males <- filter(w4_dataset, Sex == "Male")


#And now let's join the males and females
#TASK: Write the function that joins the male and female rows 
#(hint: try using 'union' or 'bind_rows')

w4_dataset_joined <- union(w4_dataset_males, w4_dataset_females)

#Optional Task: add any of the other functions 
#you learned about from the dplyr package

