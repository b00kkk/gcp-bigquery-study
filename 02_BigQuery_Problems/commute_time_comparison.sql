-- 2018년 3월 한 달 동안 요일별로 출근 시간대(07-09시)와 퇴근 시간대(17-19시) 자전거 대여 건수를 각각 계산하고 비교하세요
-- 출력 컬럼: weekday, moring_commute_count, evening_commute_count

WITH morning AS (
  SELECT
    EXTRACT(DAYOFWEEK FROM starttime) AS weekday,
    COUNT(*) AS morning_commute_count
  FROM
    bigquery-public-data.new_york_citibike.citibike_trips
  WHERE
    starttime BETWEEN '2018-03-01' AND '2018-03-31'
  AND
    EXTRACT(HOUR FROM starttime) BETWEEN 7 AND 9
  GROUP BY EXTRACT(DAYOFWEEK FROM starttime)),
evening AS(
  SELECT
    EXTRACT(DAYOFWEEK FROM starttime) AS weekday,
    COUNT(*) AS evening_commute_count
  FROM
    bigquery-public-data.new_york_citibike.citibike_trips
  WHERE
    starttime BETWEEN '2018-03-01' AND '2018-03-31'
  AND
    EXTRACT(HOUR FROM starttime) BETWEEN 17 AND 19
  GROUP BY EXTRACT(DAYOFWEEK FROM starttime)
)

SELECT m.weekday, m.morning_commute_count, e.evening_commute_count
FROM morning m
JOIN evening e
ON m.weekday=e.weekday
ORDER BY weekday;


-- 대안 쿼리
SELECT
    EXTRACT(DAYOFWEEK FROM starttime) AS weekday,
    COUNT(CASE WHEN EXTRACT(HOUR FROM starttime) BETWEEN 7 AND 9 THEN 1 END) AS morning_commute_count,
    COUNT(CASE WHEN EXTRACT(HOUR FROM starttime) BETWEEN 17 AND 19 THEN 1 END) AS evening_commute_count,
FROM 
    bigquery-public-data.new_york_citibike.citibike_trips
WHERE
    starttime '2018-03-01' AND '2018-03-31'
GROUP BY weekday
ORDER BY weekday;