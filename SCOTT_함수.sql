-- 함수
SELECT name
    ,pay * 12 + nvl(bonus,0)* 3 AS "연봉"
    ,pay
    ,nvl(bonus,0)bonus
FROM professor;

-- initcap('문자열'/칼럼)
SELECT initcap('hello')
FROM dual;

SELECT profno
    ,initcap(name)
FROM professor;

SELECT ename
    , initcap(ename) "initcap"
FROM emp;

SELECT *
FROM emp;

SELECT name
    , INITCAP(name) "INITCAP"
FROM professor
WHERE deptno = 101;

SELECT name
    , LOWER(name) "LOWER"
FROM professor;

SELECT name
    ,UPPER(name) "UPPER"
FROM professor;

SELECT ename
    , LENGTH(ename) "LENGTH"
FROM emp;

SELECT *
FROM professor;

SELECT name
    , profno
FROM professor
WHERE UPPER(name) like '%ST%';

SELECT name
    , profno
    ,email
FROM professor
WHERE LENGTH(name)<10;

-- substr
SELECT 'hello, world'
    , substr('hello, world', 1, 5)substr1 -- 양수면 왼쪽 순번
    , substr('hello, world', -3,5)substr2 -- 음수면 오른쪽부터 왼쪽 순번
    , substr('0'||5,-2,2)nm
    , substr('02)3456-2345',1,instr('02)3456-2345', ')', 1) -1)instrl
    , substr('031)2345-2312',1,instr('031)2345-2312', ')', 1) -1)instrl
    , instr('031)2345-2312', ')', 1)instr2
FROM dual;

SELECT name
    ,tel
    ,substr(tel,instr(tel,')',1)+1,(instr(tel,'-',1)-instr(tel,')',1)-1))지역번호
    ,substr(tel,instr(tel,')',1)+1,(length(tel)-instr(tel,'-',1)))지역번호
    ,instr(tel,')',1)
    ,instr(tel,'-',1)-1
    ,length(tel)
    ,substr(tel,instr(tel,')',1)+1,1)지역번호
    ,substr(tel,1,instr(tel,')',1)-1)지역번호
    ,deptno1
FROM student
WHERE deptno1 = 201;

SELECT name
    ,email
    ,substr(email,instr(email,'@',1)+1,(instr(email,'.',1)-instr(email,'@',1)-1))
    ,substr(email,instr(email,'@',1)+1,instr(email,'.',1))이메일회사
FROM professor;

SELECT rpad('hello',7,'*')
from dual;

SELECT lpad(ename,9,'1234567')
    , rpad(ename,10,'-')
FROM emp
WHERE deptno = 10;



SELECT name
    ,tel
    ,replace(tel,substr(tel,instr(tel,')',1)+1,(instr(tel,'-',1)-instr(tel,')',1)-1)),'***')
    ,deptno1
FROM student
WHERE deptno1 = 201;

SELECT replace('Hello','He','')
FROM dual;

SELECT replace('Hello', 'o','o, World')
FROM dual;

SELECT ename
    ,replace(ename,substr(ename,2,2),'--')replace
FROM emp;

SELECT name
    , jumin
    , replace(jumin, substr(jumin,7,7),'-/-/-/-')replace
FROM student;

SELECT name
    ,tel
    ,replace(tel,substr(tel,instr(tel,')',1)+1,(instr(tel,'-',1)-instr(tel,')',1)-1)),'***')
    ,deptno1
FROM student
WHERE deptno1 = 201;

SELECT name
    ,tel
    ,replace(tel,substr(tel,instr(tel,'-',1)+1),'****')
    ,deptno1
FROM student
WHERE deptno1 = 101;

SELECT round(123.456,-2)
    ,trunc(123.4567,-1)
    ,mod(12,5)
    ,ceil(12.3)
    ,floor(12.3)
    ,trunc(sysdate)
FROM dual;

