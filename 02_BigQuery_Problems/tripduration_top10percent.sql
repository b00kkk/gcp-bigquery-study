-- 2018년 3월 한 달 동안 전체 자전거 대여 기록을 소요시간(tripduration) 기준으로 정렬한 뒤, 상위 10%에 해당하는 대여 기록만 추출하세요.
-- 출력 컬럼: starttime, start_station_name, end_station_name, tripduration, percent_rank

WITH ranked_trips AS(
  SELECT
    starttime,
    start_station_name,
    end_station_name,
    tripduration,
    PERCENT_RANK() OVER(ORDER BY tripduration) AS percent_rank
  FROM
    bigquery-public-data.new_york_citibike.citibike_trips
  WHERE
    starttime BETWEEN '2018-03-01' AND '2018-03-31'
  AND
    tripduration > 0
)
SELECT *
FROM ranked_trips
WHERE percent_rank >= 0.9
ORDER BY tripduration DESC