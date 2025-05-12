-- 2018년 3월 한달동안 시작 대여소와 종료 대여소가 같은 경우만 필터링하여 대여 건수를 대여소별로 집계하세요.
-- 상위 10개의 대여소를 출력하세요.
-- 출력 컬럼: station_name, same_start_end_count

SELECT
  start_station_name AS station_name,
  COUNT(*) AS same_start_end_count
FROM
  bigquery-public-data.new_york_citibike.citibike_trips
WHERE
  starttime BETWEEN '2018-03-01' AND '2018-03-31'
AND
  start_station_name = end_station_name
GROUP BY start_station_name
ORDER BY same_start_end_count DESC
LIMIT 10