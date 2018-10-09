# Systems_engineering
### This repository contains academic projects completed in systems engineering masters courses

### Requirements for projects
1. 64 bit Mac, Windows, or Linux operating system
2. RStudio
3. Applied Predictive Modeling (ISBN: 

## Projects

### Data_preprocessing

#### Project Description
This project uses R and RStudio to answer data preprocessing exercise problems presented in chapter 3 of Applied Predictive Modeling. In problem 1, the `Glass` dataset from the `mlbench` package is used to explore the behavior and characteristics of the predictor variables. In problem 2, the `Soybean` dataset from the `mlbench` package is used to analyze frequency distributions of the categorical variables and to uncover potential patterns and of missing data amongst the categorical variables.

#### Problems
Problem 1

Description: The UC Irvine Machine Learning Repository contains a data set related to glass identification. THe data consist of 214 glass samples labeled as one of sevenclass categories. There are nine predictors, including the refractive index and percentages of eight elements: Na, Mg, Al, Si, K, Ca, Ba, and Fe.

The data can be accessed via:
- `library(mlbench)`
- `data(Glass)`
- `str(Glass)`

1
  - a. Using visualizations, explore the predictor variables to understand their distributions as well as the relationships -between predictors.
  - b. Do there appear to be any outliers in the data? Are any predictors skewed?
  - c. Are there any relevant transformations of one or more predictors that might improve the classification model?


Problem 2

Description: The soybean data can also be found at the UC Irvine Machine Learning Repository. Data were collected to predict disease in 683 soybeans. The 35 predictors are mostely categorical and include information on the environmental conditions (e.g., temperature, precipitation) and plant conditions (e.g., left spots, mold growth). The outcome labels consist of 19 distinct classes.

The data can be loaded via:
- `library(mlbench)`
- `data(Soybean)`

2
  - a. Investigate the frequency distributions for the categorical predictors. Are any of the distributions degerate in the ways discussed earlier in this chapter?
  - b. Roughly 18% of the data are missing. Are there particular predictors that are more likely to be missing? Is the pattern of missing data related to the classes?
