-- Creating master table for analysis queries. Adding columns for start_date, end_date, start_time, end_time, start_hour, 
-- day_of_week, start_month, trip_duration (in minutes).
-- Filtering out latitude, longitude, as well as all start and end station data as it will not be used for analysis.
-- Filtering trip_duration to only include those greater than 0 and less than 1440 minutes.

CREATE TABLE cyclistic_dataset.cyclistic_cleaned_data AS
SELECT 
  ride_id,
  rideable_type, 
  started_at, 
  ended_at, 
  EXTRACT(DATE FROM started_at) AS start_date, 
  EXTRACT(DATE FROM ended_at) AS ended_date,
  EXTRACT(TIME FROM started_at) AS start_time,
  EXTRACT(TIME FROM ended_at) AS ended_time,
  EXTRACT(HOUR FROM started_at) AS start_hour,
  CASE
    WHEN EXTRACT(DAYOFWEEK FROM started_at) = 1 THEN 'Sunday'
    WHEN EXTRACT(DAYOFWEEK FROM started_at) = 2 THEN 'Monday'
    WHEN EXTRACT(DAYOFWEEK FROM started_at) = 3 THEN 'Tuesday'
    WHEN EXTRACT(DAYOFWEEK FROM started_at) = 4 THEN 'Wednesday'
    WHEN EXTRACT(DAYOFWEEK FROM started_at) = 5 THEN 'Thursday'
    WHEN EXTRACT(DAYOFWEEK FROM started_at) = 6 THEN 'Friday'
    WHEN EXTRACT(DAYOFWEEK FROM started_at) = 7 THEN 'Saturday'
  END AS day_of_week,
  EXTRACT(MONTH FROM started_at) AS start_month,
  DATETIME_DIFF(ended_at, started_at, MINUTE) AS trip_duration,
  member_casual
  FROM rare-responder-434108-i0.cyclistic_dataset.cyclistic_table
  WHERE DATETIME_DIFF(ended_at, started_at, MINUTE) > 0
    AND DATETIME_DIFF(ended_at, started_at, MINUTE) < 1440
  ORDER BY started_at