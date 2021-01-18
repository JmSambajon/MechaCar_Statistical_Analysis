#Deliverable 1
#Loading the dplyr package
library(dplyr)

#Import and read in the MechaCar_mpg.csv file as a dataframe.
MechaCar_mpg <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)

#generate multiple linear regression model
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar_mpg)

#generate summary statistics
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar_mpg)) 


#Deliverable 2
#Import and read in the Suspension_Coil.csv file as a dataframe.
Suspension_Coil <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)

# Write an RScript that creates a total_summary dataframe using the summarize() function to get the mean, median, variance, and standard deviation of the suspension coil’s PSI column.
total_summary  <- Suspension_Coil %>% summarize(Mean_PSI=mean(PSI), Median_PSI=median(PSI), Variance_PSI=var(PSI), SD_PSI=sd(PSI))

#create summary table
lot_summary <- Suspension_Coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean_PSI=mean(PSI), Median_PSI=median(PSI), Variance_PSI=var(PSI), SD_PSI=sd(PSI), .groups = 'keep')


#Deliverable 3
#Write a t.test() function to determine if the PSI across all manufacturing lots is statistically different from the population mean of 1,500 pounds per square inch.
t.test(Suspension_Coil$PSI, mu=1500)

#write three more t.test() functions and its subset() argument to determine if the PSI for each manufacturing lot is statistically different from the population mean of 1,500 pounds per square inch.
#Lot 1
lot_1 <- Suspension_Coil %>% filter(Manufacturing_Lot=='Lot1')
t.test(lot_1$PSI, mu=1500)

#Lot 2
lot_2  <- Suspension_Coil %>% filter(Manufacturing_Lot=='Lot2')
t.test(lot_2$PSI, mu=1500)

#Lot 3
lot_3  <- Suspension_Coil %>% filter(Manufacturing_Lot=='Lot3')
t.test(lot_3$PSI, mu=1500)