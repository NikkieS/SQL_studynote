-- report

create table report(
    idx number(4) primary key,
    sname varchar2(20) not null,
    stn varchar(20) not null,
    reportfile varchar2(100) not null
);

create sequence report_seq;

insert into report values (REPORT_SEQ.nextval, '손흥민', '1234', '/file/123456789_report.ppt');

select * from report;