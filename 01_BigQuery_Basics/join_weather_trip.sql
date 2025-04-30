-- 날씨 데이터와 JOIN
SELECT 
  t.start_station_name,
  w.temp,  -- 평균 기온
  w.prcp,  -- 강수량
  COUNT(*) AS ride_count
FROM 
  `bigquery-public-data.new_york_citibike.citibike_trips` AS t
JOIN (
  SELECT 
    stn,
    temp,
    prcp,
    DATE(CONCAT(CAST(year AS STRING), '-', LPAD(CAST(mo AS STRING), 2, '0'), '-', LPAD(CAST(da AS STRING), 2, '0'))) AS obs_date
  FROM 
    `bigquery-public-data.noaa_gsod.gsod2018`
  WHERE 
    stn = '725030'  -- 뉴욕 관측소
) AS w
ON 
  DATE(t.starttime) = w.obs_date
GROUP BY 
  t.start_station_name, w.temp, w.prcp
ORDER BY 
  ride_count DESC
LIMIT 10;
