
/*
- NUMBER(2) -> ������ 2�ڸ����� ������ �� �ִ� ������ Ÿ��.
- NUMBER(5, 2) -> ������, �Ǽ��θ� ��ģ �� �ڸ��� 5�ڸ�, �Ҽ��� 2�ڸ�
- NUMBER -> ��ȣ�� ������ �� (38, 0)���� �ڵ� �����˴ϴ�.
- CHAR -> (2000byte����)
- VARCHAR2(byte) -> ��ȣ �ȿ� ���� ���ڿ��� �ִ� ���̸� ����. (4000byte����)
- CLOB -> ��뷮 �ؽ�Ʈ ������ Ÿ�� (�ִ� 4Gbyte)
- BLOB -> ������ ��뷮 ��ü (�̹���, ���� ���� �� ���)
- DATE -> BC 4712�� 1�� 1�� ~ AD 9999�� 12�� 31�ϱ��� ���� ����
- ��, ��, �� ���� ����.
*/

ROLLBACK; -- DDL �� �ѹ��� �ȸԽ��ϴ�.
          -- DML �� �ѹ��� �Խ��ϴ�.
CREATE TABLE dept2 (
    dept_no NUMBER(2), -- [�÷��̸�] [����Ÿ��](����)
    dept_name VARCHAR(14), -- [�÷��̸�] [���ڿ�Ÿ��](����)
    loca VARCHAR2(15), -- [�÷��̸�] [���ڿ�Ÿ��](����)
    dept_date DATE, -- [�÷��̸�] [��¥Ÿ��]
    dept_bonus NUMBER(10) -- [�÷��̸�] [����Ÿ��](����)
);
-- ����Ŭ DB�� �ѱ��� 3����Ʈ�� �ν��Ѵ�.
-- ����� 1����Ʈ�� �ν��Ѵ�.
DESC dept2;
SELECT * FROM dept2;

-- NUMBER�� VARCHAR2 Ÿ���� ���̸� Ȯ��.
INSERT INTO dept2
VALUES(30, '�濵����', '���', sysdate, 2000000);

-- �÷� �߰�
ALTER TABLE dept2
ADD (dept_count NUMBER(3));

-- ���̸� ����
ALTER TABLE dept2
RENAME COLUMN dept_count TO emp_coumt;

-- �� �Ӽ� ����
-- ���� �����ϰ��� �ϴ� �÷��� �����Ͱ� �̹� �����Ѵٸ� �׿� �´� Ÿ������
-- ������ �ּž� �մϴ�. ���� �ʴ� Ÿ�����δ� ������ �Ұ����մϴ�.
ALTER TABLE dept2
MODIFY (dept_name NUMBER(2)); -- ���� column to be modified must be empty to change datatype �� ���� ����־�߸� ����

-- �� ����
ALTER TABLE dept2
DROP COLUMN dept_bonus;

SELECT * FROM dept3;

-- ���̺� �̸� ����
ALTER TABLE dept2
RENAME TO dept3;
-- ���� �� ���� �Ѵٸ� ���̺� �����Ϳ� �� ������ ������ ���� ���� �ٲ� �� ����^^

-- ���̺� ���� (������ ���ܵΰ� ���� �����͸� ��� ����)
TRUNCATE TABLE dept3; -- �����ʹ� �������� ���̺��� ��ȸ ����

DROP TABLE dept3;

ROLLBACK; -- ���̺��� DROP�ϰ� ROLLBACK�� �ϸ� �ǵ��� �� ����. �׷��� DROP�� ������ �ؾ��Ѵ�.










