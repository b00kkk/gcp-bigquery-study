-- 2018년 3월 한 달 동안 자전거 이동 시간이 전체 평균보다 긴 대여 기록 상위 10건을 출력하세요
-- 출력컬럼: starttime, start_station_name, end_station_name, tripduration

SELECT
  starttime, start_station_name, end_station_name, tripduration
FROM
  bigquery-public-data.new_york_citibike.citibike_trips
WHERE
  starttime BETWEEN '2018-03-01' AND '2018-03-31'
AND
  (SELECT AVG(tripduration) --평균값 서브쿼리로 계산
  FROM bigquery-public-data.new_york_citibike.citibike_trips
  WHERE starttime BETWEEN '2018-03-01' AND '2018-03-31'
  AND tripduration > 0) < tripduration
ORDER BY
  tripduration DESC
LIMIT 10