get_daily_update <-
      function(tickers = "SPY", update_day = "2023-10-02"){
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

save_data <-
      function(data, file_name, file_dir){
        # function to save stock data
        # returns tibble of historical stock prices
        saveRDS(init_stock_data, file=str_glue({file_dir},{file_name},".RDS"))
        write_csv(init_stock_data, file=str_glue({file_dir},{file_name},".cvs"))
      }

load_data <-
      function(file_name="initData",file_dir="00_original_data/",extension="csv"){
        # function to get saved stock data
        # returns tibble of historical stock prices
        if(extension=="csv"){
          return(read_csv(file=str_glue({file_dir},{file_name},".",{extension})))
        }else if(extension=="RDS"){
          return(readRDS(file=str_glue({file_dir},{file_name},".",{extension})))
        }
}
