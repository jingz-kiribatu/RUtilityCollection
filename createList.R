createList <- function(){
  result <- list()
  while(T){
    # check for input
    while(T){
      option <- as.integer(askForInput())
      if((option %in% c(1,2,3)) == T){
        break
      }
      cat("Invalid input! Please try again.", "\n")
    }
    
    if (option == 1){
      name <- askForName()
      
      value <- eval(parse(text=askForValue()))
      
      result[[name]] <- value
    }
    
    if (option == 2){
      name <- askForName()
      
      value <- createList()
      
      result[[name]] <- value
    }
    
    if (option == 3){
      break
    }
  }
  return(result)
}

askForInput <- function(){readline("Is it a single parameter or a parameter group? 1=Single, 2=Group, 3=Quit: ")}

askForName <- function(){readline("Please enter the name of the paramter: ")}

askForValue <- function(){readline("Please enter the value of the parameter: ")}
