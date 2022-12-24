# Joe O'Regan
# 21/12/2022

# variables:
# gender, test_group, pre_trial_cpss, post_trial_cpss, pre_trial_or, post_trial_or

# remove.packages("dplyr")
if(!require("tidyr")) install.packages("tidyr")
if(!require("dplyr")) install.packages("dplyr")

cat("\014")

library(readr)
raw_data <-read_csv("daie_ca3_data_5.csv") # read raw data from csv
# View(raw_data) # view data

# raw_data[raw_data == ''] <-NA

library(dplyr)
raw_data <- na_if(raw_data, '')
#print(raw_data)
#View(raw_data)
control_group <- filter(raw_data, test_group == "Control")
# View(control_group)

static_group <- filter(raw_data, test_group == "Static")
# View(static_group)

control_group$cpss_diff <- control_group$pre_trial_cpss - control_group$post_trial_cpss
View(control_group)

View(glimpse(control_group$gender))


# glimpse(data5) # explore the variable types

# types:
# chr - character, int - integer, dbl - double,

# factor (size)
# ordinal categorical variable - order matters

# class(data5$gender)
# class(data5$test_group)
# class(data5$pre_trial_cpss)
# class(data5$post_trial_cpss)
# class(data5$pre_trial_or)
# class(data5$post_trial_or)

unique(data5$gender)
unique(data5$test_group)
unique(data5$pre_trial_cpss)
# unique(data5$post_trial_cpss)
# unique(data5$pre_trial_or)
# unique(data5$post_trial_or)

# NA = not available
# view(data5) ##
