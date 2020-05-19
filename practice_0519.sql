-- 1.
select ename, sal, sal+300 as addSal from emp;

-- 2.
select ename, sal, sal*12+100 as Income from emp order by Income desc;

-- 3.
select ename, sal from emp where sal >= 2000 order by sal desc;

-- 4.
select ename, deptno from emp where empno=7788;

-- 5.
select ename, sal from emp where not sal between 2000 and 3000;

-- 6.
select ename, job, hiredate from emp where hiredate between '1981-02-20' and '1981-05-01';

-- 7.
select ename, deptno from emp where deptno between 20 and 30 order by ename desc;
select ename, deptno from emp where deptno in(20, 30) order by ename desc;

-- 8.
select ename, sal, deptno from emp where sal between 2000 and 3000 and deptno in(20, 30) order by ename asc;

-- 9.
select ename, hiredate from emp where hiredate like '81%';

-- 10.
select ename, job from emp where mgr is null;

-- 11.
select ename, sal, comm from emp where comm is not null order by sal desc, comm desc;

-- 12.
select ename from emp where ename like '__R%';

-- 13.
select ename from emp where ename like '%A%' and ename like '%E%';

-- 14.
select ename, job, sal from emp where job in('CLERK', 'SALESMAN') and not sal in(1600, 950, 1300);

-- 15.
select ename, sal, comm from emp where comm>=500;