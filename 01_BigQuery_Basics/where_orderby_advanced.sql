-- 기온/강수량별 대여소 이용량 분석 (JOIN)
SELECT 
  end_station_name, 
  COUNT(*) AS ride_count
FROM 
  `bigquery-public-data.new_york_citibike.citibike_trips`
WHERE 
  EXTRACT(YEAR FROM starttime) = 2018
  AND EXTRACT(MONTH FROM starttime) = 2
GROUP BY 
  end_station_name
ORDER BY 
  ride_count DESC
LIMIT 10;
