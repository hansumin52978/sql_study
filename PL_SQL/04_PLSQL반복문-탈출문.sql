
-- WHILE문
DEClARE
    v_num NUMBER := 0;
    v_count NUMBER := 1; -- begin
BEGIN
    WHILE
        v_count <= 10 -- end
    LOOP
        v_num := v_num + v_count;
        v_count := v_count +1; --step
    END LOOP;
    
    dbms_output.put_line(v_num);
    
END;

-- 탈출문
DEClARE
    v_num NUMBER := 0;
    v_count NUMBER := 1; -- begin
BEGIN
    WHILE
        v_count <= 10 -- end
    LOOP
        EXIT WHEN v_count = 5; -- 1부터 4까지만 더해짐
    
        v_num := v_num + v_count;
        v_count := v_count +1; --step
    END LOOP;
    
    dbms_output.put_line(v_num);
    
END;

-- FOR문
DECLARE
    v_num NUMBER := 4;
    v_hang NUMBER := 1;
BEGIN
    
    FOR
        i IN 1..9 -- .을 두 개 작성해서 범위를 표현.
    LOOP
        dbms_output.put_line(v_num || ' x ' || i || ' = ' || v_num*i);
    END LOOP;
END;

-- CONTINUE문
DECLARE
    v_num NUMBER := 3;
    v_hang NUMBER := 1;
BEGIN
    
    FOR
        i IN 1..9 -- .을 두 개 작성해서 범위를 표현.
    LOOP
        CONTINUE WHEN i = 5; -- 3 x 5 는 건너뛰고 나옴
        dbms_output.put_line(v_num || ' x ' || i || ' = ' || v_num*i);
    END LOOP;
END;

-- 1. 모든 구구단을 출력하는 익명 블록을 만드세요. (2 ~ 9단)
-- 짝수단만 출력해 주세요. (2, 4, 6, 8)
-- 참거러 오라클 연산자 중에는 나머지를 알아내는 연산자가 없어요. (% 없음~)
DECLARE
    h_num NUMBER := 1;
    h_hang NUMBER := 9;
BEGIN 
    FOR
        i IN 1..9 LOOP
    FOR
        j IN 1..9 LOOP 
        IF MOD(i, 2) = 0 THEN
        dbms_output.put_line(i || ' x ' || j || ' = ' || h_num*j);
    END IF;
    END LOOP;
    END LOOP;
END;

-- 선생님 답안
BEGIN
    FOR dan IN 2..9
    LOOP
        IF MOD(dan, 2) = 0 THEN
            dbms_output.put_line('구구단' || dan || '단');
            FOR hang IN 1..9
            LOOP
                dbms_output.put_line(dan || ' x ' || hang || ' = ' || dan*hang);
            END LOOP;
            dbms_output.put_line('-------------------------------------------');
        END IF;
    END LOOP;
END; -- 변수를 따로 지정을 안한다면 DECLARE 생략 가능

-- 2. INSERT를 300번 실행하는 익명 블록을 처리하세요.
-- board라는 이름의 테이블을 만드세요. (bno, writer, title 컬럼이 존재합니다.)
-- bno는 SEQUENCE로 올려 주시고, writer와 title에 번호를 붙여서 INSERT 진행해 주세요.
-- ex) 1, test1, title1 -> 2 test2 title2 -> 3 test3 title3 ....

-- 선생님 답안
CREATE TABLE board (
    bon NUMBER PRIMARY KEY,
    writer VARCHAR(30),
    title VARCHAR(30)
);

CREATE SEQUENCE b_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 1000
    NOCYCLE
    NOCACHE;

DECLARE
    v_num NUMBER := 1;
BEGIN
    WHILE v_num <= 300
    LOOP
        INSERT INTO board
        VALUES(b_seq.NEXTVAL, 'test'||v_num, 'title'||v_num);
        v_num := v_num + 1;
    END LOOP;
    COMMIT;
END;

SELECT * FROM board
ORDER BY bon DESC;



