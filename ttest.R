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

male <- filter(data, gender == "Male")
female <- filter(data, gender == "Female")
# View(male)


my_data <- data %>% 
  select(gender, cpss_diff) %>% 
  filter(gender %in% c("Male", "Female")) %>% 
  drop_na(cpss_diff)

# data1 <- data
# t.test(data$gender ~ data$cpss_diff, data = my_data)


# 95% confidence level is default setting
data %>% 
  select(gender, cpss_diff) %>% 
  filter(gender %in% c("Male", "Female")) %>% 
  drop_na(cpss_diff) %>% 
  t.test(cpss_diff ~ gender, data = .)

control_group %>% 
  select(gender, cpss_diff) %>% 
  filter(gender %in% c("Male", "Female")) %>% 
  drop_na(cpss_diff) %>% 
  t.test(cpss_diff ~ gender, data = .)

static_group %>% 
  select(gender, cpss_diff) %>% 
  filter(gender %in% c("Male", "Female")) %>% 
  drop_na(cpss_diff) %>% 
  t.test(cpss_diff ~ gender, data = .)

animated_group %>% 
  select(gender, cpss_diff) %>% 
  filter(gender %in% c("Male", "Female")) %>% 
  drop_na(cpss_diff) %>% 
  t.test(cpss_diff ~ gender, data = .)


data %>% 
  select(gender, or_diff) %>% 
  filter(gender %in% c("Male", "Female")) %>% 
  drop_na(or_diff) %>% 
  t.test(or_diff ~ gender, data = .)

control_group %>% 
  select(gender, or_diff) %>% 
  filter(gender %in% c("Male", "Female")) %>% 
  drop_na(or_diff) %>% 
  t.test(or_diff ~ gender, data = .)

static_group %>% 
  select(gender, or_diff) %>% 
  filter(gender %in% c("Male", "Female")) %>% 
  drop_na(or_diff) %>% 
  t.test(or_diff ~ gender, data = .)

animated_group %>% 
  select(gender, or_diff) %>% 
  filter(gender %in% c("Male", "Female")) %>% 
  drop_na(or_diff) %>% 
  t.test(or_diff ~ gender, data = .)



data %>% 
  select(gender, cpss_diff) %>% 
  filter(gender %in% c("Male", "Female")) %>% 
  drop_na(cpss_diff) %>% 
  t.test(cpss_diff ~ gender, data = .)



qqnorm(data$cpss_diff,
       pch = 1, frame = FALSE)

qqnorm(data$or_diff,
       pch = 2, frame = FALSE)

qqline(data$cpss_diff)
qqline(data$or_diff)


shapiro.test(data$cpss_diff)
shapiro.test(data$or_diff)
