# Process US_Senate_election_data.xlsx
# Output: three .RData files consisting of 50 sequences of Markov Chain of 1st, 2nd and 3rd order

rm(list=ls())

library(readxl)

data.raw <- read_excel("US_Senate_election_data.xlsx", sheet = "Final")

rr <- dim(data.raw)[1]  # number of rows
cc <- dim(data.raw)[2]  # number of columns

stateID <- data.raw$ID  # US States

# Raw data includes values D, R, D/D (when there were two democrats elected for one term, for more info check the .xlsx file), similarly R/R, D/R, R/D
# This is how the chars will be convered to numeric values
# D -> 1
# R -> 2
# D/D -> 1,1
# R/R -> 2,2
# D/R -> 1,2
# R/D -> 2,1

# Ex: 1966: D, 1968: NA, 1970: D/R, 1972: R -> 1, 1, 2, 2 
# each state has election twice evey 3 terms (6 years), in 1970 the dem senator left the office and a rep was elected to finish the term

##############################################################################################
# 1st-order Markov Chain Dataset
data.list <- vector(mode = "list", length=rr)
for(i in 1:rr){
  data.row <- data.raw[i,]
  tmp <- c()
  for(j in 2:cc){
    elem.raw <- data.row[j]
    elem.proc <- switch(as.character(elem.raw),
           "D" = 1,
           "R" = 2,
           "D/D" = c(1,1),
           "R/R" = c(2,2),
           "D/R" = c(1,2),
           "R/D" = c(2,1)
           )
    tmp <- append(tmp,elem.proc)
  }
  data.list[[i]] <- tmp
}

data_proc.ord_1 <- list(data.list,stateID)
save(data_proc.ord_1, file="senate_data_processed_1st_order.RData")


##############################################################################################
# 2nd-order MC dataset
# input is the 1st-order MC dataset
# the state one step ahead does not depend only on the current state but also on a previous state
# (one step back memory)
# 4 states instead of 2 states: DD, DR, RD, RR represented by 1, 2, 3, 4
data.list2 <- vector(mode = "list", length=rr)
for(i in 1:rr){
  
  data.row <- data.list[[i]]
  tmp <- c()
  cc <- length(data.row)
  for(j in 2:cc){
    data.window <- paste(data.row[j-1],data.row[j], sep = "")
    elem.proc <- switch(data.window,
                        "11" = 1,  # DD
                        "12" = 2,  # DR
                        "21" = 3,  # RD
                        "22" = 4,  # RR
    )
    tmp <- append(tmp,elem.proc)
  }
  data.list2[[i]] <- tmp
}

data_proc.ord_2 <- list(data.list2,stateID)
save(data_proc.ord_2, file="senate_data_processed_2nd_order.RData")

##############################################################################################
# 3rd order MC dataset
data.list3 <- vector(mode = "list", length=rr)
for(i in 1:rr){
  
  data.row <- data.list[[i]]
  tmp <- c()
  cc <- length(data.row)
  for(j in 3:cc){
    data.window <- paste(data.row[j-2],data.row[j-1],data.row[j], sep = "")
    elem.proc <- switch(data.window,
                        "111" = 1,  # DDD
                        "112" = 2,  # DDR
                        "121" = 3,  # DRD
                        "122" = 4,  # DRR
                        "211" = 5,  # RDD
                        "212" = 6,  # RDR
                        "221" = 7,  # RRD
                        "222" = 8,  # RRR
    )
    tmp <- append(tmp,elem.proc)
  }
  data.list3[[i]] <- tmp
}

data_proc.ord_3 <- list(data.list3,stateID)
save(data_proc.ord_3, file="senate_data_processed_3rd_order.RData")

