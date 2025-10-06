Business Objective

The objective of pursuing this analysis was to find the differences between casual riders of Cyclistic and the annual paying members, and subsequently use these findings to find out the reasons for casual riders converting into members. These findings would be used to target digital media marketing campaign to increase the number of annual paying members of Cyclistic.


How Data was Processed and Analyzed

I took the ridership data from divvy for the 2019 1st Quarter and 2020 1st quarter. I then processed this data in excel and R to update the time data (DD-MM-YYYY : HH:MM:SS) to convert it to seconds and minutes for future calculation inorder to change it to numeric data type.  I finally added a column showing the trip duration in minutes (assuming that the trip is under an hour, due to the nature of the data, I cannot determine if it is over an hour).

Results of Analysis

I used R to perform analysis as it is an opensource tool that is very effective at handling large data like this project (which ended up at close to 800K rows of data).
It is also easy to track the analysis and repeat steps with variations if required at any time as the steps are all saved as a source file.
All analysis was done using the tidyverse library in R (specifically ggplot2 and dplyr for the majority).
An overall analysis of the rider types who use Cyclistic shows that the majority are already annual subscribers. 
Based on the data, casual riders have an average trip duration of 5,761 seconds (01:36:01), while members have an average duration of 761 seconds (00:12:41), indicating that casual riders spend considerably more time per trip.

member_casual mean_duration mean_duration_hms
  <chr>                 <dbl> <chr>            
1 casual                5761. 01:36:01         
2 member                 761. 00:12:41 

The graph depicting overall ride durations indicates that casual riders generally spend more time on their trips than members.



Conclusion
The analysis reveals that casual riders consistently spend more time on their trips compared to members. This pattern, clearly illustrated in the average ride duration data and supporting visualizations, suggests that casual users may use the service more for leisure or longer recreational rides, while members likely use it for shorter, more routine commutes. Additionally, the data shows that there are more members than casual riders, indicating a strong preference for membership among users. Given the benefits and cost-efficiency that often come with membership plans, casual riders may find it advantageous to become members, especially if they ride frequently.
