-- 데이터베이스 구현
-- 1.
create table member(
    idx number(6),
    mId varchar2(20) constraint memeber_mId_pp primary key,
    mName varchar2(20)constraint member_mName_nn not null,
    mPw varchar2(20) constraint member_mPw_nn not null,
    mPicName varchar2(20),
    reg_date date default sysdate
);

-- 2.
create index member_mName_index on member(mName);

-- 3.
create view member_view
as
select mId, mName, mPicName
from member;

-- SQL 활용
-- #1-1.
create table Contact(
    pIdx number(6) constraint Contact_pIdx_pp primary key,
    cName varchar2(10) constraint Contact_cName_nn not null,
    cNum number(15) constraint Contact_cNum_nn not null,
    cAdd varchar2(20) default 'no entry' constraint Contact_cAdd_nn not null,
    cEmail varchar2(20) default 'no entry' constraint Contact_cEmail_nn not null,
    cType varchar2(4) constraint Contact_cType_ck check(cType in (univ, com, cafe)),
    
    cMajor varchar2(20),
    cYear number(1) constraint phonebook_puYear_ck check(puYear between 1 and 4),
    
    cComName varchar2(20),
    cComDept varchar2(20),
    cComJob varchar2(20),
    
    cCafeName varchar2(20),
    cCafeNickname varchar2(20)
);

-- #1-2.
insert into dept values(50, 'FINANCE', 'LONDON');

-- #1-3.
update dept set dname = 'PURCHASE', loc = 'TOKYO' where deptno = 50;

-- #1-4.
delete from dept where deptno = 50;

-- #1-5.
select * from tab where tabtype = 'TABLE';

-- #1-6.
desc emp;

-- #1-7.
select * from user_constraints;

-- #2-1.
create index emp_index on emp(ename);

-- #2-2.
create view emp_view
as
select *
from emp e, dept d
where e.deptno=d.deptno;

-- #2-3.
update emp set deptno=(select deptno from emp where ename = 'SCOTT');