# Get working directory
getwd()

# Read CSV file
PurchasesHW <- read.csv('Customer Purchasing Behaviors.csv')

# Verify if the CSV read worked
head(PurchasesHW)


# 1st Query - Averages Purchases in Each Region
cat("What are the purchase averages in each region?")
tapply(PurchasesHW$purchase_amount, PurchasesHW$region, mean)
# Barplot - Average purchases in each region
colors<- c('red','blue','cyan','yellow')
Avg_PurchasesR_Plot <- tapply(PurchasesHW$purchase_amount, PurchasesHW$region, mean)
barplot(Avg_PurchasesR_Plot, xlab="Region", ylab="Average Purchase Amount (USD)", col=colors, main="Average Purchase Amount by Region", border="black")
# Boxplot - Income based on Regions
boxplot(annual_income~region,data=PurchasesHW,xlab="Region",ylab="Income (USD)",main="Income By Region",col=colors,border="black")
table(PurchasesHW$region, PurchasesHW$annual_income)

# 2nd Query - Purchase Frequency by Age - 2 plots (one will include loyalty)
cat("Which age group spends the most frequently?")
tapply(PurchasesHW$purchase_frequency, PurchasesHW$age, mean)
# Barplot - Average Purchase Frequency by Age Group
colors2<- c('red','blue','cyan','yellow')
Avg_PurchasesF_Plot <- tapply(PurchasesHW$purchase_frequency, PurchasesHW$age, mean)
barplot(Avg_PurchasesA_Plot, xlab="Age", ylab="Average Purchase Frequency (Per Year)", col=colors2, main="Average Purchase Frequency by Age", border="black")
# Barplot - Age by Region
colors<- c('red','blue','cyan','yellow')
Age_Region <- tapply(PurchasesHW$age, PurchasesHW$region, mean)
Age_Region
barplot(Age_Region, xlab="Region", ylab="Age", col = colors, main="Age by Region", border="black")

# 3rd Query - Loyalty Score by Purchase Frequency
tapply(PurchasesHW$loyalty_score, PurchasesHW$age, mean)
# Scatterplot - Loyalty by Age Group
plot(PurchasesHW$age,PurchasesHW$loyalty_score,ylab="Loyalty",xlab="Age",main="Loyalty by Age",col="gold")

# 4th Query - Loyalty score of people age 40 and over
cat("What is the loyalty score of people aged 40 and over?")
PurchasesHW[PurchasesHW$age >= 40 & PurchasesHW$loyalty_score > 8.0, ]

# 5th Query - Loyalty score frequency in all 4 regions
cat("How many people fall in each loyalty score in each region?")
table(PurchasesHW$loyalty_score, PurchasesHW$region)

# 6th Query - Purchase frequency >= 25 of people in the West region
cat("How many people have a purchase frequency of 25 or higher in the West?")
PurchasesHW[PurchasesHW$region=="West" & PurchasesHW$purchase_frequency >= 25, ]

#7th Query - Data set after removing all columns except region and income
cat("What will the dataset look like omitting all columns except income and region?")
subset(PurchasesHW, select = -c(1, 2, 4, 5, 7))

#8th Query - Number of people making $60000+ by age
cat("What number of people make +$60000 in all age groups?")
table(PurchasesHW$annual_income >= 60000, PurchasesHW$age)

#9th Query - Mean of purchase frequency by age in the West region
cat("What is the average purchase frequency by age in the West?")
tapply(PurchasesHW[PurchasesHW$region == "West", ]$age,
PurchasesHW[PurchasesHW$region == "West",]$purchase_frequency, mean)

#10th Query - Frequency of ages by region
cat("How many number of people of different ages are in each region?")
table(PurchasesHW$age, PurchasesHW$region)
