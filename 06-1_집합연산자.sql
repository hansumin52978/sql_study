
-- ���� ������
-- ���� ���� ���� ����� ����� �ϳ��� ����, ��, ���̸� ���� �� �ְ� �� �ִ� ������
-- UNION(������ �ߺ�x), UNION ALL(������ �ߺ� o), INTERSECT(������), MINUS(������)
-- �� �Ʒ� column ������ ������ Ÿ���� ��Ȯ�� ��ġ�ؾ� �մϴ�.

-- UNION �����ڴ� �� �� �̻��� SELECT ���� ����� �����Ͽ� �ϳ��� ��� �������� ����ϴ�.
-- �ߺ��� ���� ���ŵǰ� ��� ������ ���ĵ˴ϴ�.
SELECT
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%'
UNION
SELECT
    employee_id, first_name
FROM employees
WHERE department_id = 20;

--  UNION ALL �����ڴ� �� �� �̻��� SELECT ���� ����� �����Ͽ� �ϳ��� ��� �������� ����ϴ�.
-- �ߺ��� ���� ���ŵ��� ������ ��� ������ ������ SELECT ���� ������ �����ϴ�.
SELECT
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%'
UNION ALL
SELECT
    employee_id, first_name
FROM employees
WHERE department_id = 20;

-- INTERSECT
-- INTERSECT �����ڴ� �� �� �̻����� SELECT ���� ��� ���տ��� ����� �ุ ��ȯ�˴ϴ�.
-- ��� ������ ���ĵ˴ϴ�.
SELECT
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%'
INTERSECT
SELECT
    employee_id, first_name
FROM employees
WHERE department_id = 20;

-- MINUS
-- MINUS �����ڴ� ù ��° SELECT ���� ��� ���տ��� �� ��° SELECT ���� ��� ���հ� �ߺ��Ǵ� ���� ������ �� ��ȯ�մϴ�.
-- ��� ������ ���ĵ˴ϴ�.
-- A-B ������
SELECT
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%' -- A
MINUS
SELECT
    employee_id, first_name
FROM employees
WHERE department_id = 20; -- B

-- B-A ������
SELECT
    employee_id, first_name
FROM employees
WHERE department_id = 20 -- B
MINUS
SELECT
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%'; -- A

