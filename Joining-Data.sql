-- Data Combining

DROP TABLE IF EXISTS `202_tripdata.combined_data`;

-- combining all the 12 months data tables into a single table containing data from Jan 2022 to Dec 2022.

CREATE TABLE IF NOT EXISTS `2022_tripdata.combined_data` AS (
  SELECT * FROM `2022_tripdata.202201_tripdata`
  UNION ALL
  SELECT * FROM `2022_tripdata.202202_tripdata`
  UNION ALL
  SELECT * FROM `2022_tripdata.202203_tripdata`
  UNION ALL
  SELECT * FROM `2022_tripdata.202204_tripdata`
  UNION ALL
  SELECT * FROM `2022_tripdata.202205_tripdata`
  UNION ALL
  SELECT * FROM `2022_tripdata.202206_tripdata`
  UNION ALL
  SELECT * FROM `2022_tripdata.202207_tripdata`
  UNION ALL
  SELECT * FROM `2022_tripdata.202208_tripdata`
  UNION ALL
  SELECT * FROM `2022_tripdata.202209_tripdata`
  UNION ALL
  SELECT * FROM `2022_tripdata.202210_tripdata`
  UNION ALL
  SELECT * FROM `2022_tripdata.202211_tripdata`
  UNION ALL
  SELECT * FROM `2022_tripdata.202212_tripdata`
);

-- checking no of rows which are 5667717

SELECT COUNT(*)
FROM `2022_tripdata.combined_data`;

