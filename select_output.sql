
-- 특정 데이터를 추출하기 : where 절을 이용
-- select 컬럼 명 from 테이블 이름 where 조건 (true/false)

-- 전체 사원중의 월 급여가 3000이상인 사원의 리스트
select * from emp where sal >= 3000;

-- 전체 사원중 10번 부서의 소속 사원의 이름과 직급을 출력
select ename, job from emp where deptno = 10;

select * from emp where ename = 'SCOTT';

-- 논리연산자 : and
-- 직급이 Manager인 사람을 검색하여 사원명, 부서번호, 직급을 출력
select ename, deptno, job from emp where deptno = 10 and job = 'MANAGER';

-- 논리연산자 : or
-- 10번 부서에 소속된 사원이거나 직급이 MANAGER인 사람을 검색하여 사원명, 부서번호, 직급을 출력
select ename, deptno, job from emp where deptno = 10 or job = 'MANAGER';

-- 범위연산 : and / between
-- between : ~ 이상 ~ 이하 범위만 가능 (미만 초과는 불가능)
-- 2000에서 3000 사이의 급여를 받는 사원의 정보를 출력
select * from emp where sal >= 2000 and sal <= 3000;
select * from emp where sal between 2000 and 3000;