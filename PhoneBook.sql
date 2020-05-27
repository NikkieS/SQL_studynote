-- 전화번호 관리 프로그램

-- 이름, 전화번호, 생일, 이메일
-- 전공, 학년
-- 부서이름, 직급
-- 모임이름, 닉네임
-- 대리키 : 일련번호 -> p_idx / member_idx

-- 전화번호 부(Contact)

create table phonebook(
    pIdx number(4)  constraint phonebook_pidx_pk primary key,
    pName varchar2(10) constraint phonebook_pname_nn not null,
    pNum varchar2(20) constraint phoenbook_pnum_nn not null,
    pAdd varchar2(20) default 'SEOUL' constraint phonebook_padd_nn not null,
    pEmail varchar2(20) default 'aia@aia.com' constraint phonebook_pemail_nn not null,
    
    pType varchar2(4) constraint phonebook_ptype_ck check(ptype in ('univ', 'com', 'cafe')),
    puMajor varchar2(20),
    puYear number(1) constraint phonebook_puYear_ck check(puYear between 1 and 4),
    
    pcomName varchar2(20),
    pcomDept varchar2(20),
    pcomJob varchar2(20),
    
    pcafeName varchar2(20),
    pcafeNickname varchar2(20)
);

create table phoneInfo_basic(
    idx number(6) constraint phoneInfo_basic_idx_pk primary key,
    fr_name varchar2(20) constraint fr_name_nn not null,
    fr_phonenumber varchar2(20) constraint fr_phonenumber_nn not null,
    fr_email varchar2(20),
    fr_address varchar2(20),
    fr_regdate date default sysdate
);

create table phoneInfo_uni(
    idx number(6) constraint phoneInfo_uni_idx_pk primary key,
    fr_u_major varchar2(20) default 'N' constraint fr_u_major_nn not null,
    fr_u_year number(1) default 1,
    constraint fr_u_year_ck check(fr_u_year between 1 and 4),
    fr_ref number(6),
    constraint fr_ref_fk foreign key(fr_ref) references phoneInfo_basic(idx)
);

create table phoneInfo_com(
    idx number(6) constraint phoneInfo_com_idx_pk primary key,
    fr_c_company varchar2(20) default 'N' constraint fr_c_company_nn not null,
    fr_ref number(6),
    constraint comfr_ref_fk foreign key(fr_ref) references phoneInfo_basic(idx)
);

desc phoneInfo_basic;
desc phoneInfo_uni;
desc phoneInfo_com;

select * from user_constraints where table_name='PHONEINFO_COM';

alter table phoneInfo_uni
modify (fr_ref number(6));

-- 기본정보 입력
insert into phonebook (pidx, pname, pnum, padd, pemail, ptype)
values (1, 'scott', '010-9999-1234', 'SEOUL', 'scott@gmail.com', 'univ');

-- default 입력 처리 (padd, pemail)
insert into phonebook (pidx, pname, pnum, ptype)
values (2, 'king', '010-7777-1234', 'univ');

-- 대학 친구 정보 입력
insert into phonebook(pidx, pname, pnum, padd, pemail, ptype, pumajor, puyear)
values(3, 'rain', '010-1111-1234', 'TOKYO', 'rain@gmail.com', 'univ', 'rainism', 3);

-- 회사 친구 정보 입력
insert into phonebook (pidx, pname, pnum, padd, pemail, ptype)
values (4, 'park', '010-8888-1234', 'LONDON', 'park@gmail.com', 'com');

-- 모임 친구 정보 입력
insert into phonebook (pidx, pname, pnum, padd, pemail, ptype, pcafename, pcafenickname)
values (5, 'son', '010-6666-1234', 'NEW YORK', 'son@gmail.com', 'cafe', 'aia', 'coding');

select * from phonebook;

-- phoneInfo_basic
-- default
insert into phoneInfo_basic(idx, fr_name, fr_phonenumber, fr_email, fr_address, fr_regdate)
values (1, 'A', '010-1111-1234', 'a@gmail.com', 'SEOUL', '1994-04-05');
-- reg date X
insert into phoneInfo_basic(idx, fr_name, fr_phonenumber, fr_email, fr_address)
values (2, 'B', '010-2222-1234', 'b@gmail.com', 'TOKYO');
-- reg date X, email X
insert into phoneInfo_basic(idx, fr_name, fr_phonenumber, fr_address)
values (3, 'C', '010-3333-1234', 'NEW YORK');
-- reg date X, email X, add X
insert into phoneInfo_basic(idx, fr_name, fr_phonenumber)
values (4, 'D', '010-4444-1234');

-- phoneInfo_uni
-- default
insert into phoneInfo_uni(idx, fr_u_major, fr_u_year)
values (5, 'BUSINESS', 3);
-- year X
insert into phoneInfo_uni(idx, fr_u_major)
values (6, 'PHYSICS');
-- major X
insert into phoneInfo_uni(idx, fr_u_year)
values (7, 2);
-- year X, major X
insert into phoneInfo_uni(idx)
values (8);
-- ref
insert into phoneInfo_uni(idx, fr_ref)
values (9, 1);

--phoneInfo_com
-- default
insert into phoneInfo_com values(1, 'SAMSUNG', 3);
-- ref
insert into phoneInfo_com(idx, fr_c_company, fr_ref)
values(2, 'LG', 2);
insert into phoneInfo_com(idx, fr_ref)
values(3, 4);

-- 전체 친구 목록 출력 :
select * 
from phoneInfo_basic b, phoneInfo_uni u, phoneInfo_com c
where b.idx=u.fr_ref(+) and b.idx=c.fr_ref(+);

-- 학교 친구 목록 출력 :
select * 
from phoneInfo_basic b, phoneInfo_uni u
where b.idx=u.fr_ref(+);

-- 회사 친구 목록 출력
select * 
from phoneInfo_basic b, phoneInfo_com c
where b.idx=c.fr_ref(+);