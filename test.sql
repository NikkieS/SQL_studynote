select * from emp order by sal desc;

select * from dept;

select job, sal, empno from emp;

-- emp : �������
-- dept : �μ�����
-- bonus : �ӽ����̺�
-- salgrade : �޿� ���̺�

-- ���̺��� ���� Ȯ�� : desc ���̺��̸�
desc emp;
desc dept;
desc salgrade;

select * from emp;
select * from dept;

select deptno from dept;

-- nvl �Լ� : null�� ���갡�� ������ ġȯ
-- nvl(�÷���, �⺻��) : �⺻���� �÷��� �������� �ڷ����� ���ƾ� �Ѵ�
select ename, sal, job, comm, sal*12, sal*12+comm from emp;
select ename, sal, job, comm, sal*12+comm, nvl(comm, 0), sal*12+nvl(comm, 0) from emp;

-- as : �÷� ��Ī���� ���
select ename, sal*12+nvl(comm, 0) as AnnSal from emp;

-- || : �ϼ� �������� ���
select ename || ' is a ' || job as JobDesc from emp;

-- distinct : �ߺ� �� ���� �� ���
select deptno from emp;
select distinct deptno from emp;