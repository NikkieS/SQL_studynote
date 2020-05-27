create table dept01(
    deptno number(2),
    dname varchar2(14),
    loc varchar2(13)
);

-- 입력 방식
-- 행단위 입력 : insert into 테이블이름 (입력하고자 하는 컬럼들) values (데이터들)
-- 입력 컬럼의 순서와 입력데이터의 순서는 같아야 한다.
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