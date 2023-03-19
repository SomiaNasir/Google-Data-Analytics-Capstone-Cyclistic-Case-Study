-- checking the data types of all columns

SELECT column_name, data_type
FROM `2022_tripdata`.INFORMATION_SCHEMA.COLUMNS
WHERE table_name = '202201_tripdata';

-- checking for number of null values in all columns

SELECT COUNT(*) - COUNT(ride_id) ride_id,
 COUNT(*) - COUNT(rideable_type) rideable_type,
 COUNT(*) - COUNT(started_at) started_at,
 COUNT(*) - COUNT(ended_at) ended_at,
 COUNT(*) - COUNT(start_station_name) start_station_name,
 COUNT(*) - COUNT(start_station_id) start_station_id,
 COUNT(*) - COUNT(end_station_name) end_station_name,
 COUNT(*) - COUNT(end_station_id) end_station_id,
 COUNT(*) - COUNT(start_lat) start_lat,
 COUNT(*) - COUNT(start_lng) start_lng,
 COUNT(*) - COUNT(end_lat) end_lat,
 COUNT(*) - COUNT(end_lng) end_lng,
 COUNT(*) - COUNT(member_casual) member_casual
FROM `2022_tripdata.combined_data`;

-- checking for duplicate rows

SELECT COUNT(ride_id) - COUNT(DISTINCT ride_id) AS duplicate_rows
FROM `2022_tripdata.combined_data`;

-- ride_id - all have length of 16

SELECT LENGTH(ride_id) AS length_ride_id, COUNT(ride_id) AS no_of_rows
FROM `2022_tripdata.combined_data`
GROUP BY length_ride_id;

-- rideable_type - 3 unique types of bikes

SELECT DISTINCT rideable_type, COUNT(rideable_type) AS no_of_trips
FROM `2022_tripdata.combined_data`
GROUP BY rideable_type;

-- started_at, ended_at - TIMESTAMP - YYYY-MM-DD hh:mm:ss UTC

SELECT started_at, ended_at
FROM `2022_tripdata.combined_data`
LIMIT 10;

SELECT COUNT(*) AS longer_than_a_day
FROM `2022_tripdata.combined_data`
WHERE EXTRACT(MINUTE FROM (ended_at - started_at)) >= 1440;   -- longer than a day - there are none

SELECT COUNT(*) AS less_than_a_minute
FROM `2022_tripdata.combined_data`
WHERE EXTRACT(MINUTE FROM (ended_at - started_at)) <= 0;      -- less than a minute - total rows = 127793
                                                              -- minute as a whole number is returned, comparing with 0 means 0 min 59 sec
-- start_station_name, start_station_id - 

SELECT DISTINCT start_station_name
FROM `2022_tripdata.combined_data`
ORDER BY start_station_name;

SELECT rideable_type, COUNT(*)
FROM `2022_tripdata.combined_data`
WHERE start_station_id IS NULL
GROUP BY rideable_type;

SELECT COUNT(ride_id) AS rows_with_start_station_null
FROM `2022_tripdata.combined_data`
WHERE start_station_name IS NULL OR start_station_id IS NULL;
