
CREATE TABLE DEPTS AS (SELECT * FROM departments); -- 문제 1.

SELECT * FROM DEPTS;

INSERT INTO DEPTS
    (department_id, department_name, location_id)
VALUES
    (280, '개발', 1800);
    
INSERT INTO DEPTS
    (department_id, department_name, location_id)
VALUES
    (290, '회계부', 1800);
    
INSERT INTO DEPTS
    (department_id, department_name, manager_id, location_id)
VALUES
    (300, '재정', 301, 1800);
    
INSERT INTO DEPTS
    (department_id, department_name, manager_id, location_id)
VALUES
    (310, '인사', 302, 1800);
    
INSERT INTO DEPTS
    (department_id, department_name, manager_id, location_id)
VALUES
    (320, '영업', 303, 1700);

UPDATE DEPTS SET department_name = 'IT bank'
WHERE department_name = 'IT Support'; -- 문제 2-1.

UPDATE DEPTS SET manager_id = 301
WHERE department_id = 290; -- 문제 2-2.

UPDATE DEPTS
SET department_name = 'IT Help', manager_id = 303, location_id = 1800
WHERE department_name = 'IT Helpdesk'; -- 문제 2-3.

-- 문제 2-4 내용을 변경합니다. 
-- 회계부, 재정, 인사, 영업부의 매니저 아이디를 301로 일괄 변경하세요.
UPDATE DEPTS
SET manager_id = 301
WHERE department_id IN(SELECT department_id
                        FROM DEPTS
                        WHERE department_name IN('회계부', '재정', '인사', '영업')); -- 문제 2-4

UPDATE depts
SET manager_id = null
WHERE department_name = '개발'; -- 실수해서 ㅎㅎ

DELETE FROM depts
WHERE department_name = '영업'; -- 문제 3-1.

DELETE FROM depts
WHERE department_name = 'NOC'; -- 문제 3-2.

DELETE FROM depts
WHERE department_id > (SELECT department_id FROM departments
                        WHERE department_id = 200); -- 문제 4-1.
                        
UPDATE depts
SET manager_id = 100
WHERE manager_id IS NOT NULL; -- 문제 4-2.

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
    (b.department_id, b.department_name, b.manager_id, b.location_id); -- 문재 4-4.









