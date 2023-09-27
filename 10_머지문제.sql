
-- ���� 1.
CREATE TABLE DEPTS AS (SELECT * FROM departments); 

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

-- �÷� ���� �� ������ ��� �������� ���� ����� ��.

-- ���� 2-1.
UPDATE DEPTS SET department_name = 'IT bank'
WHERE department_name = 'IT Support';

-- ���� 2-2.
UPDATE DEPTS SET manager_id = 301
WHERE department_id = 290;

-- ���� 2-3.
UPDATE DEPTS
SET department_name = 'IT Help', manager_id = 303, location_id = 1800 -- �޸��� ����ϸ� ������ ��������
WHERE department_name = 'IT Helpdesk';

-- ���� 2-4.
-- ���� 2-4 ������ �����մϴ�. 
-- ȸ���, ����, �λ�, �������� �Ŵ��� ���̵� 301�� �ϰ� �����ϼ���.
UPDATE DEPTS
SET manager_id = 301
WHERE department_id IN (SELECT department_id
                        FROM DEPTS
                        WHERE department_name IN('ȸ���', '����', '�λ�', '����'));
                        
UPDATE depts
SET manager_id = null
WHERE department_name = '����'; -- �Ǽ��ؼ� ����

-- ���� 2-4. �ٸ� ���� ����
UPDATE depts
SET
    manager_id = 301
WHERE department_id = IN (290, 300, 310, 320);

-- ���� 3-1.
DELETE FROM depts
WHERE department_name = '����';
-- ���� 3-1 �����̸Ӹ�Ű�� �̿��ؼ� �̰� �´°���^^
DELETE FROM depts WHERE department_id = (SELECT department_id FROM depts
                                         WHERE department_name = '����');

-- ���� 3-2.
DELETE FROM depts
WHERE department_name = 'NOC';
-- ���� 3-2 �����̸Ӹ�Ű�� �̿��ؼ� �̰� �´°���^^
DELETE FROM depts WHERE department_id = (SELECT department_id FROM depts
                                         WHERE department_name = 'NOC');

-- ���� 4-1.
DELETE FROM depts
WHERE department_id > (SELECT department_id FROM departments
                        WHERE department_id = 200);
-- ���� 4-1 �������� �̷��� ��������.                        
DELETE FROM depts WHERE department_id > 200;

-- ���� 4-2.                       
UPDATE depts
SET manager_id = 100
WHERE manager_id IS NOT NULL; 

-- ���� 4-4.
-- �����ϴ� �͵��� UPDATE �������� �ʴ� �͵��� INSERT
MERGE INTO depts a
    USING
        (SELECT * FROM departments) b
    ON
        (a.department_id = b.department_id) -- ���� �������� �ϴ� ��
WHEN MATCHED THEN -- ������ ��ġ�ϴ� ��� �� �� �ִ� ��쿡�� ������Ʈ
    UPDATE SET
        a.department_name = b.department_name,
        a.manager_id = b.manager_id,
        a.location_id = b.location_id
        
WHEN NOT MATCHED THEN -- ������ ��ġ���� �ʴ� ��� �� �ʿ��� �ִ� ��쿡�� �μ�Ʈ
    INSERT VALUES
    (b.department_id, b.department_name, b.manager_id, b.location_id);

--------------------------------------------------------------------------------

-- ���� 5-1.
CREATE TABLE jobs_it AS (SELECT * FROM jobs
                         WHERE min_salary > 6000);

-- ���� 5-2.
SELECT * FROM jobs_it;
SELECT * FROM jobs_hi;
SELECT * FROM jobs;
INSERT INTO jobs_it
    (job_id, job_title, min_salary, max_salary)
VALUES
    ('IT_DEV', '����Ƽ������', 6000, 20000);
    
INSERT INTO jobs_it
    (job_id, job_title, min_salary, max_salary)
VALUES
    ('NET_DEV', '��Ʈ��ũ������', 5000, 20000);

INSERT INTO jobs_it
    (job_id, job_title, min_salary, max_salary)
VALUES
    ('SEC_DEV', '���Ȱ�����', 6000, 19000);

-- ���� 5-4.
MERGE INTO jobs_it a
    USING
        (SELECT * FROM jobs WHERE min_salary > 5000) b -- ������ ����� �ִ� ����.
    ON
        (a.job_id = b.job_id) -- ����� ������ ������ �ִ� ����.
WHEN MATCHED THEN
    UPDATE SET
        a.min_salary = b.min_salary,
        a.max_salary = b.max_salary
WHEN NOT MATCHED THEN
    INSERT VALUES
    (b.job_id, b.job_title, b.min_salary, b.max_salary);
    
CREATE TABLE jobs_hi AS (SELECT * FROM jobs
                         WHERE min_salary > 6000);

-- Merge ���ظ� ���� �Ǵٸ� ���̺� �����Ѱ���.
SELECT * FROM jobs_hi;

INSERT INTO jobs_hi
    (job_id, job_title, min_salary, max_salary)
VALUES
    ('IT_DEV', '����Ƽ������', 6000, 20000);
    
INSERT INTO jobs_hi
    (job_id, job_title, min_salary, max_salary)
VALUES
    ('NET_DEV', '��Ʈ��ũ������', 5000, 20000);

INSERT INTO jobs_hi
    (job_id, job_title, min_salary, max_salary)
VALUES
    ('SEC_DEV', '���Ȱ�����', 6000, 19000);

  





