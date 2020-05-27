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

-- =============================================================
-- create or replace : 변경 사항이 있을때 상시 변경 가능
-- =============================================================
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

-- =============================================================
-- SEQUENCE : 번호 자동 생성기
-- =============================================================
-- create sequence 시퀀스 이름 
-- start with n
-- increment by n
-- maxvalue n
-- minvalue n
-- cycle | nocycle 반복 여부
-- cache | nocache 메모리상 시퀀스 값 관리
create sequence dept_deptno_seq01;

select dept_deptno_seq01.nextval
from dual;

select dept_deptno_seq01.currval
from dual;

-- 1. basic 테이블 seq
create sequence pb_basic_idx_seq
start with 0
minvalue 0;

-- 2. uni 테이블 seq
create sequence pb_uni_idx_seq
start with 0
minvalue 0;

-- 3. com 테이블 seq
create sequence pb_com_idx_seq
start with 0
minvalue 0;

insert into phoneInfo_basic(idx, fr_name, fr_phonenumber, fr_email, fr_address, fr_regdate)
values (pb_basic_idx_seq.nextval, 'A', '010-1111-1234', 'a@gmail.com', 'SEOUL', '1994-04-05');

insert into phoneInfo_uni(idx, fr_u_major, fr_u_year, fr_ref)
values (PB_UNI_IDX_SEQ.nextval, 'BUSINESS', 3, pb_basic_idx_seq.currval);

insert into phoneInfo_com values(PB_COM_IDX_SEQ.nextval, 'SAMSUNG', PB_BASIC_IDX_SEQ.currval);