/*
���� 1.
-EMPLOYEES ���̺��� ��� ������� ��ձ޿����� ���� ������� �����͸� ��� �ϼ��� 
(AVG(�÷�) ���)
-EMPLOYEES ���̺��� ��� ������� ��ձ޿����� ���� ������� ���� ����ϼ���
-EMPLOYEES ���̺��� job_id�� IT_PROG�� ������� ��ձ޿����� ���� ������� 
�����͸� ����ϼ���
*/
SELECT *
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

SELECT COUNT(*)
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

SELECT *
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees
                 WHERE job_id = 'IT_PROG');

/*
���� 2.
-DEPARTMENTS���̺��� manager_id�� 100�� �μ��� �����ִ� �������
��� ������ ����ϼ���.
*/
SELECT * FROM employees
WHERE department_id = (SELECT department_id FROM departments
                        WHERE manager_id = '100');
/*
���� 3.
-EMPLOYEES���̺��� ��Pat���� manager_id���� ���� manager_id�� ���� ��� ����� �����͸� 
����ϼ���.
-EMPLOYEES���̺��� ��James��(2��)���� manager_id�� ���� ��� ����� �����͸� ����ϼ���.
*/
SELECT
    *
FROM employees
WHERE manager_id > (SELECT manager_id FROM employees
                    WHERE first_name = 'Pat');
                    
SELECT
    *
FROM employees
WHERE manager_id IN (SELECT manager_id FROM employees
                     WHERE first_name = 'James');

/*
���� 4.
-EMPLOYEES���̺� ���� first_name�������� �������� �����ϰ�, 41~50��° �������� 
�� ��ȣ, �̸��� ����ϼ���
*/
SELECT * FROM
    (
    SELECT ROWNUM AS rn, tbl.first_name
        FROM 
        (
            SELECT * FROM employees
            ORDER BY first_name DESC
        ) tbl
    )
WHERE rn BETWEEN 41 AND 50;

/*
���� 5.
-EMPLOYEES���̺��� hire_date�������� �������� �����ϰ�, 31~40��° �������� 
�� ��ȣ, ���id, �̸�, ��ȣ, �Ի����� ����ϼ���.
*/
SELECT * FROM
(
    SELECT ROWNUM AS rn, tbl.*
        FROM 
        (
            SELECT
                employee_id, first_name || '' || last_name, phone_number, hire_date
            FROM employees
            ORDER BY hire_date ASC
        ) tbl
    )
WHERE rn > 31 AND rn <= 40;

/*
���� 6.
employees���̺� departments���̺��� left �����ϼ���
����) �������̵�, �̸�(��, �̸�), �μ����̵�, �μ��� �� ����մϴ�.
����) �������̵� ���� �������� ����
*/
SELECT
    e.employee_id AS ����_���̵�,
    CONCAT(e.first_name, e.last_name) AS �̸�,
    e.department_id AS �μ�_���̵�,
    d.department_name AS �μ���
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id
ORDER BY employee_id ASC;

/*
���� 7.
���� 6�� ����� (��Į�� ����)�� �����ϰ� ��ȸ�ϼ���
*/
SELECT
    e.employee_id AS ����_���̵�,
    CONCAT(e.first_name, e.last_name) AS �̸�,
    e.department_id AS �μ�_���̵�,
    (
    SELECT
      department_name
    FROM departments d
    WHERE  d.department_id = e.department_id
    ) AS �μ���
FROM employees e
ORDER BY e.employee_id ASC;

/*
���� 8.
departments���̺� locations���̺��� left �����ϼ���
����) �μ����̵�, �μ��̸�, �Ŵ������̵�, �����̼Ǿ��̵�, ��Ʈ��_��巹��, ����Ʈ �ڵ�, ��Ƽ �� ����մϴ�
����) �μ����̵� ���� �������� ����
*/
SELECT
    d.department_id AS �μ�_���̵�, d.department_name AS �μ�_�̸�, d.manager_id AS �Ŵ���_���̵�,
    loc.location_id AS �����̼�_���̵�, loc.street_address AS ��Ʈ��_��巹��, loc.postal_code AS ����Ʈ_�ڵ�,
    loc.city AS ��Ƽ
FROM departments d
LEFT JOIN locations loc
ON d.location_id = loc.location_id
ORDER BY d.department_id ASC;

/*
���� 9.
���� 8�� ����� (��Į�� ����)�� �����ϰ� ��ȸ�ϼ���
*/
SELECT
    d.department_id AS �μ�_���̵�, d.department_name AS �μ�_�̸�, d.manager_id AS �Ŵ���_���̵�,
    (
        SELECT
            location_id
        FROM locations loc
        WHERE d.location_id = loc.location_id
    )  AS �����̼�_���̵�,
    (
        SELECT
            street_address
        FROM locations loc
        WHERE d.location_id = loc.location_id
    ) AS ��Ʈ��_��巹��,
    (
        SELECT
            postal_code
        FROM locations loc
        WHERE d.location_id = loc.location_id
    ) AS ����Ʈ_�ڵ�,
    (
        SELECT
            city
        FROM locations loc
        WHERE d.location_id = loc.location_id
    )  AS ��Ƽ
FROM departments d;


/*
���� 10.
locations���̺� countries ���̺��� left �����ϼ���
����) �����̼Ǿ��̵�, �ּ�, ��Ƽ, country_id, country_name �� ����մϴ�
����) country_name���� �������� ����
*/
SELECT
    loc.location_id AS �����̼�_���̵�, loc.street_address AS �ּ�,
    loc.city AS ��Ƽ, loc.country_id, cou.country_name AS �����̸�
FROM locations loc
LEFT JOIN countries cou
ON loc.country_id = cou.country_id
ORDER BY country_name ASC;
/*
���� 11.
���� 10�� ����� (��Į�� ����)�� �����ϰ� ��ȸ�ϼ���
*/
SELECT
    loc.location_id AS �����̼�_���̵�, loc.street_address AS �ּ�,
    loc.city AS ��Ƽ, loc.country_id,
    (
    SELECT
        country_name
    FROM countries cou
    WHERE cou.country_id = loc.country_id
    ) AS �����̸�
FROM locations loc
ORDER BY �����̸� ASC;