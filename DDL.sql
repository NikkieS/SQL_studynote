-- DDL

-- 테이블 생성 
-- create table 테이블 이름 () <- 괄호 안에 컬럼을 정의
-- (컬럼명1 타입(사이즈), 컬러명2 타입(사이즈), ...)

-- ddl_test 라는 이름의 테이블 생성
-- 컬럼1 : no, 숫자타입, 사이즈 3
-- 컬럼2 : name, 가변 문자열 저장, 사이즈 10
-- 컬럼3 : birth, 날짜타입, 기본값: 현재 날짜 시간

create table ddl_test (
    no number (3),
    name varchar (10),
    birth date default sysdate
);

desc ddl_test;
select * from tab;
select * from ddl_test;

insert into ddl_test (no, name) values (1, 'scott');

create table emp01(
    empno number(4),
    ename varchar2(10),
    sal number(7, 2)
);

desc emp01;

-- 테이블의 복사 
create table emp02
as
select * from emp;

select * from emp02;

-- emp 테이블의 10번 부서 데이터만 복사
create table emp04
as
select * from emp where deptno=10;

-- emp 테이블의 스키마 구조만 복사해서 새로운 테이블 emp05 todtjd
create table emp05
as
select * from emp where 1<0;

-- 테이블에 컬럼 추가
-- alter table 테이블 이름 add(칼럼정의)

-- emp01 테이블에 직급(job) 컬럼을 추가하자
desc emp01;

alter table emp01 
add(job varchar2(10));

-- 컬럼의 변경
-- alter table modify
-- 직급(job) 칼럼을 최대 30글자까지 저장할 수 있게 변경
alter table emp01 
modify(job varchar2(30));

-- 컬럼의 삭제
-- alter table 테이블 이름 drop
alter table emp01
drop column job;

-- 테이블 객체 삭제
-- drop table 테이블 이름
drop table emp01;

select * from tab;

-- 모든 로우 삭제
-- truncate
select * from emp02;
truncate table emp02;
drop table emp02;

-- 
desc dept;
insert into dept values(10, 'test', 'seoul');

-- 컬럼의 제약 정의는 컬럼 정의를 하면서 컬럼 옆에 정의
-- 컬럼의 타입을 모두 정의하고, 아래에 제약을 정의하는 방법

create table emp02 (
    empno number(4) not null,
    ename varchar2(10) not null,
    job varchar2(9),
    deptno number(2)
);

insert into emp02 values(null, null, 'MANAGER', 10);
insert into emp02 values(1111, null, 'MANAGER', 10);
insert into emp02 values(1111, 'SON', 'MANAGER', 10);
select * from emp02;

create table emp03(
    empno number(4) unique,
    ename varchar2(10) not null,
    job varchar2(10),
    deptno number(2)
);

desc emp03; 
insert into emp03 values(1111, 'TEST', 'MANAGER', 10);
insert into emp03 values(1111, 'TEST123', 'MANAGER', 20);
insert into emp03 values(NULL, 'TEST123', 'MANAGER', 20);
