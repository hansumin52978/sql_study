
SELECT * FROM employees;

-- WHERE절 비교 (데이터 값은 대/소문자를 구분합니다.)
SELECT first_name, last_name, job_id
FROM employees
WHERE job_id = 'IT_PROG'; -- 조건에 사용하는 데이터값은 대소문자를 반드시 지켜줘야한다.

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

-- 데이터 행 제한
-- BETWEEN 연산자: WHERE절에서는 BETWEEN 연산자를 사용하여 범위를 지정할 수 있습니다.
SELECT * FROM employees
WHERE salary BETWEEN 15000 AND 20000;

SELECT * FROM employees
WHERE hire_date BETWEEN '03/01/01' AND '03/12/31';

-- IN 연산자의 사용 (특정 값들과 비교할 때 사용)
-- IN 연산자: WHERE절에서는 IN 연산자를 사용하여 여러 개의 값을 비교할 수 있습니다.
SELECT * FROM employees
WHERE manager_id IN (100, 101, 102);

SELECT * FROM employees
WHERE job_id IN ('IT_PROG', 'AD_VP');

-- LIKE 연산자
-- %는 어떠한 문자든, _는 데이터의 자리(위치)를 찾아낼 때
-- LIKE 연산자: WHERE절에서는 LIKE 연산자를 사용하여 문자열 패턴을 검색할 수 있습니다.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '03%'; -- 03이 포함이 되있으면 뒤에 어떠한 데이터든 불러올 수 있음.

SELECT first_name, hire_date
FROM employees
WHERE hire_date LIKE '%15'; -- 15가 포함이 되있으면 앞에 어떠한 데이터든 불러올 수 있음.

SELECT first_name, hire_date
FROM employees
WHERE hire_date LIKE '%05%'; -- 05가 포함이 되있으면 어떠한 데이터든 불러올 수 있음.

SELECT first_name, hire_date
FROM employees
WHERE hire_date LIKE '___05%'; -- 열이 05인 것을 찾음 왜 WHY? 05앞에 ___를 붙였기 때문 _ 하나당 한개의 문자와 일치함.

-- IS NULL (null값을 찾음)
-- IS NULL 연산자: 이 연산자는 해당 열의 값이 NULL인 행을 선택합니다.
SELECT * FROM employees
WHERE manager_id IS NULL;

SELECT * FROM employees
WHERE commission_pct IS NULL;

SELECT * FROM employees
WHERE commission_pct IS NOT NULL;

-- AND, OR
-- AND가 OR보다 연산 순서가 빠름
SELECT * FROM employees
WHERE job_id = 'IT_PROG'
OR job_id = 'FI_MGR'
AND salary >= 6000;

SELECT * FROM employees
WHERE (job_id = 'IT_PROG'
OR job_id = 'FI_MGR')
AND salary >= 6000;

-- 데이터의 정렬 (SELECT 구문의 가장 마지막에 배치됩니다.)
-- ASC : ascending 오름차순
-- DESC : descending 내림차순
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
    salary*12 AS pay -- salary의 12를 곱한 값이 나옴.
FROM employees
ORDER BY pay ASC; -- 별칭도 정렬이 됨.


