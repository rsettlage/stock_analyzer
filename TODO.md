### 
# TODO
### 

NOTE: as the push triggers an action and eventually a push of new files, you MUST do a pull on your local machine prior to do any push's bc the remote will have new files.  SOOOOOO...
1. git pull/add/commit/push
2. git pull
3. do work
4. git pull/add/commit/push
5. git pull

Every time you push, you will see new files on the remote until we disable that.

# Create compute environment.

1.  Create Docker image. -- DONE
2.  Verify GitHub is able to pull. -- DONE
3.  Look at compute time for potential free tier issues. -- DONE

# Data

1.  Get data. -- FIX issue with getting data. -- DONE
2.  Munge data. -- DONE
3.  Save data. -- FIX object 'init_stock_data' not found. -- DONE
4.  Save data in repo. -- NEED set read/write permissions for actions -- DONE
https://stackoverflow.com/questions/72851548/permission-denied-to-github-actionsbot

5.  Schedule data retrieval via GitHub CRON. -- DONE
6.  Create script to launch and control data operations. -- In Progress

# Analysis.

1.  Create summary of desired statistics.  
2.  Create Rmarkdown script to create summary and analytics.