SELECT to_char(trunc(sysdate),'MM')
    ,to_char(to_date(hiredate),'MM')
    ,(to_char(trunc(sysdate),'YYYY')-to_char(to_date(hiredate),'YYYY'))*12
    ,12-to_char(to_date(hiredate),'MM')+to_char(to_date(hiredate),'MM')
FROM emp;

SELECT profno,name, p.deptno,d.deptno, dname
FROM professor p, department d;
WHERE p.deptno = d.deptno;
AND d.dname = 'Computer Engineering';
AND (months_between(sysdate, hiredate)/12)>=30;

SELECT profno
    ,name
    ,hiredate
    ,position
    ,pay
    ,p.deptno
FROM professor
WHERE (months_between(sysdate, hiredate)/12)>=30
ORDER BY 3;

SELECT *
FROM emp,dept
WHERE emp.deptno = dept.deptno
AND (months_between(sysdate, hiredate)/12)>=30
ORDER BY emp.empno;

SELECT to_char(12345.6789, '099,999.99')
FROM dual;

SELECT studno
    , name
    , to_char(birthday,'DD-MON-RR')birthday
FROM student
WHERE to_char(birthday,'MM') = 01;

SELECT nvl(10,0) --nulㅣ?0:10
FROM dual;

SELECT pay + nvl(bonus, 0)
FROM professor;

SELECT name
    ,nvl(profno,9999)
FROM student;

SELECT decode(10,20,'같다', '다르다')
FROM dual;

SELECT studno,profno,decode(profno,null,9999,profno)
FROM student
ORDER BY profno desc;

SELECT decode('A','A','현재A','B','현재B', '기타')
FROM dual;

SELECT deptno
    ,name
    ,decode(deptno,101,'Computer Engineering',' ')
FROM professor;

SELECT deptno
    ,name
    ,decode(deptno,101,'Computer Engineering','ETC')
FROM professor;

SELECT deptno
    ,name
    ,decode(deptno,101,'Computer Engineering',102,'Multimedia Engineering',103,'Software Engineering','ETC')
FROM professor;

SELECT deptno
    ,name
    ,decode(deptno,101,'Computer Engineering',102,'Multimedia Engineering',103,'Software Engineering','ETC')
FROM professor;
---숙제
--107p
SELECT ename
    , sal
    , to_char(sal*12+comm,'99,999')salary
FROM emp
WHERE ename like 'ALLEN';

SELECT name, pay, nvl(bonus,0)bonus
    ,to_char(pay*12+nvl(bonus,0),'99,999')연봉
FROM professor
WHERE deptno = 201;

SELECT empno
    , ename
    , hiredate
    ,concat('$',to_char(sal*12+nvl(comm,0),'99,999'))salary
    ,concat('$',to_char((sal*12+nvl(comm,0))+(sal*12+nvl(comm,0))/100*15,'99,999'))up
FROM emp;

SELECT empno
    ,ename
    ,nvl(comm,0)
    ,decode(nvl(comm,0),0,'NULL','Exist')
FROM emp
WHERE deptno = 30;


--마지막 문제
SELECT studno
    ,name
    ,to_char(birthday,'MM')
    ,decode(to_char(birthday,'MM'),01,'1/4분기',02,'1/4분기',03,'1/4분기',04,'2/4분기',05,'2/4분기',06,'2/4분기',07,'3/4분기',08,'3/4분기',09,'3/4분기','4/4분기')
FROM student;

SELECT *
FROM student;

--ANSI vs. ORACLE
SELECT *
FROM emp e
JOIN dept d ON e.deptno = d.deptno
WHERE job = 'SALESMAN';

-- student(profno), professoe(profno)
-- 학생번호, 이름, 담당교수번호, 이름
SELECT studno
    , s.name 
    ,p.profno
    , p.name
FROM student s
FULL outer JOIN professor p ON s.profno = p.profno;

SELECT studno
    , s.name 
    --,decode(p.profno,NULL,'담당교수없음',p.profno)
    ,nvl(p.name,'담당교수없음')
