-- 2018년 월별 자전거 대여 건수 출력
SELECT 
  FORMAT_TIMESTAMP("%Y-%m", starttime) AS year_month,
  COUNT(*) AS ride_count
FROM 
  `bigquery-public-data.new_york_citibike.citibike_trips`
WHERE 
  EXTRACT(YEAR FROM starttime) = 2018
GROUP BY 
  year_month
ORDER BY 
  year_month;
