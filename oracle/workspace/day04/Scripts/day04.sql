/*JOBS 테이블에서 JOB_ID로 직원들의 JOB_TITLE, EMAIL, 성, 이름 검색*/
SELECT JOB_TITLE, EMAIL, LAST_NAME || ' ' || FIRST_NAME NAME FROM JOBS J
JOIN EMPLOYEES E
ON J.JOB_ID = E.JOB_ID;

/*EMP 테이블의 SAL을 SALGRADE 테이블의 등급으로 나누기*/
SELECT * FROM SALGRADE S
JOIN EMP E
ON E.SAL BETWEEN S.LOSAL AND S.HISAL;

/*세타 조인*/
SELECT *
FROM SALGRADE S, EMP E
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;

/*EMPLOYEES 테이블에서 HIREDATE가 2003~2005년까지인 사원의 정보와 부서명 검색*/
SELECT D.DEPARTMENT_ID, E.* FROM EMPLOYEES E
JOIN DEPARTMENTS D ON 
E.DEPARTMENT_ID = D.DEPARTMENT_ID AND 
E.HIRE_DATE BETWEEN TO_DATE('2003','YYYY') AND TO_DATE('2005','YYYY');

SELECT SYS_CONTEXT('USERNV', 'NLS_DATE_FORMAT') FROM DUAL;
ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD';

/*JOB_TITLE 중 'Manager'라는 문자열이 포함된 직업들의 평균 연봉을 JOB_TITLE별로 검색*/



/*EMP 테이블에서 ENAME에 L이 있는 사원들의 DNAME과 LOC 검색*/

/*축구 선수들 중에서 각 팀별로 키가 가장 큰 선수들 전체 정보 검색*/

/*EMP 테이블에서 사원의 이름과 매니저 이름을 검색??*/
