## RNORM
# Joe O'Regan
# 23/12/2022

# Normal distribution: mean, median, and mode are the same point/number
# Normal distribution: Unimodal and symmetric, bell shaped curve
#                      many vary variables are nearly normal, but none are exactly normal
# rnorm: uses random values, given the median, and standard deviation

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


# All Data
mean_cpss_diff <- mean(data$cpss_diff)
sd_cpss_diff <- sd(data$cpss_diff)
hist(data$cpss_diff)

mean_or_diff <- mean(data$or_diff)
sd_of_diff <- sd(data$or_diff)
hist(data$or_diff)


## Control
control_group <- filter(data, test_group == "Control")

# CPSS
mean_control_cpss <- mean(control_group$cpss_diff)
sd_control_cpss <- sd(control_group$cpss_diff)
hist(control_group$cpss_diff) # right
hist(rnorm(control_group, mean_control_cpss, sd_control_cpss))

# OR 
mean_control_or <- mean(control_group$or_diff)
sd_control_or<- sd(control_group$or_diff)
hist(control_group$or_diff) # symmetric? / right?
hist(rnorm(control_group, mean_control_or, sd_control_or))


## Static
static_group <- filter(data, test_group == "Static"
                       
# CPSS
mean_static_cpss <- mean(static_group$cpss_diff)
sd_static_cpss <- sd(static_group$cpss_diff)
hist(static_group$cpss_diff) # left skewed (outliers on right)
hist(rnorm(static_group, mean_static_cpss, sd_static_cpss))

# OR 
mean_static_or <- mean(static_group$or_diff)
sd_static_or<- sd(static_group$or_diff)
hist(static_group$or_diff) # left skewed
hist(rnorm(static_group, mean_static_or, sd_static_or))


## Animated
animated_group <- filter(data, test_group == "Animated")

# CPSS
mean_animated_cpss <- mean(animated_group$cpss_diff)
sd_animated_cpss <- sd(animated_group$cpss_diff)
hist(animated_group$cpss_diff) # left skewed
hist(rnorm(animated_group, mean_animated_cpss, sd_animated_cpss))

# OR 
mean_animated_or <- mean(animated_group$or_diff)
sd_animated_or<- sd(animated_group$or_diff)
hist(animated_group$or_diff) # left skewed
hist(rnorm(animated_group, mean_animated_or, sd_animated_or)) # normal distibution (random values generated)
