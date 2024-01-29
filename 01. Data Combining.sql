-- Data Combining

DROP TABLE IF EXISTS `project-30-10-2023.combined_data`

--combinig all that of 12 months from 2023 into single table for 2023

CREATE TABLE IF NOT EXISTS `Cyclistic.combined_data_2023`
AS (
  SELECT * FROM `Cyclistic.2023_01`
  UNION ALL
  SELECT * FROM `Cyclistic.2023_02`
  UNION ALL
  SELECT * FROM `Cyclistic.2023_03`
  UNION ALL
  SELECT * FROM `Cyclistic.2023_04`
  UNION ALL
  SELECT * FROM `Cyclistic.2023_05`
  UNION ALL
  SELECT * FROM `Cyclistic.2023_06`
  UNION ALL
  SELECT * FROM `Cyclistic.2023_07`
  UNION ALL
  SELECT * FROM `Cyclistic.2023_08`
  UNION ALL
  SELECT * FROM `Cyclistic.2023_09`
  UNION ALL
  SELECT * FROM `Cyclistic.2023_10`
  UNION ALL
  SELECT * FROM `Cyclistic.2023_11`
  UNION ALL
  SELECT * FROM `Cyclistic.2023_12`
);



