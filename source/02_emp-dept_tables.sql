/*================================================*/
/* Datenbanken I                                  */
/* Einführungsbeispiel                            */
/* Tabellen erzeugen                              */
/*================================================*/

/*================================================*/
/* Tabelle: DEPT                                  */
/*================================================*/
CREATE TABLE dept (
   deptno INT(2) NOT NULL,
   dname VARCHAR(14) NOT NULL,
   loc VARCHAR(13) NOT NULL,
   PRIMARY KEY (deptno)
);

/*================================================*/
/* Tabelle: EMP                                   */
/*================================================*/
CREATE TABLE emp (
   empno INT(4) NOT NULL,
   ename VARCHAR(10) NOT NULL,
   job VARCHAR(9) NOT NULL,
   mgr INT(4),
   hiredate DATE NOT NULL,
   sal DECIMAL(7,2) NOT NULL,
   comm DECIMAL(7,2),
   deptno INT(2) NOT NULL,
   PRIMARY KEY (empno),
   FOREIGN KEY (deptno) REFERENCES dept (deptno),
   FOREIGN KEY (mgr) REFERENCES emp (empno)
);

/*================================================*/
/* Index: RELATION_3_FK                           */
/*================================================*/
CREATE INDEX relation_3_fk ON emp (deptno ASC);

/*================================================*/
/* Index: RELATION_16_FK                          */
/*================================================*/
CREATE INDEX relation_16_fk ON emp (mgr ASC);