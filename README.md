Business Objective

The objective of pursuing this analysis was to find the differences between casual riders of Cyclistic and the annual paying members, and subsequently use these findings to find out the reasons for casual riders converting into members. These findings would be used to target digital media marketing campaign to increase the number of annual paying members of Cyclistic.
<img width="4537" height="70" alt="image" src="https://github.com/user-attachments/assets/55c8054a-6139-46e2-8609-b180353217ae" />

How Data was Processed and Analyzed<img width="1712" height="175" alt="image" src="https://github.com/user-attachments/assets/46c5d98a-5888-4b7b-918e-eeaef39289ca" />
I took the ridership data from divvy for the 2019 1st Quarter and 2020 1st quarter. I then processed this data in excel and R to update the time data (DD-MM-YYYY : HH:MM:SS) to convert it to seconds and minutes for future calculation inorder to change it to numeric data type. <img width="9510" height="207" alt="image" src="https://github.com/user-attachments/assets/276ae991-cbd6-49b6-99cb-50c86b4a6386" />
 I finally added a column showing the trip duration in minutes (assuming that the trip is under an hour, due to the nature of the data, I cannot determine if it is over an hour).
<img width="3706" height="123" alt="image" src="https://github.com/user-attachments/assets/a2df1a9d-823c-47b3-b7a6-4fd682178c93" />


Results of Analysis<img width="966" height="210" alt="image" src="https://github.com/user-attachments/assets/eb946fd6-a84b-4034-b213-6997f5b6c675" />
I used R to perform analysis as it is an opensource tool that is very effective at handling large data like this project (which ended up at close to 800K rows of data).
It is also easy to track the analysis and repeat steps with variations if required at any time as the steps are all saved as a source file.
All analysis was done using the tidyverse library in R (specifically ggplot2 and dplyr for the majority).
<img width="2062" height="150" alt="image" src="https://github.com/user-attachments/assets/64bc0a65-1609-4ab8-9689-ea7c84b78e58" />
An overall analysis of the rider types who use Cyclistic shows that the majority are already annual subscribers. 
<img width="2447" height="123" alt="image" src="https://github.com/user-attachments/assets/26164582-dbbc-463d-b5fc-fa7e42eec685" />
<img width="613" height="454" alt="image" src="https://github.com/user-attachments/assets/df3144fa-f461-40d0-a944-2440969ba566" />
Based on the data, casual riders have an average trip duration of 5,761 seconds (01:36:01), while members have an average duration of 761 seconds (00:12:41), indicating that casual riders spend considerably more time per trip.
member_casual mean_duration mean_duration_hms
  <chr>                 <dbl> <chr>            
1 casual                5761. 01:36:01         
2 member                 761. 00:12:41 
The graph depicting overall ride durations indicates that casual riders generally spend more time on their trips than members.

<img width="613" height="454" alt="image" src="https://github.com/user-attachments/assets/7f96e67c-fa52-446c-9d3c-cb330df6e972" />

Conclusion
The analysis reveals that casual riders consistently spend more time on their trips compared to members. This pattern, clearly illustrated in the average ride duration data and supporting visualizations, suggests that casual users may use the service more for leisure or longer recreational rides, while members likely use it for shorter, more routine commutes. Additionally, the data shows that there are more members than casual riders, indicating a strong preference for membership among users. Given the benefits and cost-efficiency that often come with membership plans, casual riders may find it advantageous to become members, especially if they ride frequently.
