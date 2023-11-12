####
# Working file for creating CRUD operation functions
####


# 1.0 get working data ----

# get some data to use for creating figures
library(tidyverse)
library(tidyquant)

# https://business-science.github.io/tidyquant/reference/tq_get.html
# see the following helper functions
# tq_index
# tq_exchange
# tq_get
# tq_index("SP500") %>% arrange(desc(weight))

tq_get("SPY",from="2023-10-01")
tq_get("^VIX",from="2023-10-01")

# only getting data through Oct 1 to use daily refreshes to get rest of data
# not sure why some of the volume data is missing, 
# but we are not interested in that, so eh
init_stock_data <- tq_get(c("SPY","^VIX","^NDX","^DJI"),
                          from="2023-01-01",
                          to="2023-10-01")

# 1.2 create function for daily updates

ticker_list <- c("SPY","^VIX","^NDX","^DJI")
update_day <- "2023-10-05"

get_daily_update <- function(tickers = "SPY", update_day = "2023-10-02"){
  # this function gets daily stock price data for a vector of tickers passed in
  # the function will return an empty tibble in the case of a date the 
  # market is closed or includes some other invalid date
  
  # get some data from a random ticker and just zero out the ticker
  stock_metrics <- tq_get("T",from="2023-10-03",to="2023-10-04")
  stock_metrics[1,1] <- "-"
  
  # getting a week to make sure the function doesnt fail, filter after
  # evidently to is non-inclusive, so adding a day
  stock_metrics <- bind_rows(stock_metrics,
                             tq_get(x    = tickers,
                                    from = ymd(update_day)-5,
                                    to   = ymd(update_day)+1))
  stock_metrics <- stock_metrics %>%
    select(-volume) %>%
    filter(symbol != "-") %>%
    filter(complete.cases(.)) %>%
    filter(date == update_day)
  return(stock_metrics)
}

get_daily_update(tickers = ticker_list, update_day = update_day)


# 2.0 save data ----

saveRDS(init_stock_data, file="00_original_data/initData.RDS")
write_csv(init_stock_data, file="00_original_data/initData.csv")

save_data <- function(data, file_name, file_dir){
  # function to save stock data
  # returns tibble of historical stock prices
  saveRDS(data, file=str_glue({file_dir},{file_name},".RDS"))
  write_csv(data, file=str_glue({file_dir},{file_name},".cvs"))
}

save_data(init_stock_data,"workingData","00_working_data/")

# 3.0 load data ----

load_data <- function(file_name="initData",file_dir="00_original_data/",extension="csv"){
  # function to get saved stock data
  # returns tibble of historical stock prices
  if(extension=="csv"){
    return(read_csv(file=str_glue({file_dir},{file_name},".",{extension})))
  }else if(extension=="RDS"){
    return(readRDS(file=str_glue({file_dir},{file_name},".",{extension})))
  }
}


dump(c("get_daily_update","save_data","load_data"),file="01_scripts_functions/CRUD_functions.R")

