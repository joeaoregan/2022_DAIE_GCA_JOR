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


## Box Plots


boxplot(control_group$cpss_diff)
boxplot(control_group$or_diff)

boxplot(static_group$cpss_diff)
boxplot(static_group$or_diff)

boxplot(animated_group$cpss_diff)
boxplot(animated_group$or_diff)


control_male <- filter(control_group, gender == "Male")
control_female <- filter(control_group, gender == "Female")

static_male <- filter(static_group, gender == "Male")
static_female <- filter(static_group, gender == "Female")

animated_male <- filter(animated_group, gender == "Male")
animated_female <- filter(animated_group, gender == "Female")


boxplot(control_male$cpss_diff)
boxplot(control_female$cpss_diff)
boxplot(control_male$or_diff)
boxplot(control_female$or_diff)

boxplot(static_male$cpss_diff)
boxplot(static_female$cpss_diff)
boxplot(static_male$or_diff)
boxplot(static_female$or_diff)

boxplot(animated_male$cpss_diff)
boxplot(animated_female$cpss_diff)
boxplot(animated_male$or_diff)
boxplot(animated_female$or_diff)


## Scatterplot

plot(x = control_group$cpss_diff, y = control_group$or_diff)
plot(x = control_male$cpss_diff, y = control_male$or_diff)
plot(x = control_female$cpss_diff, y = control_female$or_diff)

plot(x = static_group$cpss_diff, y = static_group$or_diff)
plot(x = static_male$cpss_diff, y = static_male$or_diff)
plot(x = static_female$cpss_diff, y = static_female$or_diff)

plot(x = animated_group$cpss_diff, y = animated_group$or_diff)
plot(x = animated_male$cpss_diff, y = animated_male$or_diff)
plot(x = animated_female$cpss_diff, y = animated_female$or_diff)
