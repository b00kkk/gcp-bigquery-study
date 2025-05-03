-- 2018년 3월 기준, 가장 이동 시간이 긴 자전거 여행을 조회하세요
-- 출력칼럼: 시작시간(starttime), 시작대여소(start_station_id), 종료대여소(end_station_id), 소요 시간(tripduration)

SELECT
  starttime, start_station_id, end_station_id, tripduration
FROM
  bigquery-public-data.new_york_citibike.citibike_trips
WHERE
  starttime BETWEEN '2018-03-01' AND '2018-03-31' 
AND
  tripduration IS NOT NULL
ORDER BY
  tripduration DESC
LIMIT 1