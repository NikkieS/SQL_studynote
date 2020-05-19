
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
-- between : ~ �̻� ~ ���� ������ ���� (�̸� �ʰ��� �Ұ���)
-- 2000���� 3000 ������ �޿��� �޴� ����� ������ ���
select * from emp where sal >= 2000 and sal <= 3000;
select * from emp where sal between 2000 and 3000;