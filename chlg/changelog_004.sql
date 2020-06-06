--liquibase formatted sql
--changeset developer:5
--comment create function to calculate experience
CREATE OR REPLACE FUNCTION experience(employee_id NUMBER)
  RETURN VARCHAR2
IS
  l_years NUMBER;
  l_months NUMBER;
BEGIN
  select trunc(months_between(sysdate,HIRE_DATE) / 12) into l_years,
         trunc(months_between(sysdate,HIRE_DATE) -
            (trunc(months_between(sysdate,HIRE_DATE) / 12) * 12)) into l_months

  RETURN ('Employee ID ' || employee_id || ' has ' || l_years || ' years and ' || l_months || ' months of experience.' );
END experience;
/

--rollback drop function experience;
