-- =============================================================
-- INDEX
-- =============================================================
-- 검색을 빠르게 하기위해 사용한다.
-- DML 작업에는 성능 저하가 올 수 있다

desc user_ind_columns;

select index_name, column_name, table_name
from user_ind_columns;

drop table emp01;

create table emp01
as
select * from emp;

insert into emp01 select * from emp01;
select count(*) from emp01;

insert into emp01(empno, ename) values(1111, 'SON');
insert into emp01(empno, ename) values(2222, 'PARK');
select * from emp01 where ename='PARK';

-- INDEX 생성
-- create index 인덱스이름 on 테이블이름 (컬럼이름)

create index emp01_ename_index on emp01(ename);

select * from dept;
delete from dept where dname='마케팅';
insert all
into emp values(empno, ename, job, mgr, hiredate, sal, comm, deptno)
select empno, ename, job, mgr, hiredate, sal, comm, deptno
from emp01 where rownum<15;

update emp set ename='NICOLE' where hiredate like '94%';
commit;