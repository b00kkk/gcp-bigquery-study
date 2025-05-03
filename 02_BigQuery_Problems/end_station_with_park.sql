-- 대여 종료 대여소 이름에 park라는 단어가 포함된 대여소들 중 2018년 3월 한 달 동안 가장 많이 사용된 종료 대여소 Top5를 구하세요
-- 출력컬럼: end_station_id, ride_count

SELECT
  end_station_name, COUNT(*) AS ride_count
FROM
  bigquery-public-data.new_york_citibike.citibike_trips
WHERE
  starttime BETWEEN '2018-03-01' AND '2018-03-31'
AND
  LOWER(end_station_name) LIKE '%park%'
GROUP BY
  end_station_name
ORDER BY
  ride_count DESC
LIMIT 5