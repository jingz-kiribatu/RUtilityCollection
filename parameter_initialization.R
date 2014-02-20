require(RJSONIO)

paramInitialization <- function(){
  cat("Current working directory is ", getwd(), "\n")
  fileName <- askForConfigFileName("Outer", 0)
  
  fileLocation <- askForConfigFileDir("Outer", 0)
  
  cat("========================================", "\n\n")
  params <- createList()
  cat(toJSON(params, asIs=T, pretty=T), file=paste(fileLocation, fileName, sep="/"))
  return(params)
}

createList <- function(level = "Top", n=0){
  result <- list()
  if(level == "Top"){
    cat("Parameter configuration begins...", "\n")
    # data input directory
    option <- askForInputDir(level, n)
    result[["inputDir"]] <- option
    
    # data output directory
    option <- askForOutputDir(level, n)
    result[["outputDir"]] <- option
  }
  while(T){
    while(T){
      option <- as.integer(askForParamType(level, n))
      if((option %in% c(1,2,3)) == T){
        break
      }
      cat(rep(" ", 4*n), level, "--", "Invalid input! Please try again.", "\n", sep="")
    }
    
    if (option == 1){
      name <- askForName(level, n)
      
      value <- eval(parse(text=askForValue(level, n)))
      if(length(value) == 1){
        # value <- list(value)
      }
      result[[name]] <- value
    }
    
    if (option == 2){
      name <- askForName(level, n)
      
      value <- createList(level = name, n+1)
      
      result[[name]] <- value
      cat(rep(" ", 4*n), level, "--Return to ", level, ".\n")
    }
    
    cat("\n")
    
    if (option == 3){
      if(level == "top"){
        cat("Parameters configuration finished...", "\n")
      }
      break
    }
  }
  return(result)
}

askForInput <- function(level, n, msg){
  indent <- paste(rep(" ", 4*n), sep="", collapse="")
  readline(paste(indent, level, msg, sep="--"))
}

askForConfigFileName <- function(level, n){
  msg <- "Please specify the config file name: "
  askForInput(level, n, msg)
}

askForConfigFileDir <- function(level, n){
  msg <- "Please specify where the config file should locate: "
  askForInput(level, n, msg)
}

askForInputDir <- function(level, n){
  msg <- "Please specify data input directory location: "
  askForInput(level, n, msg)
}

askForOutputDir <- function(level, n){
  msg <- "Please specify data output directory location: "
  askForInput(level, n, msg)
}

askForParamType <- function(level, n){
  msg <- "Please specify parameter type. 1=Single, 2=Group, 3=Quit: "
  askForInput(level, n, msg)
}

askForName <- function(level, n){
  msg <- "Please enter the name of the paramter: "
  askForInput(level, n, msg)
}

askForValue <- function(level, n){
  msg <- "Please enter the value of the parameter: "
  askForInput(level, n, msg)
}
