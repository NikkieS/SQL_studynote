create table dept01(
    deptno number(2),
    dname varchar2(14),
    loc varchar2(13)
);
-- =============================================================
-- 입력 방식
-- 행단위 입력 : insert into 테이블이름 (입력하고자 하는 컬럼들) values (데이터들)
-- 입력 컬럼의 순서와 입력데이터의 순서는 같아야 한다.
-- =============================================================
insert into dept01 (deptno, dname, loc) values(10, 'MARKETING', 'SEOUL');   -- 행단위 입력
insert into dept01 (deptno, dname) values(40, 'DEV');
insert into dept01 values(20, 'DESIGN', 'PUSAN');                           -- 기본 입력

desc dept01;
select * from dept01;

create table dept02(
    deptno number(2) not null,
    dname varchar2(20) not null,
    loc varchar2(20) default 'SEOUL'
);

insert into dept02 (deptno, dname, loc) values(10, 'MARKETING', 'SEOUL');
insert into dept02 (deptno, dname) values(40, 'DEV');

-- null / 공백 : null 값으로 입력
insert into dept02 (deptno, dname, loc) values(10, 'MARKETING', null); 
insert into dept02 (deptno, dname, loc) values(10, 'MARKETING', '');

select * from dept02;

-- =============================================================
-- 서브쿼리를 이용해서 여러 테이블에 한번에 데이터 삽입
-- 테스트 테이블 emp_hir : empno, ename, hiredate
-- 테스트 테이블 emp_mgr : empnom ename, mgr
-- =============================================================
-- 1<0 false : 구조만 복사
create table emp_hir
as
select empno, ename, hiredate from emp where 1<0;
create table emp_mgr
as
select empno, ename, mgr from emp where 1<0;

desc emp_hir;
desc emp_mgr;

-- 두개 테이블에 emp 테이블의 데이터를 기반으로 삽입
insert all
into emp_hir values(empno, ename, hiredate)
into emp_mgr values(empno, ename, mgr)
select empno, ename, hiredate, mgr
from emp;

select * from emp_hir;
select * from emp_mgr;

-- =============================================================
-- INSERT ALL 명령문에
-- WHEN... THEN 절을 추가해서 조건을 제시하여 조건에 맞는 행만 추출
-- =============================================================
create table emp_hire02
as
select empno, ename, hiredate from emp where 1<0;
create table emp_sal
as
select empno, ename, sal from emp where 1<0;

desc emp_hire02;
desc emp_sal;

insert all when hiredate > '1982/01/01' then
    into emp_hire02 values(empno, ename, hiredate)
when sal >= 2000 then 
    into emp_sal values(empno, ename, sal)
select empno, ename, hiredate, sal
from emp;

select * from emp_hire02;
select * from emp_sal;

create table emp01
as
select * from emp;
-- =============================================================
-- 컬럼의 데이터 변경(수정)
-- update 테이블이름 set 컬럼이름1=값, 컬럼이름2=값, ... where 조건
-- =============================================================
-- 1. 모든 사원의 부서번호를 30번으로 수정
update emp01 set deptno=30;
-- 2. 모든 사원의 급여를 10% 인상
update emp01 set sal= sal*1.1;
-- 3. 모든 사원의 입사일을 오늘로 수정
update emp01 set hiredate = sysdate;

select * from emp01;
drop table emp01;

-- 1. 부서번호가 10번인 사원의 부서번호를 30번으로 수정
update emp01 set deptno=30 where deptno=10;
-- 2. 급여가 3000 이상인 사원만 급여를 10% 인상
update emp01 set sal= sal*1.1 where sal >= 3000;
-- 3. 1987년에 입사한 사원의 입사일을 오늘로 수정
update emp01 set hiredate=sysdate where hiredate like '87%';
select * from emp where substr(hiredate, 1, 2)='87';

-- 1. SCOTT 사원의 부서번호 -> 20, 직급 -> MANAGER 수정
update emp01 set deptno=20, job='MANAGER'
where ename='SCOTT';
-- 2. SCOTT 사원의 입사일자 -> 오늘, 급여 -> 50, 성과급->4000
update emp01 set hiredate=sysdate, sal=50, comm=4000
where ename='SCOTT';
select * from emp01 where ename='SCOTT';

-- =============================================================
-- 서브쿼리를 이용한 데이터 수정
-- =============================================================
drop table dept01;
create table dept01
as
select * from dept;

-- 1. 20번 부서의 지역명을 40번 부서의 지역명으로 변경
update dept01
set loc=(select loc 
        from dept01
        where deptno=40)
where deptno=20;

select * from dept01;

-- 부서번호가 20인 부서의 부서명과 지역명을 부서번호가 40인 부서와 동일하게 변경
update dept01
set loc=(select loc from dept01 where deptno=40),
dname=(select dname from dept01 where deptno=40)
where deptno=20;

rollback;

update dept01
set (dname, loc)=(select dname, loc from dept01 where deptno=40)
where deptno=20;

-- =============================================================
-- DML : 삭제
-- =============================================================
-- delete from 테이블 이름 where 조건
-- where 절이 없으면 모든행에 적용

-- 부서번호가 30인 부서 삭제
delete from dept01 where deptno=30;

-- 사원 테이블에서 부서명이 SALES인 사원을 모두 삭제
delete from emp01 where deptno=(select deptno from dept01 where dname='SALES');
select * from emp01;