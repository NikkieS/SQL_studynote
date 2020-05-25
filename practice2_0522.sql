select * from customer c, orders o, book b where c.custid=o.custid and o.bookid=b.bookid;

-- 1 마당서점의고객이요구하는다음질문에대해SQL 문을작성하시오.
-- (5) 박지성이구매한도서의출판사수
select bookid from customer natural join orders where name='박지성';

select count(distinct publisher) as numofpublisher 
from book 
where bookid in (select distinct bookid from customer natural join orders where name='박지성');

select count(distinct publisher) as numofpublisher
from customer c, orders o, book b 
where c.custid=o.custid and o.bookid=b.bookid and c.name='박지성';      -- 통합 테이블

-- (6) 박지성이구매한도서의이름, 가격, 정가와판매가격의차이
select bookname, price, price - (select saleprice from orders o where o.bookid=b.bookid) as diff 
from book b
where bookid in (select bookid from customer natural join orders where name='박지성');

select b.bookname, b.price, b.price-o.saleprice as diff
from customer c, orders o, book b 
where c.custid=o.custid and o.bookid=b.bookid and c.name='박지성';     -- 통합 테이블 

-- (7) 박지성이구매하지않은도서의이름
select bookname 
from book 
where bookid not in (select bookid from customer natural join orders where name='박지성');

select b.bookname
from customer c, orders o, book b 
where c.custid=o.custid and o.bookid=b.bookid and c.name<>'박지성';

-- 2 마당서점의운영자와경영자가요구하는다음질문에대해SQL 문을작성하시오.
-- (8) 주문하지않은고객의이름(부속질의사용)
select custid from orders;  -- 주문한 고객

select name 
from customer 
where custid not in (select custid from orders);

select c.name 
from orders o, customer c 
where o.custid(+)=c.custid and o.orderid is null;

-- (9) 주문금액의총액과주문의평균금액
select sum(saleprice), avg(saleprice) from orders;

-- (10) 고객의이름과고객별구매액
select c.name, sum(nvl(o.saleprice,0)) as total
from customer c full outer join orders o on c.custid=o.custid
group by c.name; 

-- (11) 고객의이름과 고객이구매한도서목록
select c.name, b.bookname 
from book b join orders o on b.bookid=o.bookid join customer c on c.custid=o.custid 
order by c.name;

-- (12) 도서의가격(Book 테이블)과판매가격(Orders 테이블)의차이가가장많은주문
select orderid, price-saleprice as diff
from book b, orders o where b.bookid=o.bookid
order by diff desc; -- 도서가격 - 판매가격 가장 많은 수 정렬

select *
from (select orderid, price-saleprice as diff from book b, orders o where b.bookid=o.bookid order by diff desc)
where rownum=1; -- 첫번째

-- (13) 도서의 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름
select avg(saleprice) 
from orders;   -- 도서 평균 판매액

select c.name, avg(saleprice) as purchase
from customer c natural join orders o
group by c.name;    -- 구매자 평균 구매 금액

select name 
from (select c.name, avg(saleprice) as purchase
from customer c natural join orders o
group by c.name)
where purchase > (select avg(saleprice) from orders);

-- 3. 마당서점에서 다음의 심화된 질문에 대해 SQL 문을 작성하시오.
-- (1) 박지성이 구매한 도서의 출판사와 같은 출판사에서 도서를 구매한 고객의 이름
-- 총 테이블
select * 
from book b join orders o on b.bookid=o.bookid join customer c on c.custid=o.custid;

-- 박지성 id
select custid 
from customer 
where name='박지성';

-- 박지성이 구매한 도서의 출판사
select publisher 
from book b natural join orders o 
where custid=(select custid from customer where name='박지성');

-- 박지성이 구매한 도서의 출판사 출판 도서를 구매한 고객의 이름
select c.name 
from book b join orders o on b.bookid=o.bookid join customer c on c.custid=o.custid
where b.publisher in(select publisher from book b natural join orders o where custid=(select custid from customer where name='박지성')) 
and c.name<>'박지성';

-- (2) 두 개 이상의 서로 다른 출판사에서 도서를 구매한 고객의 이름
select c.name 
from book b join orders o on b.bookid=o.bookid join customer c on c.custid=o.custid 
group by c.name having count(distinct(publisher))>=2;
