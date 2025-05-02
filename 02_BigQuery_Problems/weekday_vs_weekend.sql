-- 2018년 3월 한 달 동안 평일과 주말 중 자전거 대여 건수가 더 많은 쪽과 그 건수를 구하세요
-- 출력 컬럼: day_type('weekday' or 'weekend'), ride_count

SELECT 
  CASE WHEN EXTRACT(DAYOFWEEK FROM starttime) IN (1,7) THEN 'weekend'
  ELSE 'weekday' END AS day_type, -- 평일, 주말 구분
  COUNT(*) AS ride_count --대여 건수
FROM
  bigquery-public-data.new_york_citibike.citibike_trips
WHERE
  starttime BETWEEN '2018-03-01' AND '2018-03-31'
GROUP BY day_type
ORDER BY ride_count DESC
LIMIT 1