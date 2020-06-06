--liquibase formatted sql
--changeset developer:2
--comment update bonuses table
MERGE INTO bonuses b USING employees e
    ON ( b.employee_id = e.employee_id) 
    WHEN MATCHED THEN
        UPDATE SET b.bonus = e.salary * .05;

MERGE INTO bonuses B
  USING (SELECT employee_id, salary, department_id FROM employees
         WHERE department_id = 80) E
  ON (B.employee_id = E.employee_id)
  WHEN MATCHED THEN UPDATE SET B.bonus = B.bonus + E.salary * .01
  WHEN NOT MATCHED THEN INSERT (B.employee_id, B.bonus)
    VALUES (E.employee_id, E.salary * 0.1);

--rollback select null from dual;
