-- =============================================================
-- VIEW
-- =============================================================
-- 논리적인 가상 테이블 : 테이블과 같이 사용 가능, 제약은 존재
-- 물리적인 테이블 기반으로 만든다 (select 서브쿼리를 이용)
-- create [or replace] view viewname as 서브쿼리
create view emp_view30
as
select empno, ename, deptno
from emp
where deptno=30;

select * from emp_view30;

desc user_views;

-- 인라인 뷰를 사용해서 입사일이 빠른 사람 5명 출력
-- 1. view객체 생성
create or replace view emp_hir_view
as
select empno, ename, hiredate
from emp
order by hiredate asc;

select rownum, empno, ename, hiredate 
from emp_hir_view 
where rownum<6;