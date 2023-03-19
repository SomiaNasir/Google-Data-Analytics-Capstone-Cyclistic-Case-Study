
-- DROP TABLE IF EXISTS `2022_tripdata.combined_data`;

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

-- checking if individual no of rows are equal to combined data

-- SELECT (
--   COUNT(a.ride_id) + COUNT(b.ride_id) + COUNT(c.ride_id) + COUNT(d.ride_id) +
--   COUNT(e.ride_id) + COUNT(f.ride_id) + COUNT(g.ride_id) + COUNT(h.ride_id) +
--   COUNT(i.ride_id) + COUNT(j.ride_id) + COUNT(k.ride_id) + COUNT(l.ride_id)
--   ) AS separate_counted, COUNT(m.ride_id) AS combined_counted
-- FROM `2022_tripdata.202201_tripdata` a,
--  `2022_tripdata.202202_tripdata` b,
--  `2022_tripdata.202203_tripdata` c,
--  `2022_tripdata.202204_tripdata` d,
--  `2022_tripdata.202205_tripdata` e,
--  `2022_tripdata.202206_tripdata` f,
--  `2022_tripdata.202207_tripdata` g,
--  `2022_tripdata.202208_tripdata` h,
--  `2022_tripdata.202209_tripdata` i,
--  `2022_tripdata.202210_tripdata` j,
--  `2022_tripdata.202211_tripdata` k,
--  `2022_tripdata.202212_tripdata` l,
--  `2022_tripdata.combined_data` m;

-- SELECT * FROM `2022_tripdata`.INFORMATION_SCHEMA.TABLE_STORAGE;

-- checking no of rows which are 5667717

SELECT COUNT(*)
FROM `2022_tripdata.combined_data`;

