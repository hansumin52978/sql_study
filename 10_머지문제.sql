
-- 문제 1.
CREATE TABLE DEPTS AS (SELECT * FROM departments); 

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

-- 컬럼 값을 다 지정할 경우 지정값을 따로 안적어도 됨.

-- 문제 2-1.
UPDATE DEPTS SET department_name = 'IT bank'
WHERE department_name = 'IT Support';

-- 문제 2-2.
UPDATE DEPTS SET manager_id = 301
WHERE department_id = 290;

-- 문제 2-3.
UPDATE DEPTS
SET department_name = 'IT Help', manager_id = 303, location_id = 1800 -- 콤마를 사용하면 여러개 지정가능
WHERE department_name = 'IT Helpdesk';

-- 문제 2-4.
-- 문제 2-4 내용을 변경합니다. 
-- 회계부, 재정, 인사, 영업부의 매니저 아이디를 301로 일괄 변경하세요.
UPDATE DEPTS
SET manager_id = 301
WHERE department_id IN (SELECT department_id
                        FROM DEPTS
                        WHERE department_name IN('회계부', '재정', '인사', '영업'));
                        
UPDATE depts
SET manager_id = null
WHERE department_name = '개발'; -- 실수해서 ㅎㅎ

-- 문제 2-4. 다른 정답 유형
UPDATE depts
SET
    manager_id = 301
WHERE department_id = IN (290, 300, 310, 320);

-- 문제 3-1.
DELETE FROM depts
WHERE department_name = '영업';
-- 문제 3-1 프라이머리키를 이용해서 이게 맞는거임^^
DELETE FROM depts WHERE department_id = (SELECT department_id FROM depts
                                         WHERE department_name = '영업');

-- 문제 3-2.
DELETE FROM depts
WHERE department_name = 'NOC';
-- 문제 3-2 프라이머리키를 이용해서 이게 맞는거임^^
DELETE FROM depts WHERE department_id = (SELECT department_id FROM depts
                                         WHERE department_name = 'NOC');

-- 문제 4-1.
DELETE FROM depts
WHERE department_id > (SELECT department_id FROM departments
                        WHERE department_id = 200);
-- 문제 4-1 선생님은 이렇게 적으셨음.                        
DELETE FROM depts WHERE department_id > 200;

-- 문제 4-2.                       
UPDATE depts
SET manager_id = 100
WHERE manager_id IS NOT NULL; 

-- 문재 4-4.
-- 존재하는 것들은 UPDATE 존재하지 않는 것들은 INSERT
MERGE INTO depts a
    USING
        (SELECT * FROM departments) b
    ON
        (a.department_id = b.department_id) -- 병합 조건으로 하는 것
WHEN MATCHED THEN -- 조건이 일치하는 경우 둘 다 있는 경우에는 업데이트
    UPDATE SET
        a.department_name = b.department_name,
        a.manager_id = b.manager_id,
        a.location_id = b.location_id
        
WHEN NOT MATCHED THEN -- 조건이 일치하지 않는 경우 한 쪽에만 있는 경우에는 인설트
    INSERT VALUES
    (b.department_id, b.department_name, b.manager_id, b.location_id);

--------------------------------------------------------------------------------

-- 문제 5-1.
CREATE TABLE jobs_it AS (SELECT * FROM jobs
                         WHERE min_salary > 6000);

-- 문제 5-2.
SELECT * FROM jobs_it;
SELECT * FROM jobs_hi;
SELECT * FROM jobs;
INSERT INTO jobs_it
    (job_id, job_title, min_salary, max_salary)
VALUES
    ('IT_DEV', '아이티개발팀', 6000, 20000);
    
INSERT INTO jobs_it
    (job_id, job_title, min_salary, max_salary)
VALUES
    ('NET_DEV', '네트워크개발팀', 5000, 20000);

INSERT INTO jobs_it
    (job_id, job_title, min_salary, max_salary)
VALUES
    ('SEC_DEV', '보안개발팀', 6000, 19000);

-- 문재 5-4.
MERGE INTO jobs_it a
    USING
        (SELECT * FROM jobs WHERE min_salary > 5000) b -- 조건은 여기다 넣는 것임.
    ON
        (a.job_id = b.job_id) -- 여기는 병합의 조건을 넣는 것임.
WHEN MATCHED THEN
    UPDATE SET
        a.min_salary = b.min_salary,
        a.max_salary = b.max_salary
WHEN NOT MATCHED THEN
    INSERT VALUES
    (b.job_id, b.job_title, b.min_salary, b.max_salary);
    
CREATE TABLE jobs_hi AS (SELECT * FROM jobs
                         WHERE min_salary > 6000);

-- Merge 이해를 위해 또다른 테이블 생성한거임.
SELECT * FROM jobs_hi;

INSERT INTO jobs_hi
    (job_id, job_title, min_salary, max_salary)
VALUES
    ('IT_DEV', '아이티개발팀', 6000, 20000);
    
INSERT INTO jobs_hi
    (job_id, job_title, min_salary, max_salary)
VALUES
    ('NET_DEV', '네트워크개발팀', 5000, 20000);

INSERT INTO jobs_hi
    (job_id, job_title, min_salary, max_salary)
VALUES
    ('SEC_DEV', '보안개발팀', 6000, 19000);

  





