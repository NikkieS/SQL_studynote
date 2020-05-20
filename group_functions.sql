-- 그룹함수 (집합함수)
-- sum, avg, count, max, min

-- sum(컬럼이름) : 해당 컬럼의 데이터들의 합 반환
select to_char(sum(sal)*1000, 'L999,999,999') as totalSal from emp;

-- avg(컬럼이름) : 해당 컬럼의 데이터들의 평균 반환
select avg(sal) from emp;

-- max, min(컬럼이름) : 해당 컬럼의 데이터 중에서 최대값, 최소값 반환
select max(sal), min(sal), max(comm), min(comm) from emp;

-- count(컬럼이름 or *) : 해당 컬럼의 행의 개수 반환
select count(*), count(comm) from emp;

-- group by : select 컬럼명, 그룹함수 from 테이블명 where 조건 group by 컬럼명
select job, count(job) from emp group by job order by count(job) desc;