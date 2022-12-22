# Cleaning CSV Data

# columns:
# gender, test_group, pre_trial_cpss, post_trial_cpss, pre_trial_or, post_trial_or


if(!require("readr")) install.packages("readr")
library(readr)

cat("\014") # Clear data

### READ DATA

raw_data <-read_csv("daie_ca3_data_5.csv") # read raw data from csv
# View(raw_data) # original, unchanged CSV file


### CLEAN DATA

## CHECK VARIABLE TYPES 

# spec(raw_data) # column information

## CHECK DATA FOR ERRORS


# View(unique(raw_data$gender)) # Male, Female, Feale
# View(unique(raw_data$test_group)) # static, control, animated, anmated

# names(raw_data) # column headings


# Assumption: need to remove line 73 as there is a value missing for post_trial_cpss

## show only rows with missing data (CTRL + SHIFT + M = %>%) (..1 = first column in csv)

# missing_data <- raw_data %>% 
#   select(...1, gender, test_group, pre_trial_cpss, post_trial_cpss, pre_trial_or, post_trial_or) %>% 
#   filter(!complete.cases(.))
# View(missing_data)


## replace the missing data in post_trial_cpss with 0.0 -- probably not a good idea, may affect results

# replace_na_data <- raw_data %>% 
#   select(...1, gender, test_group, pre_trial_cpss, post_trial_cpss, pre_trial_or, post_trial_or) %>% 
#   mutate(post_trial_cpss = replace_na(post_trial_cpss, 0.0))
# View(replace_na_data)


## Only rows with complete data

# complete_data <- raw_data %>%
#   select(...1, gender, test_group, pre_trial_cpss, post_trial_cpss, pre_trial_or, post_trial_or) %>%
#   filter(complete.cases(.))
# View(complete_data)

## Check duplicates

# raw_data[duplicated(raw_data), ]
# View(complete_data)

# raw_data %>% 
#   distinct() %>% # check for distinct variables


## recoding variables

# raw_data %>% 
#   select(...1, gender, test_group, pre_trial_cpss, post_trial_cpss, pre_trial_or, post_trial_or) %>%
#   mutate(gender = recode(gender, "Feale" = "Female")) %>% 
#   mutate(test_group = recode(test_group, "Anmated" = "Animated")) %>% 
#   View()


## Combine all corrections

data <- raw_data %>% 
  select(...1, gender, test_group, pre_trial_cpss, post_trial_cpss, pre_trial_or, post_trial_or) %>%
  distinct() %>% # remove duplicates
  filter(complete.cases(.)) %>% # remove rows with incomplete data
  mutate(gender = recode(gender, "Feale" = "Female")) %>% # change type
  mutate(test_group = recode(test_group, "Anmated" = "Animated")) 
# %>%  # change typo
#   View()

## check changes

# View(unique(data$test_group))
# View(unique(data$gender))




# View(raw_data)

