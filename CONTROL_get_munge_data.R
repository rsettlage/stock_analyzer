###########
# get and munge data
###########

# 1.0 get command line arguments and settings ----

# get date from command line
args <- commandArgs(trailingOnly = TRUE)
# Rscript CONTROL_get_munge_data.R date "+%Y-%m-%d"
date_to_get <- args[1]
cat("Current date is:", date_to_get, "\n")


# tickers we are interested in
ticker_list <- c("SPY","^SPX","^VIX","VXX","SVXY","VXZ","VIXM","^NDX","^DJI")

# 1.1 load libraries ----
library(tidyverse)
library(tidyquant)
library(timetk)

# 1.2 source functions ----

source("01_scripts_functions/CRUD_functions.R")

# 2.0 get data ----

## get new data
new_data <- get_daily_update(ticker_list,date_to_get)

## get old data
previous_data <- load_data(file_name="workingData",file_dir="00_working_data/",extension="RDS")

# 3.0 munge data ----

# add a bunch of time indicators such as:
# day of week, month, quarter, day of year, year
# and of course, there is a function for that

working_data <- new_data %>% 
  tk_augment_timeseries_signature(.date_var = date) %>%
  bind_rows(previous_data) 

working_data <- working_data %>%
  mutate(symbol_date = paste({symbol},{date},sep=".")) %>%
  filter(!duplicated(symbol_date)) %>% 
  filter(symbol != "-") %>%
  select(-symbol_date) %>%
  arrange(symbol, date)


# 4.0 save data ----

save_data(working_data, file_name = "workingData","00_working_data/")

