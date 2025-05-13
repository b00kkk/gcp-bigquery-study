-- 모든 테이블에 대해 테이블 이름, 생성 시간, 테이블 유형을 조회하고 가장 최근에 생성된 5개 테이블을 출력
-- 출력칼럼: table_name, creation_time, table_type

SELECT 
  table_name, creation_time, table_type 
FROM
  bigquery-public-data.new_york_citibike.INFORMATION_SCHEMA.TABLES
ORDER BY creation_time DESC
LIMIT 5;