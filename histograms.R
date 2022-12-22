## Control Groups

if(!require("readr")) install.packages("readr")
library(readr)


## Read Data

raw_data <-read_csv("daie_ca3_data_5.csv") # read raw data from csv


## Clean Data

data <- raw_data %>% 
  select(...1, gender, test_group, pre_trial_cpss, post_trial_cpss, pre_trial_or, post_trial_or) %>%
  distinct() %>% # remove duplicates (none anyway)
  filter(complete.cases(.)) %>% # remove rows with incomplete data
  mutate(gender = recode(gender, "Feale" = "Female")) %>% # change type
  mutate(test_group = recode(test_group, "Anmated" = "Animated"))


## Columns To Test

data$cpss_diff <- data$pre_trial_cpss - data$post_trial_cpss
data$or_diff <- data$pre_trial_or - data$post_trial_or


## Create Groups

control_group <- filter(data, test_group == "Control")
static_group <- filter(data, test_group == "Static")
animated_group <- filter(data, test_group == "Animated")


## Mean, Median, Mode all groups

cpss_diff_mean <- mean(data$cpss_diff)
or_diff_mean <- mean(data$or_diff)

cpss_diff_median <- median(data$cpss_diff)
or_diff_median <- median(data$or_diff)


## function to get mode (tutorialspoint)

getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

cpss_diff_mode <- getmode(data$cpss_diff)
or_diff_mode <- getmode(data$or_diff)


## Mean - Each Group

control_cpss_mean <- mean(control_group$cpss_diff)
control_or_mean <- mean(control_group$or_diff)

static_cpss_mean <- mean(static_group$cpss_diff)
static_or_mean <- mean(static_group$or_diff)

animated_cpss_mean <- mean(animated_group$cpss_diff)
animated_or_mean <- mean(animated_group$or_diff)

## Median - Each Group

control_cpss_median <- median(control_group$cpss_diff)
control_or_median <- median(control_group$or_diff)

static_cpss_mean <- median(static_group$cpss_diff)
static_or_mean <- median(static_group$or_diff)

animated_cpss_median<- median(animated_group$cpss_diff)
animated_or_median <- median(animated_group$or_diff)

## Mode - Each Group (using function above) ...kind of irrelevant if no mode stuff in all groups

control_cpss_mode <- getmode(control_group$cpss_diff)
control_or_mode <- getmode(control_group$or_diff)

static_cpss_mode <- getmode(static_group$cpss_diff)
static_or_mode <- getmode(static_group$or_diff)

animated_cpss_median<- getmode(animated_group$cpss_diff)
animated_or_median <- getmode(animated_group$or_diff)


## Control Group Diff Histogram

hist(control_group$cpss_diff,
     main = "Control Group Self-Report PTSD Level (12 Week Difference) Male & Female",
     xlab = "12 Week Self-Report Measurement Difference",
     ylab = "Patient Rating Difference Frequency")
hist(control_group$or_diff,
     main = "Control Group Observer Rated PTSD Level (12 Week Difference) Male & Female",
     xlab = "12 Week Observer Rated Measurement Difference",
     ylab = "Patient Rating Difference Frequency")


## Female Control Group Members

control_female <- filter(control_group, gender == "Female")
View(control_female)

hist(control_female$cpss_diff,
     main = "Female Control Group Self-Report PTSD Level (12 Week Difference)",
     xlab = "12 Week Self-Report Measurement Difference",
     ylab = "Female Patient Rating Diff. Frequency")

hist(control_female$or_diff,
     main = "Female Control Group Observer Rated PTSD Level (12 Week Difference)",
     xlab = "12 Week Observer Rated Measurement Difference",
     ylab = "Female Patient Rating Diff. Frequency")


## Male Control Group Members

control_male <- filter(control_group, gender == "Male")
View(control_male)

hist(control_male$cpss_diff,
     main = "Male Control Group Self-Report PTSD Level (12 Week Difference)",
     xlab = "12 Week Self-Report Measurement Difference",
     ylab = "Male Patient Rating Diff. Frequency")

hist(control_male$or_diff,
     main = "Male Control Group Observer Rated PTSD Level (12 Week Difference)",
     xlab = "12 Week Observer Rated Measurement Difference",
     ylab = "Male Patient Rating Diff. Frequency")


## Static Group Diff Histogram

hist(static_group$cpss_diff,
     main = "Static Group Self-Report PTSD Level (12 Week Difference) Male & Female",
     xlab = "12 Week Self-Report Measurement Difference",
     ylab = "Patient Rating Difference Frequency")
hist(static_group$or_diff,
     main = "Static Group Observer Rated PTSD Level (12 Week Difference) Male & Female",
     xlab = "12 Week Observer Rated Measurement Difference",
     ylab = "Patient Rating Difference Frequency")


## Female Static Group Members

static_female <- filter(static_group, gender == "Female")
View(static_female)

hist(static_female$cpss_diff,
     main = "Female Static Group Self-Report PTSD Level (12 Week Difference)",
     xlab = "12 Week Self-Report Measurement Difference",
     ylab = "Female Patient Rating Diff. Frequency")

hist(control_female$or_diff,
     main = "Female Static Group Observer Rated PTSD Level (12 Week Difference)",
     xlab = "12 Week Observer Rated Measurement Difference",
     ylab = "Female Patient Rating Diff. Frequency")


## Male Static Group Members

static_male <- filter(static_group, gender == "Male")
View(static_male)

hist(static_male$cpss_diff,
     main = "Male Static Group Self-Report PTSD Level (12 Week Difference)",
     xlab = "12 Week Self-Report Measurement Difference",
     ylab = "Male Patient Rating Diff. Frequency")

hist(static_male$or_diff,
     main = "Male Static Group Observer Rated PTSD Level (12 Week Difference)",
     xlab = "12 Week Observer Rated Measurement Difference",
     ylab = "Male Patient Rating Diff. Frequency")


## Animated Group Diff Histogram

hist(animated_group$cpss_diff,
     main = "Animated Group Self-Report PTSD Level (12 Week Difference) Male & Female",
     xlab = "12 Week Self-Report Measurement Difference",
     ylab = "Patient Rating Difference Frequency")
hist(animated_group$or_diff,
     main = "Animated Group Observer Rated PTSD Level (12 Week Difference) Male & Female",
     xlab = "12 Week Observer Rated Measurement Difference",
     ylab = "Patient Rating Difference Frequency")


## Female Animated Group Members

animated_female <- filter(animated_group, gender == "Female")
View(animated_female)

hist(animated_female$cpss_diff,
     main = "Female Animated Group Self-Report PTSD Level (12 Week Difference)",
     xlab = "12 Week Self-Report Measurement Difference",
     ylab = "Female Patient Rating Diff. Frequency")

hist(animated_female$or_diff,
     main = "Female Animated Group Observer Rated PTSD Level (12 Week Difference)",
     xlab = "12 Week Observer Rated Measurement Difference",
     ylab = "Female Patient Rating Diff. Frequency")


## Male Animated Group Members

animated_male <- filter(animated_group, gender == "Male")
View(animated_male)

hist(animated_male$cpss_diff,
     main = "Male Animated Group Self-Report PTSD Level (12 Week Difference)",
     xlab = "12 Week Self-Report Measurement Difference",
     ylab = "Male Patient Rating Diff. Frequency")

hist(animated_male$or_diff,
     main = "Male Animated Group Observer Rated PTSD Level (12 Week Difference)",
     xlab = "12 Week Observer Rated Measurement Difference",
     ylab = "Male Patient Rating Diff. Frequency")
