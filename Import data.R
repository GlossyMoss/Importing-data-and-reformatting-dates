library(readxl)

#The library function usually only works if you have already installed the package
#being called in the library() function

#To install a package go to Tools>Install Packages and type the name of the package to install

#You will need to set you working directory to find the files that you are calling as data
#within your script.  The address below and file names used within this file will need to be 
#changed to reflect what exists on your computer.
setwd("C:/Users/horvatw/Documents/R/OED Insights/File Imports")
#if the setwd() is not working for you then use the View tab>show files to go to the files 
#pane.  In the files pane there is a more tab with a cog icon next to it with a dropdown option to
#set your working directory.  In the files pane, you can use the file path to navigate to the folder that has your data or
# or where you would like you data to write, depending on what you are doing. Also, in the files pane there is a more tab with a cog icon next to it with a dropdown option to
#set your working directory.  

##If that doesn't work you could try 
#Tools -> Global options -> click on "Browse" to select the default working directory you want.
setwd("C:/Users/horvatw/Documents/R/OED Insights/File Imports")
#Once your directory is set, you don't need to tell R where to go to find the file


v1 <- read_excel("IIC_Completed_2018-2022.xls")
View(v1)  #This is one method to look at the file that you imported


ClaimSwaps <- read.csv(file = 'Alt IDs Claims Swaps May - Nov 22.csv')
View(ClaimSwaps)



IIC_agg <- read_excel("~R/OED Insights/File Imports/IIC_Completed_2018-2022.xlsx")
View(IIC_Completed_2018_2022)  #View() is case sensitive

View(IIC_agg)



####list of fields to format upload file#####
# Interval
# date      format = (YYYYMMDD)
# time      format = (hh:mm)
# queue_id
# queue_name
# offered_calls
# overflow_in_calls
# abandoned_calls
# overflow_out_calls
# answered_calls
# speed_of_answer_s
# time_to_abandon_s
# talk_time_s
# after_call_work_s
# longest_delay_in_queue_answered_s
# longest_delay_in_queue_abandoned_s
# avg_avail_member_cnt
# answered_calls_within_SL
# idle_dur_s
# abandoned_short_calls
# abandoned_calls_within_SL

#Creating a R Data File Using R Code
#https://gchang.people.ysu.edu/r/CreatingRDataFileUsingRCode.pdf
# https://theautomatic.net/2018/07/11/manipulate-files-r/





####This is the export file that came out of Oracle BI that has aggregate IIC influx volumes from the online claim system
    # library(readr)
    # IIC_Influx_2018_2022 <- read_csv("~/R/OED Insights/File Imports/IIC_Influx_2018_2022.csv")
    # View(IIC_Influx_2018_2022)
    # names(IIC_Influx_2018_2022)
    # #replace all spaces in column names with Underscore
    # print(gsub(" ", "_", colnames(IIC_Influx_2018_2022)))
# ^^ was using that file but it is does not contain 2018 or 2019 data ^^

# vv Now going to use this data that should does contain 2018 - 2022 data for IIC Influx VV
library(readr)
X2018_2022_IIC_Completed_by_Hour_Historical_from_Online_Claim_IC_SA_no_Auto <- read_csv("~/R/OED Insights/File Imports/2018-2022 IIC Completed by Hour Historical from Online Claim IC SA no Auto.csv")
View(X2018_2022_IIC_Completed_by_Hour_Historical_from_Online_Claim_IC_SA_no_Auto)


# [1] "All Done Code"                                      "EXTRACT( HOUR  FROM Applicant Complete Time Stamp)"
# [3] "Applicant Complete Date"                            "MAX(Applicant Complete Time Stamp)"                
# [5] "to be delelted in other sheet"                      "Day to Upload"                                     
# [7] "Time"                                               "COUNT(DISTINCT Confirmation Number)"  


###example of dataframe creation
  # # student id
  # stuid = c(2, 5, 3, 4, 6, 7, 4, 2, 0)  
  # 
  # # student age
  # age = c(23, 45, 67, 23, 41, 43, 54, 67, 89) 
  # 
  # # sex of the student
  # sex = c(1, 1, 0, 0, 0, 1, 0, 1, 1)  
  # 
  # # student info
  # stuinfo = data.frame(stuid, age, sex) 
  # 
  # stuinfo




########----Set up the columns for WFM_Format_IIC <- data.frame()
Int_15_Min <- format( 
  seq.POSIXt(
    as.POSIXct(
      Sys.Date()), as.POSIXct(Sys.Date()+1), by = "15 min"), "%H:%M", tz="GMT") 
#other useful time interval generator: seq(ISOdatetime(2001,2,3,0,0,0), ISOdatetime(2001,2,4,0,0,0), by=(60*5))

print(Int_15_Min)

#
# RName <-c('Interval',	'date_YYYYMMDD',	time_hhmm,	'queue_id',	'queue_name',	'offered_calls',	'overflow_in_calls',	
#           'abandoned_calls',	'overflow_out_calls',	'answered_calls',	'speed_of_answer_s',	'time_to_abandon_s',	'talk_time_s',	
#           'after_call_work_s',	'longest_delay_in_queue_answered_s',	'longest_delay_in_queue_abandoned_s',	'avg_avail_member_cnt',	
#           'answered_calls_within_SL',	'idle_dur_s',	'abandoned_short_calls',	'abandoned_calls_within_SL')



Sys.timezone(location = TRUE)

OlsonNames(tzdir = NULL)
tzset
######USE THIS ###########
#open library to use vec_rep() which
library(vctrs)

#get start and end date from user
  # End.Date <- readline(prompt="Enter End Date in YYYY-MM-DD format:")
  # Start.Date <- readline(prompt="Enter Start Date in YYYY-MM-DD format:")
  # timehhmm <- data.frame(vec_rep(Int_15_Min[1:96], as.integer(difftime(End.Date, Start.Date, units = "days"))))
  # View(timehhmm)

#Get date value from input file
End.Date <- max(IIC_Influx_2018_2022[[6]])
Start.Date <- min(IIC_Influx_2018_2022[[6]])

#these return vectors------
# date_YYYYMMDD <- seq(ISOdatetime(2001,2,3,0,0,0), ISOdatetime(2001,2,4,0,0,0), by=(900))
# View(date_YYYYMMDD)
# 
# Int_15_Min <- format( 
#   seq.POSIXt(as.POSIXct(Sys.Date()), 
#              as.POSIXct(Sys.Date()+
#                           as.integer(difftime(End.Date, Start.Date, units = "days"))), 
#              by = "15 min"), "%H:%M") 
# View(Int_15_Min)
#--------------------------

#example dataframe setup
  # L3 <- LETTERS[1:3]
  # fac <- sample(L3, 10, replace = TRUE)
  # (d <- data.frame(x = 1, y = 1:10, fac = fac))

New1<- data.frame(Interval=15,timehhmm = timehhmm)
View(New1)
