-- 2018년 3월 한 달 동안 요일별 + 시간대별 자전거 대여 건수를 구하세요.
-- 각 조합에 대해 대여 건수가 1000건 이상인 경우만 출력하세요.

SELECT
  EXTRACT(DAYOFWEEK FROM starttime) AS weekday,
  EXTRACT(HOUR FROM starttime) AS hour,
  COUNT(*) AS ride_count
FROM
  bigquery-public-data.new_york_citibike.citibike_trips
WHERE
  starttime BETWEEN '2018-03-01' AND '2018-03-31'
GROUP BY
  weekday, hour
HAVING
  COUNT(*) >= 1000
ORDER BY
  ride_count DESC
