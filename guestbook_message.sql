-- 방명록 테이블

create table guestbook_message(
    message_id number(4) PRIMARY key,
    guest_name varchar2(50) not null,
    password varchar2(10) not null,
    message varchar2(2000) not null
);

create sequence message_id_seq increment by 1 start with 1;

insert into guestbook_message values (message_id_seq.nextVal, '테스터01', '1111', '글쓰기 테스트.');
insert into guestbook_message values (message_id_seq.nextVal, '테스터02', '1111', '글쓰기 테스트.');
insert into guestbook_message values (message_id_seq.nextVal, '테스터03', '1111', '글쓰기 테스트.');
insert into guestbook_message values (message_id_seq.nextVal, '테스터04', '1111', '글쓰기 테스트.');
insert into guestbook_message values (message_id_seq.nextVal, '테스터05', '1111', '글쓰기 테스트.');
insert into guestbook_message values (message_id_seq.nextVal, '테스터06', '1111', '글쓰기 테스트.');
insert into guestbook_message values (message_id_seq.nextVal, '테스터07', '1111', '글쓰기 테스트.');
insert into guestbook_message values (message_id_seq.nextVal, '테스터08', '1111', '글쓰기 테스트.');
insert into guestbook_message values (message_id_seq.nextVal, '테스터09', '1111', '글쓰기 테스트.');
insert into guestbook_message values (message_id_seq.nextVal, '테스터10', '1111', '글쓰기 테스트.');

delete from guestbook_message;
select * from guestbook_message order by message_id desc;
select count(*) from guestbook_message;

-- 순차적 나열 rownum
select rownum, message_id, guest_name, password, message 
from guestbook_message 
order by message_id desc;

-- inline view subquery
select rownum, message_id, guest_name, password, message 
from (
    select * from guestbook_message order by guestbook_message.message_id desc
);

-- 1~2page : 1~6번째
select rownum rnum, message_id, guest_name, password, message 
from (
    select * from guestbook_message order by guestbook_message.message_id desc
)
where rownum <=6;

-- 2page : 4~6번째
select message_id, guest_name, password, message
from (
    select rownum rnum, message_id, guest_name, password, message 
    from (
        select * from guestbook_message order by guestbook_message.message_id desc
    )
    where rownum <=6    -- 마지막 row
)
where rnum >=4;         -- 시작 row

select ROWNUM, message_id, message from guestbook_message;

select rownum, message_id, message from (select * from guestbook_message m order by m.message_id desc);

select * from guestbook_message where message_id=10;

