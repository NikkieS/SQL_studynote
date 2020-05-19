
-- Ư�� �����͸� �����ϱ� : where ���� �̿�
-- select �÷� �� from ���̺� �̸� where ���� (true/false)

-- ��ü ������� �� �޿��� 3000�̻��� ����� ����Ʈ
select * from emp where sal >= 3000;

-- ��ü ����� 10�� �μ��� �Ҽ� ����� �̸��� ������ ���
select ename, job from emp where deptno = 10;

select * from emp where ename = 'SCOTT';

-- �������� : and
-- ������ Manager�� ����� �˻��Ͽ� �����, �μ���ȣ, ������ ���
select ename, deptno, job from emp where deptno = 10 and job = 'MANAGER';

-- �������� : or
-- 10�� �μ��� �Ҽӵ� ����̰ų� ������ MANAGER�� ����� �˻��Ͽ� �����, �μ���ȣ, ������ ���
select ename, deptno, job from emp where deptno = 10 or job = 'MANAGER';

-- �������� : and / between
-- 2000���� 3000 ������ �޿��� �޴� ����� ������ ���
select * from emp where sal >= 2000 and sal <= 3000;
select * from emp where sal between 2000 and 3000;

-- between : ~ �̻� ~ ���� ������ ���� (�̸� �ʰ��� �Ұ���)
select * from emp 
-- where sal > 2000 and sal < 3000;
where sal between 2001 and 2999;

-- 1981�� �Ի��� ����Ʈ�� ���
select * from emp where hiredate >= '1981-01-01' and hiredate <= '1981-12-31';
select * from emp where hiredate between '1981-01-01' and '1981-12-31';

-- in ������ & or ������
-- �÷� �̸� in(������, ������, ������, ...)
-- �÷�=������1 or �÷�=������2 or �÷�=������3, or ...
select * from emp where job in('SALESMAN', 'MANAGER', 'ALAYST');
select * from emp where job='SALESMAN' or job='MANAGER' or job='ALAYST';

-- Ŀ�̼��� 300�̰ų� 500�̰ų� 1400�� ����� ���
select * from emp where comm in(300, 500, 1400);

-- ���� �˻� : like
-- �÷��̸� like ����
-- ���� : %, _
-- % : 0���̻� ���ڿ��� �����ϴ� 
select * from emp where ename like 'S%';    -- ù���� ����
select * from emp where ename like '%S';    -- ������ ����
select * from emp where ename like '%S%';   -- ����

-- _ : 1���� ��� ���ڰ� �͵� �����ϴ�
select * from emp where ename like '__A%';  -- 3��° ���� ����

-- row�� ����
-- �������� : asc(��������, �⺻ ��)
-- �������� : desc(����� ���)
select ename, sal, hiredate, comm from emp
-- order by ename asc;
-- order by ename desc;
order by hiredate asc;