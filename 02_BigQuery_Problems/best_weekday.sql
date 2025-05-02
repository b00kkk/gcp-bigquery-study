-- 2018년 3월 한달 동안 자전거 대여가 가장 많은 요일(요일 숫자) 구하기
-- 출력칼럼: weekday(요일), ride_count(대여 건수)

SELECT
  EXTRACT(DAYOFWEEK FROM starttime) AS weekday, --요일추출(1=일,2=월,...)
  COUNT(*) AS ride_count --요일별 대여 횟수
FROM
  bigquery-public-data.new_york_citibike.citibike_trips
WHERE starttime BETWEEN '2018-03-01' AND '2018-03-31'--3월
GROUP BY weekday
ORDER BY ride_count DESC
LIMIT 1 -- 최다 대여 요일 1개 출