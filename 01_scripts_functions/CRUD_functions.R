get_daily_update <-
          function(tickers = "SPY", update_day = "2023-10-02"){
            # this function gets daily stock price data for a vector of tickers passed in
            # the function will return an empty tibble in the case of a date the 
            # market is closed or includes some other invalid date
            stock_metrics <- tq_get("T",from="2023-10-03",to="2023-10-04")
            stock_metrics[1,1] <- "-"
            
            stock_metrics <- bind_rows(stock_metrics,
                                      tq_get(x    = tickers,
                                             from = update_day ,
                                             to.  = ymd(update_day) + 1))
            
            stock_metrics <- stock_metrics %>%
              select(-volume) %>%
              filter(symbol != "_") %>%
              filter(complete.cases(.))
            return(stock_metrics)
}

save_data <-
          function(data, file_name, file_dir){
            # function to save stock data
            # saves as both RDS and csv
            saveRDS(data, file=str_glue({file_dir},{file_name},".RDS"))
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
