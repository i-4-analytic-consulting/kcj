

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
?row.names
M <- read.csv(file.choose()) 
sales_sim <- read_csv('Sales_Sim.csv', row.names = NULL)



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

# manipulate data types
sales_sim1 <- sales_sim %>%
  # mutate_at('gender', factor)%>%
  # mutate_at('marital', factor)%>%
  names(sales_sim) <- c('custID', 'income', 'gender', 'marital', 'offers', 'sales', 'vp')

# build linear regression model on full data
# linearMod <- lm(dist ~ speed, data=cars) 
# print(linearMod)
?glm
reg_model <- glm(sales ~ income, data = sales_sim)
print(reg_model)

# multi.fit = lm(Sales~Spend+Month, data=dataset)
# summary(multi.fit)
multi.model<- lm(sales ~ income + gender + marital + 0, data = M)
summary(multi.model)
str(multi.model)

# export to .csv file 
write.csv(multi.model,"sales_sim.csv")

#Write model output to file
writeOutput.F("Multiple Linear Regression Example", multi.model)



