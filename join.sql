select * from emp, dept;

select * from emp, dept where emp.deptno = dept.deptno;
select ename, dname from emp e, dept d where e.deptno = d.deptno;

select * from orders o, book b, customer c where o.bookid = b.bookid and o.custid = c.custid;

-- 박지성의 총 구매금액을 출력
select sum(saleprice) from orders o, customer c where c.name = '박지성';

select s.losal, e.sal, s.hisal from emp e, salgrade s where e.sal >= s.losal and e.sal <= s.hisal;

select ename, sal, grade from emp e, salgrade s where e.sal >= s.losal and e.sal <= s.hisal;

-- 관리자의 이름을 알아보자
select * from emp e, emp m where e.mgr = m.empno;

-- outer join : null 값도 표기 (+)
-- LEFT/ RIGHT/ FULL outer join
select e.ename || '의 상사는 ' || nvl(m.ename, '관리자 없음') || '입니다.' from emp e, emp m where e.mgr = m.empno (+);
select * from emp e left outer join emp m on e.mgr=m.empno;

-- inner join : 테이블1 inner join 테이블2 on 조건1 = 조건2 (where ...)
select ename, dname from emp inner join dept on emp.deptno=dept.deptno;

-- using : 조건을 연산자로 비교하지 않고 컬럼명 자체로 정의
select emp.ename, dept.dname from emp inner join dept using (deptno);

-- natural join : 존재하는 같은 컬럼으로 조인
select emp.ename, dept.dname from emp natural join dept;

