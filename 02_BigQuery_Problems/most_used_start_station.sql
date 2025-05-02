--2018년 3월 한 달 동안 가장 많이 사용된 자전거 시작 대여소 상위 5곳을 구하시오
--출력컬럼: start_station_name(시작 대여소), ride_count(대여 건수)

SELECT 
  start_station_name, --시작 대여소
  COUNT(*) AS ride_count --자전거 대여 건수
FROM 
  bigquery-public-data.new_york_citibike.citibike_trips
WHERE
  starttime BETWEEN '2018-03-01' AND '2018-03-31'
GROUP BY
  start_station_name
ORDER BY
  ride_count DESC
LIMIT 5