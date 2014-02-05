# This script initializes a project space by creating folders for different purposes.
# 1. src: source code files; with two sub-folders (raw_scripts and final_scripts).
# 2. config: configuration files.
# 3. logs: the log files.
# 4. tests: the test scripts
# 2. data: data files; with three sub-folders (raw_data, processed_data and markdowns).
# 3. figures: with two sub_folders (exploratory_figures and final_figures). 
# 4. text: text of analysis.
#
# Users will see prompt asking for input to create certain folders.

# creating the data folder as well as its sub folders
if(file.exists("data") == F){
  print("creating the data folder as well as its sub folders...")
  dir.create("data")
  dir.create("data/raw_data", recursive=T)
  dir.create("data/processed_data", recursive=T)
}

# creating the "figures" folder as well as its sub folders
if(file.exists("figures") == F){
  print("creating the figure folder as well as its sub folders...")
  dir.create("figures")
  dir.create("figures/exploratory_figures", recursive=T)
  dir.create("figures/final_figures", recursive=T)
}

# creating the text folder as well as its sub folders
if(file.exists("text") == F){
  print("creating the text folder...")
  dir.create("text")
}

# creating the config folder as well as its sub folders
if(file.exists("config") == F){
  print("creating the config folder...")
  dir.create("config")
}

# creating the logs folder as well as its sub folders
if(file.exists("logs") == F){
  print("creating the logs folder...")
  dir.create("logs")
}

# creating the tests folder as well as its sub folders
if(file.exists("tests") == F){
  print("creating the tests folder...")
  dir.create("tests")
}
