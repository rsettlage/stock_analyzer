# stock_analyzer

This app will eventually pull data of interest from Yahoo Finance, analyze the tickers and assist in prediction of movement.

This is meant for me to test out automation and create some visuals for use in informing my trading.

## Order of operations:

1. Github actions:
   + sets up a Ubuntu runner :heavy_check_mark:
   + clones this repo to the runner :heavy_check_mark:
   + pulls a Alpine Linux container (See Dockerfile) to the runner :heavy_check_mark:
   + starts CONTROL_run_analysis.sh within the container :heavy_check_mark:
2. CONTROL_run_analysis.sh controls:
   + An Rscript to get and munge data :heavy_check_mark:
   + Write data :heavy_check_mark:
   + Rmarkdown script to create some reports *TODO*
3. Github actions then add/commits/pushes updated data and reports :heavy_check_mark:

