/*================================================*/
/* Datenbanken I                                  */
/* Einführungsbeispiel                            */
/* Daten in Demotabellen einfügen                 */
/*================================================*/

-- -----------
-- Abteilungen
-- -----------

INSERT INTO dept (deptno, dname, loc) VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO dept (deptno, dname, loc) VALUES (20, 'RESEARCH', 'DALLAS');
INSERT INTO dept (deptno, dname, loc) VALUES (30, 'SALES', 'CHICAGO');
INSERT INTO dept (deptno, dname, loc) VALUES (40, 'OPERATIONS', 'BOSTON');

-- -----------
-- Angestellte
-- -----------

INSERT INTO emp (empno, ename, job, hiredate, sal, comm, deptno)
VALUES (7369, 'SMITH', 'CLERK', STR_TO_DATE('17-DEC-1980', '%d-%b-%Y'), 800, NULL, 20);

INSERT INTO emp (empno, ename, job, hiredate, sal, comm, deptno)
VALUES (7499, 'ALLEN', 'SALESMAN', STR_TO_DATE('20-FEB-1981', '%d-%b-%Y'), 1600, 300, 30);

INSERT INTO emp (empno, ename, job, hiredate, sal, comm, deptno)
VALUES (7521, 'WARD', 'SALESMAN', STR_TO_DATE('22-FEB-1981', '%d-%b-%Y'), 1250, 500, 30);

INSERT INTO emp (empno, ename, job, hiredate, sal, comm, deptno)
VALUES (7566, 'JONES', 'MANAGER', STR_TO_DATE('2-APR-1981', '%d-%b-%Y'), 2975, NULL, 20);

INSERT INTO emp (empno, ename, job, hiredate, sal, comm, deptno)
VALUES (7654, 'MARTIN', 'SALESMAN', STR_TO_DATE('28-SEP-1981', '%d-%b-%Y'), 1250, 1400, 30);

INSERT INTO emp (empno, ename, job, hiredate, sal, comm, deptno)
VALUES (7698, 'BLAKE', 'MANAGER', STR_TO_DATE('1-MAY-1981', '%d-%b-%Y'), 2850, NULL, 30);

INSERT INTO emp (empno, ename, job, hiredate, sal, comm, deptno)
VALUES (7782, 'CLARK', 'MANAGER', STR_TO_DATE('9-JUN-1981', '%d-%b-%Y'), 2450, NULL, 10);

INSERT INTO emp (empno, ename, job, hiredate, sal, comm, deptno)
VALUES (7788, 'SCOTT', 'ANALYST', STR_TO_DATE('09-DEC-1982', '%d-%b-%Y'), 3000, NULL, 20);

INSERT INTO emp (empno, ename, job, hiredate, sal, comm, deptno)
VALUES (7839, 'KING', 'PRESIDENT', STR_TO_DATE('17-NOV-1981', '%d-%b-%Y'), 5000, NULL, 10);

INSERT INTO emp (empno, ename, job, hiredate, sal, comm, deptno)
VALUES (7844, 'TURNER', 'SALESMAN', STR_TO_DATE('8-SEP-1981', '%d-%b-%Y'), 1500, 0, 30);

INSERT INTO emp (empno, ename, job, hiredate, sal, comm, deptno)
VALUES (7876, 'ADAMS', 'CLERK', STR_TO_DATE('12-JAN-1983', '%d-%b-%Y'), 1100, NULL, 20);

INSERT INTO emp (empno, ename, job, hiredate, sal, comm, deptno)
VALUES (7900, 'JAMES', 'CLERK', STR_TO_DATE('3-DEC-1981', '%d-%b-%Y'), 950, NULL, 30);

INSERT INTO emp (empno, ename, job, hiredate, sal, comm, deptno)
VALUES (7902, 'FORD', 'ANALYST', STR_TO_DATE('3-DEC-1981', '%d-%b-%Y'), 3000, NULL, 20);

INSERT INTO emp (empno, ename, job, hiredate, sal, comm, deptno)
VALUES (7934, 'MILLER', 'CLERK', STR_TO_DATE('23-JAN-1982', '%d-%b-%Y'), 1300, NULL, 10);

-- -----------
-- Aktualisierungen (Manager-Zuweisungen)
-- -----------
UPDATE emp SET mgr = 7902 WHERE empno = 7369;
UPDATE emp SET mgr = 7698 WHERE empno = 7499;
UPDATE emp SET mgr = 7698 WHERE empno = 7521;
UPDATE emp SET mgr = 7839 WHERE empno = 7566;
UPDATE emp SET mgr = 7698 WHERE empno = 7654;
UPDATE emp SET mgr = 7839 WHERE empno = 7698;
UPDATE emp SET mgr = 7839 WHERE empno = 7782;
UPDATE emp SET mgr = 7566 WHERE empno = 7788;
UPDATE emp SET mgr = 7698 WHERE empno = 7844;
UPDATE emp SET mgr = 7788 WHERE empno = 7876;
UPDATE emp SET mgr = 7698 WHERE empno = 7900;
UPDATE emp SET mgr = 7566 WHERE empno = 7902;
UPDATE emp SET mgr = 7782 WHERE empno = 7934;

-- -----------
-- Transaktion abschliessen
-- -----------
COMMIT;