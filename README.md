# Case Study - Cyclistic Bike Share


## Introduction
This case study was completed as part of the Google Data Analytics Certificate program through Coursera. In this case study, I will be showcasing the skills I have learned through the certificate program such as SQL, Tableau, as well as the phases of the data analysis process by using publicly available data to provide insights that can help solve a business task.

## Scenario
I am a Junior Data Analyst working on the marketing analyst team at Cyclistic, a bike-share company based in Chicago. Cyclistic currently has two types of riders: casual and annual members. The director of marketing believes maximizing the number of annual memberships is key to the company's future success. As such, my team wants to better understand how the types of riders use Cyclistic bikes differently and design a marketing strategy to convert casual riders into annual members. Providing meaningful data-driven recommendations will be dependent on my use of data insights and professional data visualizations. 

## About the Company
Cyclistic launched its succesful bike-share offering in 2016, and since then has grown to a fleet of over 5800 bikes that are locked into a network of nearly 700 docking stations around the city of Chicago. 

Cyclistic's current marketing strategy relies on building general awareness and appealing to broad consumer segments through the use of flexible pricing plans: single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders, while those who purchase annual memberships are known as Cyclistic members.

The company's finance analysts have determined that annual members are much more profitable than casual riders. The director of marketing, Lily Moreno, believes that maximizing the number of annual members will be key to future growth, and rather than designing a marketing campaign targeting all new customers, she believes there is an opportunity to convert casual riders into members. 

In order to design the new marketing campaign, the team needs to better understand how annual members and casual riders differ by using historical data to identify trends. 


## Data Analysis Process
### **Ask:**
   - How do annual members and casual riders use Cyclistic bikes differently?
   - Business Task: Design marketing strategies aimed at converting casual riders into annual members by understanding how riders differ, why casual riders would buy a membership, and how digital media could affect their marketing tactics.

### **Prepare:**
#### [The Data](https://divvy-tripdata.s3.amazonaws.com/index.html)
The data used for this case study has been provided by made available by Motivate International Inc under this [license](https://divvybikes.com/data-license-agreement). 

First party data collected by Motivate International Inc., so concerns about credibility are low. 

The data is organized in .csv files by month. We are analyzing the previous 12 months as instructed, which in this case study consists of December 2023 through November 2024. Data privacy issues prohibit the data from listing any riders’ personally identifiable information (PII) so it has been removed. The data contains 13 columns for each unique observation: ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual


### **Process:**
Tools: Google BigQuery and Tableau

1. [Combining the Data](https://github.com/jasond559/Google_Data_Analytics_Certificate_Cyclistic_Case_Study/blob/main/01_SQL_combining.sql)

The original data was contained in 12 separate csv files that needed to be combined into a single table.


2. [Exploring the Data](https://github.com/jasond559/Google_Data_Analytics_Certificate_Cyclistic_Case_Study/blob/main/02_SQL_exploration.sql)

Once combined, the data was explored using several queries to determine the following:

- Are any duplicates present in the ride_id category?
- Are there any spelling errors or null values in the categorial columns (rideable_type and member_casual)?
- How many null values are present in the start and end station name columns?
- How much variance is present in the trip durations? (ended_at - started_at)
  - 96 rows showed a trip duration less than 0
  - 7,673 rows showed a trip duration greater than 1440

![Schema](https://github.com/user-attachments/assets/789623db-3be4-448d-98a8-7402cb1a81cd)



3. [Cleaning the Data](https://github.com/jasond559/Google_Data_Analytics_Certificate_Cyclistic_Case_Study/blob/main/03_SQL_cleaning.sql)

The following steps were taken to clean the combined table and create a new cleaned table to be used for analysis:

- Removed the start and end station information as it was not to be used during analysis
- Added additional columns: "start_date", "end_date", "start_time", "end_time", "start_hour", "day_of_week", "start_month", and "trip_duration"
- Filtered trip_duration column to only include durations greater than 0 minutes and less than 1440 minutes
- The final cleaned table now contains 5,765,436 rows of observations


### **Analyze:**

Analysis was completed using both BigQuery and Tableau. The basis for the analysis was to answer:

"How do casual riders and annual members use the Cyclistic bikes differently?"

[SQL Analysis](https://github.com/jasond559/Google_Data_Analytics_Certificate_Cyclistic_Case_Study/blob/main/04_SQL_analysis.sql)

1. **Total trips taken during the 12 month period (Member VS Casual)**

![total_trips](https://github.com/user-attachments/assets/825c1d3b-1087-446d-8198-3058e957354a)

- **Annual Members** account for more trips than **Casual Riders** during the 12 month observation period (3,672,300 vs 2,093,136)

2. **Breakdown of type of bikes used**
The following figure shows a breakdown of the bikes used for the trips:

![Rideable_type](https://github.com/user-attachments/assets/1f0a7dea-45fe-49ad-b6f8-6f20fd0675e1)

   - There does not appear to be a clear preference towards **classic bikes** or **electric bikes** by either annaul members or casual riders
   - Although there are three types of bike (**electric bike, classic bike, electric scooter**), the electric scooter was not introduced until 08/31/2024, which could help explain the low usage of that option

3. **Average trip duration**

![Avg_trip_duration](https://github.com/user-attachments/assets/8d88c6cb-5768-4d98-af7b-e9ca9acda218)

   - The average trip duration for **casual riders** is 21.05 minutes, which is nearly twice as long as those of **annual members** (11.9 minutes)


4. **Monthly trip breakdown**

The following figures show a side by side comparison of both the **number of trips** and the **average trip duration** for each month:

![total_trips_month](https://github.com/user-attachments/assets/82d82a05-a8da-4755-ab05-64314c293a68)

![avg_trip_month](https://github.com/user-attachments/assets/d02de959-10e9-41a0-ab99-ef189f4f22f1)

   - **Annual members** ride Cyclistic bikes *more often*, whereas **casual riders** ride Cyclistic bikes *for longer periods* during each month of the year
   - Both types of riders use Cyclistic bikes most often during the months of **May, June, July, August, September and October**
   - The winter months of **December, January, and February** show the lowest usage of Cyclistic bikes for both types of rider


5. **Daily trip breakdown**

The following figures illustrate a side-by-side comparison of the **number of trips** and **average trip duration** for each day of the week:

![total_trips_day](https://github.com/user-attachments/assets/36473969-c9a6-42ea-968f-5b2bc39c0a9e)

![avg_trip_day](https://github.com/user-attachments/assets/980067bb-57d8-418f-93e3-411c2e248243)

   - Annual members utilize Cyclistic bikes more often **during the week** (Monday through Friday), while casual riders' usage peaks **during the weekends**
   - Here we see the same trend of annual members using Cyclistic more often, but casual riders using the bikes for longer periods on each day of the week

6. **Hourly trip breakdown**

![total_trips_hour](https://github.com/user-attachments/assets/5ebc80c1-c0dc-4c5a-8b56-812e3a8bf855)


### **Share:**



### **Act:**