FROM student s
LEFT outer JOIN professor p ON s.profno = p.profno
WHERE studno = 9715 OR studno = 9615;

SELECT name
    , case substr(tel, 1, instr(tel,')',1)-1) when '02' then '서울'
                                              when '031' then '경기도'
                                              when '051' then '부산'
                                              else '기타'
                                              END AS 거주지
FROM student;

SELECT name
    , jumin
    , CASE When substr(jumin,3,2) between '01' and '03' then '1/4분기'
           When substr(jumin,3,2) between '04' and '06' then '2/4분기'
           When substr(jumin,3,2) between '07' and '09' then '3/4분기'
           When substr(jumin,3,2) between '10' and '12' then '4/4분기'
      end "분기"
FROM student;

SELECT empno
    , ename
    , sal
    , CASE WHEN sal between '1' and '1000' then 'LEVEL 1'
           WHEN sal between '1001' and '2000' then 'LEVEL 2'
           WHEN sal between '2001' and '3000' then 'LEVEL 3'
           WHEN sal between '3001' and '4000' then 'LEVEL 4'
                                               ELSE 'LEVEL 5'
      END "LEVEL"
FROM emp;

SELECT job, count(*), sum(sal), round(avg(sal),1) avg
    , min(hiredate)
    , max(hiredate)
FROM emp
GROUP BY job;

SELECT *
FROM dept;

SELECT job 부서명, count(*)인원, sum(sal)평균급여, round(avg(sal),1)평균급여
FROM emp
GROUP BY job;

SELECT d.dname
    , sum(e.sal)
    , round(avg(e.sal + nvl(comm,01)),1)
    , count(*)
FROM emp e
JOIN dept d ON e.deptno = d.deptno
GROUP BY d.dname;

SELECT deptno
    ,job
    ,avg(sal)
    ,count(*)
FROM emp
GROUP BY job

union

SELECT deptno
    ,''
    ,round(avg(sal),1)
    ,count(*)
FROM emp
GROUP BY deptno
union

SELECT 99
    ,''
    ,avg(sal)
    ,count(*)
FROM emp
GROUP BY rollup(deptno,job)
ORDER BY 1;


SELECT dptno
    , null job
    , ROUND(AVG(sal),1)avg_sal
    , COUNT(*)cnt_emp
FROM emp
GROUP BY deptno
UNION ALL
SELECT dptno
    , null job
    , ROUND(AVG(sal),1)avg_sal
    , COUNT(*)cnt_emp
FROM emp
GROUP BY deptno
UNION ALL
SELECT dptno
    , null job
    , ROUND(AVG(sal),1)avg_sal
    , COUNT(*)cnt_emp
FROM emp
GROUP BY deptno
UNION ALL;

-----------------------
-- 게시판(BOARD)
-- 글번호, 제목, 작성자, 글내용, 작성시간--, 조회수, 수정시간, 수정자 ...
DROP TABLE board;
CREATE TABLE board (
-- 글번호, 제목, 작성자, 글내용
    board_no number(10) PRIMARY KEY, --글번호
    title varchar2(300) not null, -- 제목
    writer varchar2(50) not null, -- 작성자
    content varchar2(1000) not null, -- 글내용
    created_at date default sysdate--작성시간
);
ALTER TABLE board add (click_cnt number);
ALTER TABLE board modify content varchar2(1000);
desc board;

insert into board(board_no, title,writer,content)
VALUES(1, 'test', 'user1', '연습글입니다');
insert into board(board_no, title,writer,content)
VALUES(2, 'test1', 'user2', '연습글입니다');
insert into board(board_no, title,writer,content)
VALUES(3, 'test1', 'user2', '연습글입니다');
insert into board(board_no, title,writer,content)
VALUES(4, 'test1', 'user2', '연습글입니다');
SELECT *
FROM board;
commit;

UPDATE board
set writer = 'user03'
WHERE board_no = 3;

insert into board(board_no, title,writer,content)
VALUES(5, 'test1', 'user2', '연습글입니다');
