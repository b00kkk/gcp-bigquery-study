-- 2018년 3월 한 달 동안 요일별로 자전거 대여량 순위를 메기고, 요일별로 가장 많이 대여된 상위 1건만 출력하세요.
-- 출력칼럼: weekday(요일), start_station_name, ride_count, rank

WITH day_station_cnt AS(
  -- 요일별, 시작 대여소별 대여량 집계
  SELECT
    EXTRACT(DAYOFWEEK FROM starttime) AS weekday,
    start_station_name,
    COUNT(*) AS ride_count
  FROM
    bigquery-public-data.new_york_citibike.citibike_trips
  WHERE
    starttime BETWEEN '2018-03-01' AND '2018-03-31'
  GROUP BY EXTRACT(DAYOFWEEK FROM starttime), start_station_name
),
rank_day AS (
  -- 요일별, 시작 대여소별 순위 매기기
  SELECT
  weekday, start_station_name, ride_count,
  ROW_NUMBER() OVER(PARTITION BY weekday ORDER BY ride_count DESC) AS rank
FROM day_station_cnt)

-- 순위 1위만 출력
SELECT *
FROM rank_day
WHERE rank=1
ORDER BY ride_count DESC
