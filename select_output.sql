
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
-- 2000에서 3000 사이의 급여를 받는 사원의 정보를 출력
select * from emp where sal >= 2000 and sal <= 3000;
select * from emp where sal between 2000 and 3000;

-- between : ~ 이상 ~ 이하 범위만 가능 (미만 초과는 불가능)
select * from emp 
-- where sal > 2000 and sal < 3000;
where sal between 2001 and 2999;

-- 1981년 입사자 리스트를 출력
select * from emp where hiredate >= '1981-01-01' and hiredate <= '1981-12-31';
select * from emp where hiredate between '1981-01-01' and '1981-12-31';

-- in 연산자 & or 연산자
-- 컬럼 이름 in(데이터, 데이터, 데이터, ...)
-- 컬럼=데이터1 or 컬럼=데이터2 or 컬럼=데이터3, or ...
select * from emp where job in('SALESMAN', 'MANAGER', 'ALAYST');
select * from emp where job='SALESMAN' or job='MANAGER' or job='ALAYST';

-- 커미션이 300이거나 500이거나 1400인 사원을 출력
select * from emp where comm in(300, 500, 1400);

-- 패턴 검색 : like
-- 컬럼이름 like 패턴
-- 패턴 : %, _
-- % : 0개이상 문자열이 가능하다 
select * from emp where ename like 'S%';    -- 첫문자 동일
select * from emp where ename like '%S';    -- 끝문자 동일
select * from emp where ename like '%S%';   -- 포함

-- _ : 1개의 어떠한 문자가 와도 가능하다
select * from emp where ename like '__A%';  -- 3번째 문자 동일

-- row의 정렬
-- 오름차순 : asc(생략가능, 기본 값)
-- 내림차순 : desc(명시적 사용)
select ename, sal, hiredate, comm from emp
-- order by ename asc;
-- order by ename desc;
order by hiredate asc;