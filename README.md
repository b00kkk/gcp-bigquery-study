# 📘 GCP BigQuery Study

> GCP의 BigQuery를 활용한 데이터 분석 실습 기록  
> 공개 데이터셋 기반 SQL 실습을 통해 실무 분석 역량을 쌓는 개인 프로젝트입니다.



<details>
<summary> 📅 Day 1 </summary>

✅ GCP 환경 설정 + 첫 쿼리
- GCP BigQuery 계정 생성 및 콘솔 접속
- Public Dataset 연결 (citibike 데이터)
- SQL 기본 SELECT + GROUP BY + ORDER BY 실습
- GitHub에 쿼리 및 결과 정리

</details>

<details>
<summary> 📅 Day 2 </summary>

✅ 조건문 + 날짜 처리 + 외부 데이터 JOIN  
- WHERE, ORDER BY 문법 심화  
- 날짜 처리 함수(EXTRACT, FORMAT_TIMESTAMP) 활용  
- NOAA 날씨 데이터(`gsod2018`)와 자전거 데이터 JOIN 실습  
- 관측소 `stn` + 날짜를 DATE로 변환하여 조인 수행

🧪 주요 쿼리 요약:
- 2018년 2월 반납 대여소 상위 10개 조회
- 월별 자전거 이용량 집계
- 기온/강수량별 대여소 이용량 분석 (JOIN)

</details>

<details>
<summary> 📅 Day 3 </summary>

✅ 문제 기반 실전 분석 연습 시작  
- 요일 추출과 조건 필터링을 통한 분석
- `CASE WHEN`으로 조건 분기 처리
- 자전거 대여소/요일/평일·주말 등 다양한 관점에서 집계 실습
- 정렬 + 제한 조건(`LIMIT`)을 통한 핵심 정보 추출

🧪 주요 쿼리 요약:
- 2018년 3월 가장 많이 대여된 요일 구하기
- 2018년 3월 자전거 시작 대여소 Top 5 조회
- 평일 vs 주말 자전거 대여량 비교

</details>

<details>
<summary> 📅 Day 4 </summary>

✅ 서브쿼리, 문자열 조건, 조건부 집계 실습  
- 이동 시간 기준 최대값 탐색 (`tripduration`)
- 문자열 필터링: `LOWER()`, `LIKE`  
- 평균값을 기준으로 하는 조건부 집계 (`AVG + 서브쿼리`)
- 정렬 + LIMIT을 이용한 상위 기록 탐색

🧪 주요 쿼리 요약:
- 2018년 3월 가장 오래 이동한 기록 조회
- 종료 대여소 이름에 'park'가 포함된 대여소 Top 5
- 평균보다 긴 소요시간을 가진 대여 기록 상위 10건 조회

</details>
