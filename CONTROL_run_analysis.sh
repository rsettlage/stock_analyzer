#!/bin/bash
##########
# bash CONTROL_run_analysis.sh `date "+%Y-%m-%d"`
##########

wdate=$1
echo working on $wdate

## assuming we are mounting in at /test
pwd
cd /test

# 1.0 get data

echo running script to get and munge data with
echo CONTROL_get_munge_data.R $wdate

Rscript CONTROL_get_munge_data.R $wdate

# 2.0 create report
