-- Total trips by member_casual --
CREATE TABLE cyclistic_dataset.total_trips AS
SELECT 
  member_casual,
  COUNT(*) AS total_trips
FROM
  rare-responder-434108-i0.cyclistic_dataset.cyclistic_cleaned_data
GROUP BY
  member_casual

-- Total trips, member_casual and rideable_type --
CREATE TABLE cyclistic_dataset.rideable_type AS
SELECT 
  member_casual,
  rideable_type,
  COUNT(*) AS total_trips
FROM
  rare-responder-434108-i0.cyclistic_dataset.cyclistic_cleaned_data
GROUP BY member_casual, rideable_type

-- Finding average ride time for each member_casual --
CREATE TABLE cyclistic_dataset.avg_trip_duration AS
SELECT 
  member_casual, 
  ROUND(AVG(trip_duration),2) AS avg_trip_duration
FROM 
  rare-responder-434108-i0.cyclistic_dataset.cyclistic_cleaned_data
GROUP BY 
  member_casual

-- Total rides by month, member_casual -- 
CREATE TABLE cyclistic_dataset.total_trips_month AS
SELECT 
  member_casual, 
  start_month, 
  COUNT(*) AS total_rides
FROM rare-responder-434108-i0.cyclistic_dataset.cyclistic_cleaned_data
GROUP BY member_casual, start_month
ORDER BY start_month

-- Average trip duration per month, member_casual --
CREATE TABLE cyclistic_dataset.avg_trip_month AS
SELECT 
  member_casual, 
  start_month,
  ROUND(AVG(trip_duration), 2) AS avg_trip_duration
FROM rare-responder-434108-i0.cyclistic_dataset.cyclistic_cleaned_data
GROUP BY member_casual, start_month
ORDER BY start_month

-- No of trips per hour of day, member_casual --
CREATE TABLE cyclistic_dataset.total_trips_hour AS
SELECT 
  member_casual,
  start_hour,
  COUNT(*) as total_trips
FROM rare-responder-434108-i0.cyclistic_dataset.cyclistic_cleaned_data
GROUP BY member_casual, start_hour
ORDER BY start_hour

-- Total rides per day of week, member_casual --
CREATE TABLE cyclistic_dataset.trips_per_day AS
SELECT
  member_casual,
  day_of_week,
  COUNT(*) as total_trips
FROM 
  rare-responder-434108-i0.cyclistic_dataset.cyclistic_cleaned_data
GROUP BY 
  member_casual, day_of_week

-- Average trip duration per day of week, member_casual --
CREATE TABLE cyclistic_dataset.avg_trip_day AS
SELECT 
  member_casual, 
  day_of_week,
  ROUND(AVG(trip_duration), 2) AS avg_trip_duration
FROM 
  rare-responder-434108-i0.cyclistic_dataset.cyclistic_cleaned_data
GROUP BY 
  member_casual, day_of_week