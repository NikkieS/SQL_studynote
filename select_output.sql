
-- 특정 데이터를 추출하기 : where 절을 이용
-- select 컬럼 명 from 테이블 이름 where 조건 (true/false)

-- 전체 사원중의 월 급여가 3000이상인 사원의 리스트
select * from emp where sal >= 3000;

-- 전체 사원중 10번 부서의 소속 사원의 이름과 직급을 출력
select ename, job from emp where deptno = 10;
