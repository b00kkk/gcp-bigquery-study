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
