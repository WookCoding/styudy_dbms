/*
 * 자동차
 * 
 * - 자동차 번호
 * - 자동차 브랜드
 * - 출시 날짜
 * - 색상
 * - 가격
 * 
 * */
CREATE TABLE TBL_CAR(
   CAR_ID NUMBER,
   CAR_BRAND VARCHAR2(1000),
   CAR_RELEASE_DATE DATE,
   CAR_COLOR VARCHAR2(1000),
   CAR_PRICE NUMBER,
   CONSTRAINT PK_CAR PRIMARY KEY(CAR_ID)
);

CREATE TABLE TBL_CAR(
   CAR_ID NUMBER PRIMARY KEY,
   CAR_BRAND VARCHAR2(1000),
   CAR_RELEASE_DATE DATE,
   CAR_COLOR VARCHAR2(1000),
   CAR_PRICE NUMBER
);

CREATE TABLE TBL_CAR(
   CAR_ID NUMBER CONSTRAINT PK_CAR PRIMARY KEY,
   CAR_BRAND VARCHAR2(1000),
   CAR_RELEASE_DATE DATE,
   CAR_COLOR VARCHAR2(1000),
   CAR_PRICE NUMBER
);

DROP TABLE TBL_CAR;

ALTER TABLE TBL_CAR DROP CONSTRAINT PK_CAR;
ALTER TABLE TBL_CAR ADD CONSTRAINT PK_CAR PRIMARY KEY(CAR_ID);

/*
 * 동물 테이블 생성
 * 
 * - 고유 번호
 * - 종류
 * - 나이
 * - 먹이
 * 
 * */

CREATE TABLE TBL_ANIMAL(
   ANIMAL_ID NUMBER CONSTRAINT PK_ANIMAL PRIMARY KEY,
   ANIMAL_TYPE VARCHAR2(1000),
   ANIMAL_AGE NUMBER,
   ANIMAL_FEED_NAME VARCHAR2(1000)
);

CREATE TABLE TBL_ANIMAL(
   ANIMAL_ID NUMBER,
   ANIMAL_TYPE VARCHAR2(1000),
   ANIMAL_AGE NUMBER,
   ANIMAL_FEED_NAME VARCHAR2(1000),
   CONSTRAINT PK_ANIMAL PRIMARY KEY(ANIMAL_ID)
);

ALTER TABLE TBL_ANIMAL DROP CONSTRAINT PK_ANIMAL;
ALTER TABLE TBL_ANIMAL ADD CONSTRAINT PK_ANIMAL PRIMARY KEY(ANIMAL_ID);


DROP TABLE TBL_ANIMAL;

/*
 * 학생 테이블 생성
 * 
 * - 학생 번호
 * - 학생 아이디
 * - 학생 이름
 * - 전공
 * - 성별
 * - 생년월일
 * - 학생 나이 NOT NULL, DEFAULT는 생년월일로 계산된 나이, 19보다 커야한다
 * - 학생 학점(A+ ~ F) 'A+', 'A', 'B+', 'B', 'C+', 'C', 'D+', 'D', 'F'
 * 
 * */

CREATE TABLE TBL_STUDENT(
   STUDENT_ID NUMBER CONSTRAINT PK_STUDENT PRIMARY KEY,
   STUDENT_IDENTIFICATION VARCHAR2(1000) CONSTRAINT UK_STUDENT UNIQUE,
   STUDENT_NAME VARCHAR2(1000) CONSTRAINT REQUIER_NAME NOT NULL,
   STUDENT_MAJOR VARCHAR2(1000) CONSTRAINT REQUIER_MAJOR NOT NULL,
   STUDENT_GENDER CHAR(1) DEFAULT 'N' CONSTRAINT BAN_CHAR CHECK(STUDENT_GENDER IN('M','F','N')) CONSTRAINT REQUIER_GENDER NOT NULL,
   STUDENT_BIRTH DATE CONSTRAINT BAN_DATE CHECK(STUDENT_BIRTH >= TO_DATE('1985-01-01', 'YYYY-MM-DD')) CONSTRAINT REQUIER_BIRTH NOT NULL
);

/*학생 아이디는 NULL을 허용하지 않는다. NOT NULL 제약 조건은 추가가 아닌 수정으로 한다.*/
ALTER TABLE TBL_STUDENT MODIFY STUDENT_IDENTIFICATION CONSTRAINT REQUIER_IDENTIFICATION NOT NULL;
/*제약조건의 이름을 설정하지 않으면 시스템 이름으로 설정되기 때문에 지우고 다시 이름을 붙여주는 것이 좋다.*/
ALTER TABLE TBL_STUDENT DROP CONSTRAINT SYS_C007014;
/*기존 BAN_CHAR 제약조건을 없앤다.*/
ALTER TABLE TBL_STUDENT DROP CONSTRAINT BAN_CHAR;
/*BAN_CHAR 제약조건을 추가한다. 성별에는 M, W, N 이외의 문자가 들어가지 못하게 한다.*/
ALTER TABLE TBL_STUDENT ADD CONSTRAINT BAN_CHAR CHECK(STUDENT_GENDER IN ('M','W','N'));
/*DEFAULT 제약조건은 추가가 아닌 수정으로 진행하며, 학생 성별에 W를 기본 값으로 설정한다.*/
ALTER TABLE TBL_STUDENT MODIFY STUDENT_GENDER DEFAULT 'W';
/*학생 나이 컬럼 추가*/
ALTER TABLE TBL_STUDENT ADD(STUDENT_AGE NUMBER);
/*학생 학점 컬럼 추가*/
ALTER TABLE TBL_STUDENT ADD(STUDENT_GRADE VARCHAR2(10));
/*학생 나이는 필수 요소로서 NULL을 허용하지 않는다.*/
ALTER TABLE TBL_STUDENT MODIFY STUDENT_AGE CONSTRAINT REQUIER_AGE NOT NULL;
/*학생 나이는 19세가 넘어야 된다.*/
ALTER TABLE TBL_STUDENT ADD CONSTRAINT CHECK_AGE CHECK(STUDENT_AGE > 19);
/*DEFAULT 제약조건에 다른 컬럼의 값을 가져와 연산할 수 없다. INSERT 또는 다른 언어로 처리해야 한다.*/
/*ALTER TABLE TBL_STUDENT MODIFY STUDENT_AGE DEFAULT TRUNC((SYSDATE - STUDENT_BIRTH) / 365);*/
/*학생 학점은 IN절에 작성된 문자만 사용 가능하다.*/
/*COLUMN IN(A, B, C) => COLUMN = A OR COLUMN = B OR COLUMN = C*/
ALTER TABLE TBL_STUDENT ADD CONSTRAINT BAN_GRADE CHECK(STUDENT_GRADE IN('A+', 'A', 'B+', 'B', 'C+', 'C', 'D+', 'D', 'F'));








