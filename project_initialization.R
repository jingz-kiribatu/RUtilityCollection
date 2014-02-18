# This script initializes a project space by creating folders for different purposes.
# 1. src: source code files
# 2. config: configuration files.
# 3. logs: the log files.
# 4. tests: the test scripts
# 2. data: data files; with three sub-folders (raw_data, processed_data and markdowns).
# 3. figures: with two sub_folders (exploratory_figures and final_figures). 
# 4. text: text of analysis.

# creating the data folder as well as its sub folders
cat("Initializing the project...", "\n")
warning.message <- function(){readline("The script will REMOVE ALL OBJECTS in the global environment. Would you like to proceed (in case you call the script accidentally)? 1=Yes, 3=No: ")}
while(T){
  option <- as.integer(warning.message())
  if((option %in% c(1,3)) == T){
    break
  }
  cat("Invalid input! Please try again.", "\n")
}

if(option == 1){
  
  
  
  if(file.exists("data") == F){
    cat("Creating the data folder as well as its sub folders...", "\n")
    dir.create("data")
    dir.create("data/raw_data", recursive=T)
    dir.create("data/processed_data", recursive=T)
  }
  
  # creating the "figures" folder as well as its sub folders
  if(file.exists("figures") == F){
    cat("Creating the figure folder as well as its sub folders...", "\n")
    dir.create("figures")
    dir.create("figures/exploratory_figures", recursive=T)
    dir.create("figures/final_figures", recursive=T)
  }
  
  # creating the text folder as well as its sub folders
  if(file.exists("text") == F){
    cat("Creating the text folder...", "\n")
    dir.create("text")
  }
  
  # creating the config folder as well as its sub folders
  if(file.exists("config") == F){
    cat("Creating the config folder...", "\n")
    dir.create("config")
  }
  
  # creating the logs folder as well as its sub folders
  if(file.exists("logs") == F){
    cat("Creating the logs folder...", "\n")
    dir.create("logs")
  }
  
  # creating the tests folder as well as its sub folders
  if(file.exists("tests") == F){
    cat("Creating the test folder...", "\n")
    dir.create("tests")
  }
  
  # creating the source code folder as well as its sub folders
  if(file.exists("src") == F){
    cat("Creating the source code folder...", "\n")
    dir.create("src")
  }
  
  choose.working.directory <- function(){readline("Do you want to set the working directory to the src folder? 1=Yes, 3=No: ")}
  while(T){
    option <- as.integer(choose.working.directory())
    if((option %in% c(1,3)) == T){
      break
    }
    cat("Invalid input! Please try again.", "\n")
  }
  
  if(option == 1){
    setwd("./src/")
  }
  rm(list=ls())
  cat("Project Initialization Completed!", "\n")
  cat("The current working directory is ", getwd(), "\n")
}else{
  cat("Quiting Project Initialization!", "\n")
}



