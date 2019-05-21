

# instal packages for first time use
install.packages("readr")
install.packages("dplyr")

# libraries needs to be loaded everytime Rstudio is open and you plan to use the package
# needed to read .csv
library(readr)
#needed to manipulate data 
library(dplyr)

# where is my wd
getwd()
# set wd to where file is stored 
setwd(file.choose())

# import .csv by naming the file (nust be in WD)
I00000001 <- read_csv("I00000001.csv")

# choose the CSV file you wish to import
?read.csv
sales_sim <- read.csv(file.choose()) 



# view dataframes
View(I00000001) 
View(sales_sim)

# structure
str(sales_sim)

# dimensions
dim(sales_sim)

# summary
summary(sales_sim)

# first(head) or last(tail) 6 rows displayed
head(sales_sim)
tail(sales_sim)

# glm() model w/ no intercepts
?glm
multi.model<- glm(sales ~ income + gender + marital + 0, data = sales_sim)

print(multi.model)
summary(multi.model)
str(multi.model)


#Write model output to file
writeOutput.F("Multiple Linear Regression Example", multi.model)



