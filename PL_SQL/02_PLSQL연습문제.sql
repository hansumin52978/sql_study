

-- 1. employees ���̺��� 201�� ����� �̸��� �̸��� �ּҸ� ����ϴ�
-- �͸����� ����� ����. (������ ��Ƽ� ����ϼ���.)

SET SERVEROUTPUT ON;

DECLARE
    emp_name VARCHAR2(50); -- ����� �̸�
    emp_email VARCHAR2(100); -- �̸��� �ּ�
BEGIN
    SELECT
        e.first_name || '' || e.last_name,
        e.email
    INTO
        emp_name, emp_email
    FROM employees e
    WHERE employee_id = 201;
    
    DBMS_OUTPUT.put_line(emp_name || '-' || emp_email);
       
END;

-- ������ ���
DECLARE
    v_emp_name employees.first_name%TYPE;
    v_emp_email employees.email%TYPE;
BEGIN
    SELECT
        first_name,
        email
    INTO
        v_emp_name, v_emp_email
    FROM employees
    WHERE employee_id = 201;
    
    DBMS_OUTPUT.put_line(v_emp_name || ':' || v_emp_email);
       
END;
-- 2. employees ���̺��� �����ȣ�� ���� ū ����� ã�Ƴ� �� (MAX �Լ� ���)
-- �� ��ȣ + 1������ �Ʒ��� ����� emps ���̺�
-- employee_id, last_name, email, hire_date, job_id�� �ű� �����ϴ� �͸� ����� ���弼��.
-- SELECT�� ���Ŀ� INSERT�� ����� �����մϴ�.
/*
<�����>: steven
<�̸���>: stevenjobs
<�Ի�����>: ���ó�¥
<JOB_ID>: CEO
*/

-- ������ ���
DECLARE
    v_max_empno employees.employee_id%TYPE;
BEGIN
    SELECT
        MAX(employee_id)
    INTO
        v_max_empno
    FROM employees;
    
    INSERT INTO emps
        (employee_id, last_name, email, hire_date, job_id)
    VALUES
        (v_max_empno + 1, 'steven', 'stevenjobs', sysdate, 'CEO');
END;

SELECT * FROM emps;









