-- Data Cleaning

DROP TABLE IF EXISTS `2022_tripdata.cleaned_combined_data`;

-- creating new table with clean data

CREATE TABLE IF NOT EXISTS `2022_tripdata.cleaned_combined_data` AS (
  SELECT ride_id, rideable_type, started_at, ended_at, 
    EXTRACT(MINUTE FROM (ended_at - started_at)) AS ride_length,
    CASE EXTRACT(DAYOFWEEK FROM started_at) 
      WHEN 1 THEN 'SUN'
      WHEN 2 THEN 'MON'
      WHEN 3 THEN 'TUES'
      WHEN 4 THEN 'WED'
      WHEN 5 THEN 'THURS'
      WHEN 6 THEN 'FRI'
      WHEN 7 THEN 'SAT'    
    END AS day_of_week,
    CASE EXTRACT(MONTH FROM started_at)
      WHEN 1 THEN 'JAN'
      WHEN 2 THEN 'FEB'
      WHEN 3 THEN 'MAR'
      WHEN 4 THEN 'APR'
      WHEN 5 THEN 'MAY'
      WHEN 6 THEN 'JUN'
      WHEN 7 THEN 'JUL'
      WHEN 8 THEN 'AUG'
      WHEN 9 THEN 'SEP'
      WHEN 10 THEN 'OCT'
      WHEN 11 THEN 'NOV'
      WHEN 12 THEN 'DEC'
    END AS month,
    start_station_name, end_station_name, 
    start_lat, start_lng, end_lat, end_lng, member_casual
  FROM `2022_tripdata.combined_data`
  WHERE start_station_name IS NOT NULL AND
    end_station_name IS NOT NULL AND
    end_lat IS NOT NULL AND
    end_lng IS NOT NULL AND
    EXTRACT(MINUTE FROM (ended_at - started_at)) > 1
);

ALTER TABLE `2022_tripdata.cleaned_combined_data`     -- set ride_id as primary key
ADD PRIMARY KEY(ride_id) NOT ENFORCED;

SELECT *
FROM `2022_tripdata.cleaned_combined_data`
LIMIT 10;

SELECT COUNT(ride_id) AS no_of_rows       -- returned 4,213,927 rows so 1,453,790 rows removed
FROM `2022_tripdata.cleaned_combined_data`;
