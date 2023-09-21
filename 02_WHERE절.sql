
SELECT * FROM employees;

-- WHERE�� �� (������ ���� ��/�ҹ��ڸ� �����մϴ�.)
SELECT first_name, last_name, job_id
FROM employees
WHERE job_id = 'IT_PROG'; -- ���ǿ� ����ϴ� �����Ͱ��� ��ҹ��ڸ� �ݵ�� ��������Ѵ�.

SELECT * FROM employees
WHERE last_name = 'King';

SELECT *
FROM employees
WHERE department_id = 2050;

SELECT *
    FROM employees
WHERE salary >= 15000
AND salary < 20000;

SELECT * FROM employees
WHERE hire_date = '04/01/30';

-- ������ �� ����
-- BETWEEN ������: WHERE�������� BETWEEN �����ڸ� ����Ͽ� ������ ������ �� �ֽ��ϴ�.
SELECT * FROM employees
WHERE salary BETWEEN 15000 AND 20000;

SELECT * FROM employees
WHERE hire_date BETWEEN '03/01/01' AND '03/12/31';

-- IN �������� ��� (Ư�� ����� ���� �� ���)
-- IN ������: WHERE�������� IN �����ڸ� ����Ͽ� ���� ���� ���� ���� �� �ֽ��ϴ�.
SELECT * FROM employees
WHERE manager_id IN (100, 101, 102);

SELECT * FROM employees
WHERE job_id IN ('IT_PROG', 'AD_VP');

-- LIKE ������
-- %�� ��� ���ڵ�, _�� �������� �ڸ�(��ġ)�� ã�Ƴ� ��
-- LIKE ������: WHERE�������� LIKE �����ڸ� ����Ͽ� ���ڿ� ������ �˻��� �� �ֽ��ϴ�.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '03%'; -- 03�� ������ �������� �ڿ� ��� �����͵� �ҷ��� �� ����.

SELECT first_name, hire_date
FROM employees
WHERE hire_date LIKE '%15'; -- 15�� ������ �������� �տ� ��� �����͵� �ҷ��� �� ����.

SELECT first_name, hire_date
FROM employees
WHERE hire_date LIKE '%05%'; -- 05�� ������ �������� ��� �����͵� �ҷ��� �� ����.

SELECT first_name, hire_date
FROM employees
WHERE hire_date LIKE '___05%'; -- ���� 05�� ���� ã�� �� WHY? 05�տ� ___�� �ٿ��� ���� _ �ϳ��� �Ѱ��� ���ڿ� ��ġ��.

-- IS NULL (null���� ã��)
-- IS NULL ������: �� �����ڴ� �ش� ���� ���� NULL�� ���� �����մϴ�.
SELECT * FROM employees
WHERE manager_id IS NULL;

SELECT * FROM employees
WHERE commission_pct IS NULL;

SELECT * FROM employees
WHERE commission_pct IS NOT NULL;

-- AND, OR
-- AND�� OR���� ���� ������ ����
SELECT * FROM employees
WHERE job_id = 'IT_PROG'
OR job_id = 'FI_MGR'
AND salary >= 6000;

SELECT * FROM employees
WHERE (job_id = 'IT_PROG'
OR job_id = 'FI_MGR')
AND salary >= 6000;

-- �������� ���� (SELECT ������ ���� �������� ��ġ�˴ϴ�.)
-- ASC : ascending ��������
-- DESC : descending ��������
SELECT * FROM employees
ORDER BY hire_date ASC;

SELECT * FROM employees
ORDER BY hire_date DESC;

SELECT * FROM employees
WHERE job_id = 'IT_PROG'
ORDER BY first_name ASC;

SELECT * FROM employees
WHERE salary >= 5000
ORDER BY employee_id DESC;

SELECT
    first_name,
    salary*12 AS pay -- salary�� 12�� ���� ���� ����.
FROM employees
ORDER BY pay ASC; -- ��Ī�� ������ ��.


