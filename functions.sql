-- 숫자 함수
select mod(10, 3) from dual;    -- 나머지
select mod(sal, 3) from emp;

select abs(-10) from dual;      -- 절대값
select abs(sal) from emp;

select trunc(1282.238273, -2) from dual;    -- 절사 (양수 값 : 소숫점, 음수 값 : 정수)
select trunc(sal, -1) from emp;

select round(1282.238273, 2) from dual;     -- 반올림 (양수 값 : 소숫점, 음수 값 : 정수)

-- 문자 함수
select concat(ename, job) from emp; -- 문자 연결
select substr(job, 3) from emp;     -- 문자 추출 (컬럼, 시작 자리수)
select trim('#! ' FROM '    #SQL Tutorial!    ') from dual;
select sysdate from dual;           -- 시스템 현재 날짜 반환

select to_char(sysdate, 'YYYY.MM.DD. HH24:MI') from dual;
select to_char(12500, '000,000') from dual;     -- 012,500 : 0으로 채워줌
select to_char(12500, '999,999') from dual;     -- _12,500 : 빈자리로 채워줌
select to_char(12500, 'L999,999') from dual;    -- L : ￦ 원화 표시
select to_char(3.14, '000,000.000') from dual;
select to_char(3.141592, '999,999.999') from dual;  -- 자동 반올림
select initcap(ename), sal, to_char(sal*1000, 'L999,999,999') as wonsal, to_char(sal*12*1000+nvl(comm, 0), 'L999,999,999') as annSal from emp order by annsal desc;

-- to_date(원본, 패턴) : str -> date
select to_date('19810220', 'YYYY/MM/DD') from dual;
select sysdate, to_date('20201225', 'YYYYMMDD'), trunc(to_date('20201225', 'YYYYMMDD')- sysdate) from dual;
select trunc(sysdate-to_date('19940405', 'YYYYMMDD')) as daysofliving from dual;

-- to_number(원본, 패턴) : str -> number
select to_number('20,000', '999,999')- to_number('10,000', '999,999') as strtonum from dual;

-- decode(컬럼, 조건1, 결과1, 조건2, 결과2, 조건3, 결과3, ...) : if switch 구문과 유사
select ename, deptno, 
decode(deptno, 10, 'ACCOUNTING', 20, 'RESEARCH', 30, 'SALES', 40, 'OPERATIONS') as dname 
from emp;
-- ex) 직급에 따른 급여 인상
select empno, ename, job, sal, 
trunc(decode(job, 'ANALYST', sal*1.05, 'SALESMAN', sal*1.1,'MANAGER', sal*1.15, 'CLERK', sal*1.2), 0) as upsal
from emp order by upsal asc;

-- case when 조건1 then 결과1, when 조건 2 then 결과2, ... else 결과n end : if else 구문과 유사
select ename, job, deptno, case when deptno = 10 then 'ACCOUNTING' when deptno = 20 then 'RESEARCH'
when deptno = 30 then 'SALES' when deptno = 40 then 'OPERATIONS' end as dname 
from emp order by deptno;