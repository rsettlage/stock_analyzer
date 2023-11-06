#####
# Guide for Git Actions
#####


OK, so GitHub help is overall awesome, so this is a pretty short writeup with mostly some pointing out of documentation or writeups.

First, we can automate this using several systems:  

1. GitHub. 
2. Fly.io. 
3. Your local computer.  
4. ARC -- Advanced Research Computing. 

We are going to use GitHub and maybe Fly.io.

So GitHub.  Our ultimate goal is completely automated and scheduled.  First, we will go through the documentation to get to automated using actions, then move to scheduled.

## Using Git Actions

https://docs.github.com/en/actions/quickstart. 

Pretty soup to nuts and easy to read.  Basically, we are creating a workflow (series of Git Actions) that is run (executed as a job on a runner) when an event is triggered.  In the case above, it is a push to our repo.

For more info:

https://docs.github.com/en/actions/learn-github-actions/understanding-github-actions

In the quick start, we created a directory in our repo (./github/workflows) and put a config file in there (github-actions-demo.yml).  The config file spells out all the steps (Git Actions - run commands) in the workflow.  It also spells out what type of OS (server?) to use, in this case it was ubuntu-latest.

## Git actions CRON

Adding to the coolness of being able to automate some stuff based on a trigger event, we can actually SCHEDULE jobs to run.  Again, free, very high in the coolness factor imo.

The GitHub docs are of course amazing and describe this here:  

<https://docs.github.com/en/actions/using-workflows/events-that-trigger-workflows#schedule>

Also, very nice post on this here with additional ideas for things you can do:  

<https://jasonet.co/posts/scheduled-actions/>

I agree with Jason, super cool, super useful feature.
