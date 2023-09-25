/*
���� 1.
-EMPLOYEES ���̺��, DEPARTMENTS ���̺��� DEPARTMENT_ID�� ����Ǿ� �ֽ��ϴ�.
-EMPLOYEES, DEPARTMENTS ���̺��� ������� �̿��ؼ�
���� INNER , LEFT OUTER, RIGHT OUTER, FULL OUTER ���� �ϼ���. (�޶����� ���� ���� �ּ����� �ۼ�)
*/
SELECT
    *
FROM employees e INNER JOIN departments d
ON e.department_id = d.department_id; -- INNER 106��

SELECT
    *
FROM employees e LEFT OUTER JOIN departments d
ON e.department_id = d.department_id; -- LEFT OUTER 107��

SELECT
    *
FROM employees e RIGHT OUTER JOIN departments d
ON e.department_id = d.department_id; -- RIGHT OUTER 122��

SELECT
    *
FROM employees e FULL OUTER JOIN departments d
ON e.department_id = d.department_id; -- FULL OUTER 123��
/*
���� 2.
-EMPLOYEES, DEPARTMENTS ���̺��� INNER JOIN�ϼ���
����)employee_id�� 200�� ����� �̸�, department_id�� ����ϼ���
����)�̸� �÷��� first_name�� last_name�� ���ļ� ����մϴ�
*/
SELECT
    CONCAT(e.first_name, e.last_name) AS name,
    d.department_name
FROM employees e 
JOIN departments d -- INNER ��������
ON e.department_id = d.department_id
WHERE e.employee_id = 200;

/*
���� 3.
-EMPLOYEES, JOBS���̺��� INNER JOIN�ϼ���
����) ��� ����� �̸��� �������̵�, ���� Ÿ��Ʋ�� ����ϰ�, �̸� �������� �������� ����
HINT) � �÷����� ���� ����Ǿ� �ִ��� Ȯ��
*/
SELECT
    CONCAT(e.first_name, e.last_name),
    e.job_id,
    j.job_title
FROM employees e 
JOIN jobs j -- INNER ��������
ON e.job_id = j.job_id
ORDER BY e.first_name ASC;

/*
���� 4.
--JOBS���̺�� JOB_HISTORY���̺��� LEFT_OUTER JOIN �ϼ���.
*/
SELECT
    *
FROM jobs j 
LEFT JOIN job_history jh -- OUTER ��������
ON j.job_id = jh.job_id;
/*
���� 5.
--Steven King�� �μ����� ����ϼ���.
*/
SELECT
    e.first_name || '' || e.last_name AS ful_name,
    d.department_name
FROM employees e 
JOIN departments d
ON e.department_id = d.department_id
WHERE e.first_name = 'Steven'
AND e.last_name = 'King';
/*
���� 6.
--EMPLOYEES ���̺�� DEPARTMENTS ���̺��� Cartesian Product(Cross join)ó���ϼ���
*/
SELECT * FROM employees e
CROSS JOIN departments d;

SELECT * FROM employees, departments;
/*
���� 7.
--EMPLOYEES ���̺�� DEPARTMENTS ���̺��� �μ���ȣ�� �����ϰ� JOB_ID (SA_MAN) ������� �����ȣ, �̸�, 
�޿�, �μ���, �ٹ����� ����ϼ���. (Alias�� ���)
*/
SELECT
    e.employee_id AS �����ȣ,
    e.first_name || '' || e.last_name AS �̸�,
    e.salary AS �޿�,
    d.department_id AS �μ���,
    loc.city AS �ٹ���
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
JOIN locations loc
ON d.location_id = loc.location_id
WHERE e.job_id = 'SA_MAN';
/*
���� 8.
-- employees, jobs ���̺��� ���� �����ϰ� job_title�� 'Stock Manager', 'Stock Clerk'�� 
���� ������ ����ϼ���.
*/
SELECT
    *
FROM employees e
JOIN jobs j
ON e.job_id = j.job_id
WHERE job_title IN('Stock Manager', 'Stock Clerk');
/*
���� 9.
-- departments ���̺��� ������ ���� �μ��� ã�� ����ϼ���. LEFT OUTER JOIN ��� NULL
*/
SELECT
    d.department_name
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id
WHERE e.employee_id IS NULL;
/*
���� 10. 
-join�� �̿��ؼ� ����� �̸��� �� ����� �Ŵ��� �̸��� ����ϼ��� SELF_JOIN
��Ʈ) EMPLOYEES ���̺�� EMPLOYEES ���̺��� �����ϼ���.
*/
SELECT
    e1.first_name,
    e2.first_name AS manager_name
FROM employees e1
JOIN employees e2
ON e1.manager_id = e2.employee_id;
/*
���� 11. 
-- EMPLOYEES ���̺��� left join�Ͽ� ������(�Ŵ���)id��, �Ŵ����� �̸�, �Ŵ����� �޿� ���� ����ϼ��� SELF JOIN
-- �Ŵ��� ���̵� ���� ����� �����ϰ� �޿��� �������� �����ϼ���
*/
SELECT
    e1.employee_id, e1.first_name, e1.manager_id,
    e2.first_name AS manager_name, e2.salary
FROM employees e1
LEFT JOIN employees e2
ON e1.manager_id = e2.employee_id
WHERE e1.manager_id IS NOT NULL
ORDER BY e1.salary DESC;