
Measures of central tendency

* mean

##### mean()
##### trim - drops values - 0.3, drops 3 values from each end
##### <data>.mean <- mean(<variable>, trim = 0.3)


```{r}
pre_trial_cpss_mean <- mean(raw_data$pre_trial_cpss)
pre_trial_cpss_mean

pre_trial_cpss_std <- sd(raw_data$pre_trial_cpss)
pre_trial_cpss_std
pre_trial_cpss <- rnorm(150, pre_trial_cpss_mean, pre_trial_cpss_std)
hist(pre_trial_cpss)

# clean data? 1 value missing for this variable

post_trial_cpss_mean <- mean(raw_data$post_trial_cpss)
post_trial_cpss_mean
#post_trial_cpss_std <- sd(raw_data$post_trial_cpss)
#post_trial_cpss_std
#post_trial_cpss <- rnorm(150, post_trial_cpss_mean, post_trial_cpss_std)
#hist(post_trial_cpss)

pre_trial_or_mean <- mean(raw_data$pre_trial_or)
pre_trial_or_mean
pre_trial_or_sd <- sd(raw_data$pre_trial_or)
pre_trial_or_sd
pre_trial_or <- rnorm(150, pre_trial_or_mean, pre_trial_or_sd)
hist(pre_trial_or)

post_trial_or_mean <- mean(raw_data$post_trial_or)
post_trial_or_mean
post_trial_or_sd <- sd(raw_data$post_trial_or)
post_trial_or_sd
post_trial_or <- rnorm(150, post_trial_or_mean, post_trial_or_sd)
hist(post_trial_or)


```

* median

```{r}
pre_trial_cpss_mode <- mean(raw_data$pre_trial_cpss)
pre_trial_cpss_mean
pre_trial_cpss_std <- sd(raw_data$pre_trial_cpss)
pre_trial_cpss_std
pre_trial_cpss <- rnorm(150, pre_trial_cpss_mean, pre_trial_cpss_std)
hist(pre_trial_cpss)

# clean data? 1 value missing for this variable
#post_trial_cpss_mean <- mean(raw_data$post_trial_cpss)
# na.rm - removes null values
post_trial_cpss_mean <- mean(raw_data$post_trial_cpss, na.rm = TRUE)
#post_trial_cpss_mean
#post_trial_cpss_std <- sd(raw_data$post_trial_cpss)
#post_trial_cpss_std
#post_trial_cpss <- rnorm(150, post_trial_cpss_mean, post_trial_cpss_std)
#hist(post_trial_cpss)

pre_trial_or_mean <- mean(raw_data$pre_trial_or)
pre_trial_or_mean
pre_trial_or_sd <- sd(raw_data$pre_trial_or)
pre_trial_or_sd
pre_trial_or <- rnorm(150, pre_trial_or_mean, pre_trial_or_sd)
hist(pre_trial_or)

post_trial_or_mean <- mean(raw_data$post_trial_or)
post_trial_or_mean
post_trial_or_sd <- sd(raw_data$post_trial_or)
post_trial_or_sd
post_trial_or <- rnorm(150, post_trial_or_mean, post_trial_or_sd)
hist(post_trial_or)


```

* mode

Measures of variability

* standard deviation
* variance
* minimum and maximum variables