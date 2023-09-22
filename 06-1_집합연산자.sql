
-- 집합 연산자
-- 서로 다은 쿼리 결과의 행들을 하나로 결합, 비교, 차이를 구할 수 있게 해 주는 연산자
-- UNION(합집합 중복x), UNION ALL(합집합 중복 o), INTERSECT(교집합), MINUS(차집합)
-- 위 아래 column 개수와 데이터 타입이 정확히 일치해야 합니다.

-- UNION 연산자는 두 개 이상의 SELECT 문의 결과를 결합하여 하나의 결과 집합으로 만듭니다.
-- 중복된 행은 제거되고 결과 집합은 정렬됩니다.
SELECT
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%'
UNION
SELECT
    employee_id, first_name
FROM employees
WHERE department_id = 20;

--  UNION ALL 연산자는 두 개 이상이 SELECT 문의 결과를 결합하여 하나의 결과 집합으로 만듭니다.
-- 중복된 행은 제거되지 않으며 결과 집합의 순서는 SELECT 문의 순서에 따릅니다.
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
-- INTERSECT 연산자는 두 개 이사으이 SELECT 문의 결과 집합에서 공통된 행만 반환됩니다.
-- 결과 집합은 정렬됩니다.
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
-- MINUS 연산자는 첫 번째 SELECT 문의 결과 집합에서 두 번째 SELECT 문의 결과 집합과 중복되는 행을 제거한 후 반환합니다.
-- 결과 집합은 정렬됩니다.
-- A-B 차집합
SELECT
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%' -- A
MINUS
SELECT
    employee_id, first_name
FROM employees
WHERE department_id = 20; -- B

-- B-A 차집합
SELECT
    employee_id, first_name
FROM employees
WHERE department_id = 20 -- B
MINUS
SELECT
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%'; -- A

