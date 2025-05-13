-- 전체 스키마 정보를 조회하세요.
-- 출력칼럼: column_name, data_type, is_nullable, ordinal_position

SELECT column_name, data_type, is_nullable, ordinal_position
FROM
  bigquery-public-data.new_york_citibike.INFORMATION_SCHEMA.COLUMNS
WHERE
  table_name='citibike_trips'
ORDER BY ordinal_position;