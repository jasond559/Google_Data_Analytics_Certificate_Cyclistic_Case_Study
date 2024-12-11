-- SQL exploration of the combined table

-- Checking count of ride_id to ensure there are no duplicate values. This should have all distinct values:

SELECT COUNT(DISTINCT ride_ID) - COUNT(*)
FROM rare-responder-434108-i0.cyclistic_dataset.cyclistic_table

no duplicates


-- Checking categorical string columns for spelling errors or null values:

SELECT DISTINCT rideable_type
FROM rare-responder-434108-i0.cyclistic_dataset.cyclistic_table

SELECT DISTINCT member_casual
FROM rare-responder-434108-i0.cyclistic_dataset.cyclistic_table
 
no spelling errors in either rideable_type or member_casual

SELECT COUNT(*)
FROM rare-responder-434108-i0.cyclistic_dataset.cyclistic_table
WHERE rideable_type IS NULL

SELECT COUNT(*)
FROM rare-responder-434108-i0.cyclistic_dataset.cyclistic_table
WHERE member_casual IS NULL

no null values in either category column

-- Checking null values in station names as there appears to be several at first glance:

SELECT COUNT(*)
FROM rare-responder-434108-i0.cyclistic_dataset.cyclistic_table
WHERE start_station_name IS NULL

1080447 null values for start_station_name

SELECT COUNT(*)
FROM rare-responder-434108-i0.cyclistic_dataset.cyclistic_table
WHERE end_station_name IS NULL

1111721 null values for end_station_name

-- I will be excluding the station names and IDs from the cleaned table as they do not provide a benefit to the analysis


-- Exploring trip durations:

SELECT 
  ROUND(AVG(DATETIME_DIFF(ended_at, started_at, MINUTE)), 2) AS avg_trip,
  MIN(DATETIME_DIFF(ended_at, started_at, MINUTE)) AS min_trip,
  MAX(DATETIME_DIFF(ended_at, started_at, MINUTE)) AS max_trip
FROM rare-responder-434108-i0.cyclistic_dataset.cyclistic_table

AVG = 16.81 minutes
MINIMUM = -2748 minutes
MAXIMUM = 1559 minutes

I will be including only the trips that are greater than 0 minutes and less than 1440 minutes due to an apparent error in recording the start and end times. Negative trips imply the start and end times were swapped, while those longer than 24 hours could be due to a recording error. 
