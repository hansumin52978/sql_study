
CREATE TABLE DEPTS AS (SELECT * FROM departments); -- ���� 1.

SELECT * FROM DEPTS;

INSERT INTO DEPTS
    (department_id, department_name, location_id)
VALUES
    (280, '����', 1800);
    
INSERT INTO DEPTS
    (department_id, department_name, location_id)
VALUES
    (290, 'ȸ���', 1800);
    
INSERT INTO DEPTS
    (department_id, department_name, manager_id, location_id)
VALUES
    (300, '����', 301, 1800);
    
INSERT INTO DEPTS
    (department_id, department_name, manager_id, location_id)
VALUES
    (310, '�λ�', 302, 1800);
    
INSERT INTO DEPTS
    (department_id, department_name, manager_id, location_id)
VALUES
    (320, '����', 303, 1700);

UPDATE DEPTS SET department_name = 'IT bank'
WHERE department_name = 'IT Support'; -- ���� 2-1.

UPDATE DEPTS SET manager_id = 301
WHERE department_id = 290; -- ���� 2-2.

UPDATE DEPTS
SET department_name = 'IT Help', manager_id = 303, location_id = 1800
WHERE department_name = 'IT Helpdesk'; -- ���� 2-3.

-- ���� 2-4 ������ �����մϴ�. 
-- ȸ���, ����, �λ�, �������� �Ŵ��� ���̵� 301�� �ϰ� �����ϼ���.
UPDATE DEPTS
SET manager_id = 301
WHERE department_id IN(SELECT department_id
                        FROM DEPTS
                        WHERE department_name IN('ȸ���', '����', '�λ�', '����')); -- ���� 2-4

UPDATE depts
SET manager_id = null
WHERE department_name = '����'; -- �Ǽ��ؼ� ����

DELETE FROM depts
WHERE department_name = '����'; -- ���� 3-1.

DELETE FROM depts
WHERE department_name = 'NOC'; -- ���� 3-2.

DELETE FROM depts
WHERE department_id > (SELECT department_id FROM departments
                        WHERE department_id = 200); -- ���� 4-1.
                        
UPDATE depts
SET manager_id = 100
WHERE manager_id IS NOT NULL; -- ���� 4-2.

MERGE INTO depts a
    USING
        (SELECT * FROM departments) b
    ON
        (a.department_id = b.department_id)
WHEN MATCHED THEN
    UPDATE SET
        a.department_name = b.department_name,
        a.manager_id = b.manager_id,
        a.location_id = b.location_id
WHEN NOT MATCHED THEN
    INSERT VALUES
    (b.department_id, b.department_name, b.manager_id, b.location_id); -- ���� 4-4.









