quibase formatted sql
--changeset architect:4
--comment cannot decrease employee salary
CREATE OR REPLACE TRIGGER  trg_employees_relegation
before update
on employees
for each row
begin
   if  :old.salary > :new.salary then
         raise_application_error(-20123,'Salary can not be decreased');
   end if;
end;
/
ALTER TRIGGER trg_employees_relegation ENABLE
/

--rollback drop trigger trg_employees_relegation;
