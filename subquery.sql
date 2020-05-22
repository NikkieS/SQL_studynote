-- 서브쿼리
-- 1. Main 쿼리 먼저 작성
-- 2. Sub 쿼리 작성 후 삽입
select avg(sal) from emp;   -- 평균 급여
select ename, sal from emp where sal>(select avg(sal) from emp);

select * from emp where deptno = (select deptno from emp where ename = 'SCOTT');

-- 다중 행 : 결과가 2개 이상 구해지는 쿼리문
-- 3000이상 받는 사원이 소속된 부서에 근무하는 사원의 이름, 급여, 소속부서 출력
select distinct deptno from emp where sal >= 3000;  -- 급여 3000 이상 부서 : 20, 10 (2개)
select ename, sal, deptno from emp where deptno in (select distinct deptno from emp where sal >= 3000);

-- ALL 연산자 : 메인 쿼리의 비교 조건이 서브 쿼리의 모든 데이터와 비교하여 일치하면 참
-- > all : 최대값
-- 30번 부서 사원들 중 급여를 가장 많이 받는 사원보다 더 많은 급여를 받는 사람의 이름, 급여 출력
select max(sal) from emp where deptno = 30;
select ename, sal from emp where sal > (select max(sal) from emp where deptno = 30);
select ename, sal from emp where sal > all(select sal from emp where deptno = 30);  -- 30번 부서 모든 사원의 급여보다 클 때 참 -> 최대값

-- ANY 연산자 : 메인 쿼리의 비교 조건이 서브 쿼리의 데이터 하나 이상만 일치하면 참
-- > any : 최소값
-- 30번 부서 사원들 중 가장 작은 급여를(950) 받는 사원보다 더 많은 급여를 받는 사람의 이름, 급여 출력
select ename, sal from emp where sal > (select min(sal) from emp where deptno = 30);    -- min 사용 비교
select ename, sal from emp where sal > any(select sal from emp where deptno = 30);      -- any 사용 비교

-- 스칼라 select 부속질의 : 
-- 구매자의 id, 이름, 총 구매가격 출력
select o.custid, name, sum(saleprice) from orders o, customer c where o.custid=c.custid group by o.custid, name;

select custid, 
(select name from customer c where o.custid=c.custid) as custom_name, 
sum(saleprice) 
from orders o group by custid;

-- 인라인 뷰 from 부속질의 :
-- 고객번호가 2 이하인 고객의 총 구매가격 출력
select * from customer where custid <= 2;   -- 고객번호 2 이하
select name from customer cs, orders od where cs.custid=od.custid group by cs.name; -- 전체 고객

select name, sum(saleprice) as total 
from (select custid, name from customer where custid <= 2) c, orders o 
where c.custid=o.custid group by name;

-- rownum 급여 3위
select rownum, ename, sal
from (select ename, empno, job, deptno, sal from emp order by sal desc)
where rownum<=3;

-- 평균 주문금액 이하의 주문에 대해서 주문번호와 금액을 출력
select avg(saleprice) from orders;  -- 평균 주문금액
select orderid, saleprice from orders where saleprice <= (select avg(saleprice) from orders);
-- 각 고객의 평균 주문금액보다 큰 금액의 주문 내역에 대해서 주문번호, 고객번호, 금액을 출력
select c.name, avg(saleprice) from customer c, orders o where c.custid = o.custid group by c.name;  -- 각 고객의 평균 주문금액

select orderid, custid, saleprice 
from orders 
where saleprice > (select avg(saleprice) from customer c, orders o where c.custid = o.custid);

-- in, not in :
-- 대한민국에 거주하는 고객에게 판매한 도서의 총판매액을 출력
select custid from customer where address like '%대한민국%';

select sum(saleprice) as total
from orders
where custid in (select custid from customer where address like '%대한민국%');
-- 미국 거주 고객에게 판매한 도서의 판매액만 제외한 총판매액 출력
select sum(saleprice) from orders where custid not in (select custid from customer where address like '%미국%');

-- 3번 고객이 주문한 도서의 최고 금액보다 더 비싼 도서를 구입한 주문번화와 금액을 출력
select max(saleprice) from orders where custid=3;
select orderid, saleprice from orders where saleprice > all(select saleprice from orders where custid=3);

-- exists : 존재 유무 확인
-- 대한민국에 거주하는 고객에게 판매한 도서의 총 판매액을 출력
select sum(saleprice) from orders o 
where exists(select * from customer c where address like '%대한민국%' and c.custid=o.custid);ㅠ