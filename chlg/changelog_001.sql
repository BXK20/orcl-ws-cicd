--liquibase formatted sql
--changeset developer:1
--comment create bonuses table
CREATE TABLE bonuses (
    employee_id NUMBER(6,0) NOT NULL,
    bonus NUMBER(8,2) DEFAULT 100
);

INSERT INTO bonuses(employee_id) (
    SELECT employee_id
    FROM employees
    WHERE salary < 10000
);

--rollback drop table bonuses;
