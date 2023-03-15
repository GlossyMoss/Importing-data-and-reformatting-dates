# To connect to data and here is some example ways to connect. You can copy this 
# code into a script you open in R studio by going to File> New File>R script and 
# pasting into the R window that has the Run button at the top.


#You will need to set your working directory to find the files that you are calling as data
#within your script.  The path here going to the W drive Wendy folder should work for our team.

  setwd("W:/Wendy/R Folder")
  
#--------------VV optional VV
#if the setwd() is not working for you then use the View tab>show files to go to the files 
#pane.  This may not work for shared drives.
  
# In the files pane there is a more tab with a cog icon next to it with a dropdown option to
#set your working directory.  

# In the files pane, you can use the file path to 
#navigate to the folder that has your data or
#or where you would like you data to write, depending on what you are doing. 

# Also, in the files pane there is a more tab with a cog icon next to it with a dropdown option to
#set your working directory.  
#-------------- ^^ optional ^^

# a library that has functions to read files in is "readr"
  library(readr)
# This is an example of a file we should all have access to
  IIC_18_22 <- read_csv("2018-2022 IIC Completed by Hour Historical from Online Claim IC SA no Auto.csv")
# to view the file make sure the View function is capitalized
  View(IIC_18_22)

#--------------
##Another method for connecting to a path location is to use the menu at the top 
#Tools -> Global options -> click on "Browse" to select the default working directory you want.
#--------------  

  
#Here is an example of how I would connect to a file on my C drive
#NOTE: if you copy and paste a filepath into R, you have to switch the direction of the slashes
  setwd("C:/Users/horvatw/Documents/R/OED Insights/File Imports")
#Once your directory is set, you don't need to tell R where to go to find the file


  library(readxl)

#The library function usually only works if you have already installed the package
#being called in the library() function

#To install a package go to Tools>Install Packages and type the name of the package to install

  v1 <- read_excel("An_xls_file_that_you have.xls")
  View(v1)  #This is one method to look at the file that you imported
  
  
  example_file <- read.csv(file = 'A_csv_file_that_you have.csv')
  View(example_file)





