
/*
- NUMBER(2) -> 정수를 2자리까지 저장할 수 있는 숫자형 타입.
- NUMBER(5, 2) -> 정수부, 실수부를 합친 총 자리수 5자리, 소수점 2자리
- NUMBER -> 괄호를 생략할 시 (38, 0)으로 자동 지정됩니다.
- CHAR -> (2000byte까지)
- VARCHAR2(byte) -> 괄호 안에 들어올 문자열의 최대 길이를 지정. (4000byte까지)
- CLOB -> 대용량 텍스트 데이터 타입 (최대 4Gbyte)
- BLOB -> 이진형 대용량 객체 (이미지, 파일 저장 시 사용)
- DATE -> BC 4712년 1월 1일 ~ AD 9999년 12월 31일까지 지정 가능
- 시, 분, 초 지원 가능.
*/

ROLLBACK; -- DDL 은 롤백이 안먹습니다.
          -- DML 은 롤백이 먹습니다.
CREATE TABLE dept2 (
    dept_no NUMBER(2), -- [컬럼이름] [숫자타입](길이)
    dept_name VARCHAR(14), -- [컬럼이름] [문자열타입](길이)
    loca VARCHAR2(15), -- [컬럼이름] [문자열타입](길이)
    dept_date DATE, -- [컬럼이름] [날짜타입]
    dept_bonus NUMBER(10) -- [컬럼이름] [숫자타입](길이)
);
-- 오라클 DB는 한글을 3바이트로 인식한다.
-- 영어는 1바이트로 인식한다.
DESC dept2;
SELECT * FROM dept2;

-- NUMBER와 VARCHAR2 타입의 길이를 확인.
INSERT INTO dept2
VALUES(30, '경영지원', '경기', sysdate, 2000000);

-- 컬럼 추가
ALTER TABLE dept2
ADD (dept_count NUMBER(3));

-- 열이름 변경
ALTER TABLE dept2
RENAME COLUMN dept_count TO emp_coumt;

-- 열 속성 수정
-- 만약 변경하고자 하는 컬럼에 데이터가 이미 존재한다면 그에 맞는 타입으로
-- 변경해 주셔야 합니다. 맞지 않는 타입으로는 변경이 불가능합니다.
ALTER TABLE dept2
MODIFY (dept_name NUMBER(2)); -- 오류 column to be modified must be empty to change datatype 는 값이 비어있어야만 가능

-- 열 삭제
ALTER TABLE dept2
DROP COLUMN dept_bonus;

SELECT * FROM dept3;

-- 테이블 이름 변경
ALTER TABLE dept2
RENAME TO dept3;
-- 위를 더 쉽게 한다면 테이블 데이터에 들어가 연필을 누르면 더욱 쉽게 바꿀 수 있음^^

-- 테이블 삭제 (구조는 남겨두고 내부 데이터만 모두 삭제)
TRUNCATE TABLE dept3; -- 데이터는 날라갔지만 테이블은 조회 가능

DROP TABLE dept3;

ROLLBACK; -- 테이블을 DROP하고 ROLLBACK을 하면 되돌릴 수 없다. 그래서 DROP은 신중히 해야한다.










