SELECT 
  start_station_name, 
  COUNT(*) AS ride_count
FROM 
  `bigquery-public-data.new_york_citibike.citibike_trips`
GROUP BY 
  start_station_name
ORDER BY 
  ride_count DESC
LIMIT 5;
