
#Source Code

#0. Enter Working Directory where folder is located on CPU
here()

#1. Loading necessary packages
source("1) Packages.R")

#2. Loading data and pre-processing data
source("2) Loading Data and Pre-Processing.R")

#3. Loading custom functions
source("3) Custom Functions.R")

#4. Creating base models of logistic regression and random forest (without missing values) and evaluating performance
source("4) Base Model Performance.R")

#5.  Running the functions used for mode imputation and random forest imputation
source("5) Simulation Function for Mode Imputation.R")
source("6) Simulation Function for RF Imputation.R")

#6. Running simulation on chosen models at different levels of missingness using mode imputation 
  #Inputs are: (number of simulations, percentage of missing values)

  #A. 5% Missing Values
  missingness_performance(1000,0.05)

  #B. 10% Missing Values
  missingness_performance(1000,0.10)

  #C. 15% Missing Values
  missingness_performance(1000,0.15)
  
  #D. 20% Missing Values
  missingness_performance(1000,0.20)
  
  #E. 25% Missing Values
  missingness_performance(1000,0.25) 
  
  #F. 30% Missing Values
  missingness_performance(1000,0.30)
  
  #G. 40% Missing Values
  missingness_performance(1000,0.40)
  
  #H. 50% Missing Values
  missingness_performance(1000,0.50)

#7. Running simulation on chosen models at different levels of missingness using random forest imputation
#Inputs are: (number of simulations, percentage of missing values)
  
  #Select Number of Cores to Use  
  doParallel::registerDoParallel(cores = 4)
  
  #A. 5% Missing Values
  missingness_performance_rf(1000,0.05)
  
  #B. 10% Missing Values
  missingness_performance_rf(1000,0.10)
  
  #C. 15% Missing Values
  missingness_performance_rf(1000,0.15)
  
  #D. 20% Missing Values
  missingness_performance_rf(1000,0.20)
  
  #E. 25% Missing Values
  missingness_performance_rf(1000,0.25) 
  
  #F. 30% Missing Values
  missingness_performance_rf(1000,0.30) 
  
  #G. 40% Missing Values
  missingness_performance_rf(1000,0.40)
  
  #F. 50% Missing Values
  missingness_performance_rf(1000,0.50) 
  
#8. Performance evaluation of simulated models   
source("7) Performance Evaluation.R")

  #Plotting Line Charts of Misclassification Rate of Mode and Random Forest Imputation
  misclassification_plot(performance_mode,"Mode")
  misclassification_plot(performance_rf,"Random Forest")
  
  #Plotting line charts (2x2) of AUC, Precision, Sensitivity, and Specificity for Both Imputations
  other_measures_plot(performance_mode,"Mode")
  other_measures_plot(performance_rf,"Random Forest")
  
  #Plotting line charts (1x2) Comparing Performance of Imputation Methods
  imputation_comparison(performance_glm,performance_randomforest, "Misclassification")
  imputation_comparison(performance_glm,performance_randomforest, "AUC")
  imputation_comparison(performance_glm,performance_randomforest, "Precision")
  imputation_comparison(performance_glm,performance_randomforest, "Sensitivity")
  imputation_comparison(performance_glm,performance_randomforest, "Specificity")

  
   #----------------------------------END OF CODE------------------------------------------------------
  