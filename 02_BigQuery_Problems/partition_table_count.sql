-- PARTITIONS 메타 테이블을 활용하여 파티션이 존재하는 테이블만 확인하고, 각 테이블의 고유한 파티션 개수를 함께 출력하세요.
-- 출력칼럼: table_name

SELECT
  table_name, COUNT(DISTINCT partition_id) AS partition_count
FROM
  bigquery-public-data.new_york_citibike.INFORMATION_SCHEMA.PARTITIONS
WHERE
  partition_id IS NOT NULL
GROUP BY
  table_name
ORDER BY partition_count DESC;