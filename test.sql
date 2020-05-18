select * from emp order by sal desc;

select * from dept;

select job, sal, empno from emp;

-- emp : 사원정보
-- dept : 부서정보
-- bonus : 임시테이블
-- salgrade : 급여 테이블

-- 테이블의 구조 확인 : desc 테이블이름
desc emp;
desc dept;
desc salgrade;

select * from emp;
select * from dept;

select deptno from dept;

-- nvl 함수 : null값 연산가능 값으로 치환
-- nvl(컬럼명, 기본값) : 기본값은 컬럼의 도메인의 자료형과 같아야 한다
select ename, sal, job, comm, sal*12, sal*12+comm from emp;
select ename, sal, job, comm, sal*12+comm, nvl(comm, 0), sal*12+nvl(comm, 0) from emp;

-- as : 컬럼 별칭으로 출력
select ename, sal*12+nvl(comm, 0) as AnnSal from emp;

-- || : 완성 문장으로 출력
select ename || ' is a ' || job as JobDesc from emp;

-- distinct : 중복 값 제거 후 출력
select deptno from emp;
select distinct deptno from emp;