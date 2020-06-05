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

-- || : �ϼ� �������� ��� (�÷��� ���ڿ� ���̿� ����)
-- initcap() : ù���� �빮�� ��ȯ
-- upper() : �빮�� ��ȯ
-- lower() : �ҹ��� ��ȯ
select initcap(ename) || ' is a ' || lower(job) || '.' as JobDesc from emp;

-- distinct : �ߺ� �� ���� �� ���
select deptno from emp;
select distinct deptno from emp;

select * from phonebook;

create sequence phonebook_pidx_seq
start with 6
minvalue 0;

insert into phoneInfo_basic(idx, fr_name, fr_phonenumber, fr_email, fr_address, fr_regdate)
values (pb_basic_idx_seq.nextval, 'A', '010-1111-1234', 'a@gmail.com', 'SEOUL', '1994-04-05');