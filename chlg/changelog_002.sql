--liquibase formatted sql
--changeset architect:3
--comment changes on employees only in business hours
CREATE OR REPLACE TRIGGER  trg_employees_changes
before update or insert or delete
on employees
for each row
begin
   if  to_char(sysdate,'hh24') < 6 or to_char(sysdate,'hh24') > 10 then
         raise_application_error(-20234,'No changes allowed before 9 AM and after 6 PM');
   end if;
end;
/
ALTER TRIGGER trg_employees_changes ENABLE
/

--rollback drop trigger trg_employees_changes;
