set linesize 120
column OBJECT_NAME format a30

select OBJECT_NAME, OBJECT_TYPE from USER_OBJECTS where CREATED >= sysdate - (10/1440) order by 1,2;

column AUTHOR format a10
column FILENAME format a22
column TAG format a15
column COMMENTS format a50

select AUTHOR, FILENAME, ORDEREXECUTED, TAG, COMMENTS from DATABASECHANGELOG order by 3;

exit;
