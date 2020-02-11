#Satellite Resolution Analysis Paper
To recreate the analysis the following files are run in sequence.
1. In the data processing folder run the MaxNDVIRFunction.R script for each crop type. 
2. Run the Additional_Data_Cleaning.R script to filter the counties that have over 1000 acres of crop grown each year and 13 years of data. We ensure that the counties match for each satellite resolution. 
3. Once the files are cleaned the regressions for each county can be run in RegressionAnalysis.R for each crop type. 
4. The regression output is then analysed and visualized using the scripts in the Tables&Graphs folder. 
