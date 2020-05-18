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