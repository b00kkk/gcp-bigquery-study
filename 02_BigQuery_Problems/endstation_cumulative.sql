-- 2018년 3월 한 달 동안 각 종료 대여소 별로 날짜순으로 정렬된 누적 대여 건수를 계산하세요.
-- 상위 5개 종료 대여소 이름과 누적 합계를 출력하세요
-- 출력컬럼: end_station_name, ride_date, daily_ride_count, cumulative_ride_count

WITH end_day_count AS(
  -- 종료 대여소별 날짜별 하루 대여 건수 집계
  SELECT
    end_station_name,
    DATE(starttime) AS ride_date,
    COUNT(*) AS daily_ride_count
  FROM
    bigquery-public-data.new_york_citibike.citibike_trips
  WHERE starttime BETWEEN '2018-03-01' AND '2018-03-31'
  GROUP BY end_station_name, DATE(starttime)
),
sum_cnt AS(
  -- 누적 대여 건수 계산
  SELECT *,
    SUM(daily_ride_count) OVER(PARTITION BY end_station_name ORDER BY ride_date) AS cumulative_ride_count
  FROM end_day_count
),
max_cum AS(
  -- 각 종료 대여소의 누적 대여 건수 중 최대값 추출
  SELECT
    end_station_name,
    MAX(cumulative_ride_count) AS max_cumulative
  FROM sum_cnt
  GROUP BY end_station_name
)

SELECT s.end_station_name, s.ride_date, s.daily_ride_count, s.cumulative_ride_count
FROM sum_cnt AS s
JOIN max_cum AS m
ON s.end_station_name = m.end_station_name
AND s.cumulative_ride_count = m.max_cumulative
ORDER BY s.cumulative_ride_count DESC
LIMIT 5