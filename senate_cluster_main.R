# Fits a mixture model of K Markov chains using EM algorithm
# The formulas for the maximization step were derived 
# analytically in "Model-based biclustering of clickstream data" by Volodymyr Melnykov
# Application on the U.S. Senate Data set
# Clusters the U.S. States based on a fitted mixture model
# The best mixture model is chosen based on BIC (min)

rm(list=ls())

##### Functions ########################
source("EM_MC.R")

########################  SENATE DATA  #################################################
########################################################################################
# choose the order of MC chains in the mixed model and their number
ord <- 3
K <- 2
S <- 100  # the number of random initializations 
tol=1e-8  # tol for the EM procedure
########################################################################################
# 
switch(ord,
       {
         # first order dataset
         load("./Data/senate_data_processed_1st_order.RData")
         data.proc <- data_proc.ord_1
         J <- 2  # number of MC states: D, R
       },
       {
         # second order dataset
         load("./Data/senate_data_processed_2nd_order.RData")
         data.proc <- data_proc.ord_2
         J <- 4  # number of MC states: DD, DR, RD, RR
       },
       {
         # third order dataset
         load("./Data/senate_data_processed_3rd_order.RData")
         data.proc <- data_proc.ord_3
         J <- 8  # number of MC states: DDD, DDR, DRD, DRR, RDD, RDR, RRD, RRR
       }
)

X <- data.proc[[1]]
n <- length(X)
states <- data.proc[[2]]  # names of US states

results <- vector(mode = "list", length = S)

if (K != 1) {S.loop <- S} else {S.loop <- 1}  # if K = 1, we do not need to do random initializations or EM iterative algorithm
for (s in 1:S.loop) {
  
  ############# PARAMETERS ##################
  # Random Initial Conditions (Works for ALL orders)
  random_init.output <- random_init(K, J)
  Gamma <- random_init.output[[1]]
  alpha <- random_init.output[[2]]
  tau <- random_init.output[[3]]
  param.init <- list(tau, Gamma, alpha)
  
  ##### Global Variables
  y.levels <<- CombSet(1:J, m = 2,repl = TRUE, ord = TRUE)  # y.levels are different combinations of the MC states for finding trans. prob.
  y.levels <<- paste(y.levels[,1], y.levels[,2], sep = "")
  y.levels <<- as.array(as.numeric(y.levels))
  
  EM.output <- EM_MC(X, param.init, tol , iter.max = 500, EM.CEM = 0, EM.CEM.stoch = 0, ID.plot = NaN, ID.true = NaN)
  model.output <- EM.output[[1]]
  fit_indicator <- EM.output[[2]]  # for simulated datasets
  
  results[[s]] <- model.output
}

# pick the best model among different initialization (with min BIC)
models.BICs <- unlist(lapply(results, "[[", 4))
model.best.ind <- which(models.BICs == min(models.BICs, na.rm = TRUE))
print(sprintf('coefficient of variation of BICs for different initializations = %f',sd(models.BICs, na.rm = TRUE) / mean(models.BICs, na.rm = TRUE)))

model.best <- results[[model.best.ind[1]]]

#FIGURE OF THE MAP OF THE U.S
library(usmap)
library(ggplot2)

modelID <- model.best[[6]]
data.clustered <- data.frame(state = data.proc[[2]], modelID = modelID)

#reorder
data.clust.reodr <- data.clustered
# data.clust.reodr[data.clustered==1] <- 4
# data.clust.reodr[data.clustered==4] <- 1
# data.clust.reodr[data.clustered==2] <- 3
# data.clust.reodr[data.clustered==3] <- 2

## auto map
plot_usmap(data = data.clust.reodr, values = "modelID", color = "black", labels=T) +
  scale_fill_continuous(
    low = "blue", high = "red", name = "Senate Election Clusters", label = scales::comma
  ) + theme(legend.position = "off")

## manual US map, change: scale_fill_manual(values = c(`1` = "blue", `2` = "red")
# data.clustered <- mutate(data.clustered, modelID = factor(modelID))
# plot_usmap(data = data.clustered, values = "modelID", color = "black", labels=T) +
#   theme(panel.background = element_rect(colour = "white")) +
#   scale_fill_manual(values = c(`2` = "blue", `3` = "grey", `1` = "violet", '4' = 'purple', '5'='red'), name = "modelID") +
#   theme(legend.position = "off")
