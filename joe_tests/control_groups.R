## Control Groups

if(!require("readr")) install.packages("readr")
library(readr)


## Read Data

raw_data <-read_csv("../daie_ca3_data_5.csv") # read raw data from csv


## Clean Data

data <- raw_data %>% 
  select(...1, gender, test_group, pre_trial_cpss, post_trial_cpss, pre_trial_or, post_trial_or) %>%
  distinct() %>% # remove duplicates (none anyway)
  filter(complete.cases(.)) %>% # remove rows with incomplete data
  mutate(gender = recode(gender, "Feale" = "Female")) %>% # change type
  mutate(test_group = recode(test_group, "Anmated" = "Animated")) 
  # %>% View()


## Columns To Test

data$cpss_diff <- data$pre_trial_cpss - data$post_trial_cpss
data$or_diff <- data$pre_trial_or - data$post_trial_or
# View(data)


## Create Groups

control_group <- filter(data, test_group == "Control")
# View(control_group)
static_group <- filter(data, test_group == "Static")
# View(static_group)
animated_group <- filter(data, test_group == "Animated")
# View(animated_group)


## Mean, Median, Mode all groups

cpss_diff_mean <- mean(data$cpss_diff)
cpss_diff_mean
or_diff_mean <- mean(data$or_diff)
or_diff_mean


cpss_diff_median <- median(data$cpss_diff)
cpss_diff_median
or_diff_median <- median(data$or_diff)
or_diff_median


## function to get mode (tutorialspoint)

getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

cpss_diff_mode <- getmode(data$cpss_diff)
cpss_diff_mode
or_diff_mode <- getmode(data$or_diff)
or_diff_mode


## Mean - Each Group

control_cpss_mean <- mean(control_group$cpss_diff)
control_cpss_mean
control_or_mean <- mean(control_group$or_diff)
control_or_mean

static_cpss_mean <- mean(static_group$cpss_diff)
static_cpss_mean
static_or_mean <- mean(static_group$or_diff)
static_or_mean

animated_cpss_mean <- mean(animated_group$cpss_diff)
animated_cpss_mean
animated_or_mean <- mean(animated_group$or_diff)
animated_or_mean

## Median - Each Group

control_cpss_median <- median(control_group$cpss_diff)
control_cpss_median
control_or_median <- median(control_group$or_diff)
control_or_median

static_cpss_mean <- median(static_group$cpss_diff)
static_cpss_mean
static_or_mean <- median(static_group$or_diff)
static_or_mean

animated_cpss_median<- median(animated_group$cpss_diff)
animated_cpss_median
animated_or_median <- median(animated_group$or_diff)
animated_or_median

## Mode - Each Group (using function above) ...kind of irrelevant if no mode stuff in all groups

control_cpss_mode <- getmode(control_group$cpss_diff)
control_cpss_mode
control_or_mode <- getmode(control_group$or_diff)
control_or_mode

static_cpss_mode <- getmode(static_group$cpss_diff)
static_cpss_mode
static_or_mode <- getmode(static_group$or_diff)
static_or_mode

animated_cpss_median<- getmode(animated_group$cpss_diff)
animated_cpss_median
animated_or_median <- getmode(animated_group$or_diff)
animated_or_median