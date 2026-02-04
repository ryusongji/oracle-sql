-- Structured Query Language
SELECT studno,name -- 칼럼 명
FROM student; -- student 라고하는 테이블

SELECT *
FROM professor;

SELECT studno,name, grade
FROM student;

-- 숙제완료함

SELECT '표현식' FROM student;

SELECT name ||'의 아이디는'||id FROM student;

SELECT name ||'의 아이디는'||id as "전체설명" -- 별칭(alias)
    , grade "학년"
FROM student;

SELECT name ||'''id is'||id || '이고' || grade || '학년입니다.' as "학년설명" -- 별칭(alias)
FROM student;

SELECT distinct name, grade -- 중복된 값 제거, 대표값만 가져옴
FROM student;


SELECT *
FROM student;

SELECT name ||'''S ID:' ||id || ', WEIGHT is ' || weight || 'kg' as "ID AND EWIGHT"
FROM student;

SELECT *
FROM emp;

SELECT ename || '(' || job || '), '|| ename || '''' || job || '''' as "NAME AND JOB"
FROM emp;

-- WHERE
SELECT *
FROM student
--WHERE weight between 60 and 70
WHERE deptno2 is not null;

-- 비교연산자 연습1) emp 테이블 급여

SELECT *
FROM emp
WHERE sal >3000;

SELECT *
FROM emp
WHERE COMM is not null;

SELECT *
FROM student
WHERE deptno1 between 101 and 103;

-- AND / OR
SELECT studno
    ,name
    ,grade
    ,height
    ,weight
FROM student
WHERE (height > 170
OR weight >60)
AND grade = 4 OR height > 150;

-- 급여가 2000이상인 직원, 커미션(급여+커미션)

SELECT ename
        ,sal
        ,comm
FROM emp
WHERE sal >2000
or (sal+comm)>2000;

SELECT profno
    ,name
    ,pay
    ,bonus
FROM professor
WHERE (pay*12)>=4000 and bonus is null
or (pay*12 + bonus*3>=4000 AND bonus is not null)
ORDER BY 4;

-- 문자열
SELECT *
FROM student
WHERE name like '%on____%';

SELECT *
FROM professor
WHERE hiredate>'99/01/01';

SELECT *
FROM professor
WHERE hiredate > to_date('99-01-01', 'rr-mm-dd')
ORDER BY hiredate;

SELECT *
FROM student
WHERE tel like '051%';

SELECT *
FROM student
WHERE name like 'M________%';

SELECT *
FROM student
WHERE jumin like '__10%';

SELECT ename || '''s sal is $' || sal as "Name And Sal"
From emp;

SELECT *
FROM board;
UPDATE board
set writer = 'user02'
WHERE board_no = 3;
