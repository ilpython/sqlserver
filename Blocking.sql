Script to Find All the Blocked Processes:

SELECT
spid,
status,
loginame=SUBSTRING(loginame,1,12),
hostname=SUBSTRING(hostname,1, 12),
blk = CONVERT(char(3), blocked),
dbname=SUBSTRING(DB_NAME(dbid),1, 10),
cmd,
waittype
FROM master.dbo.sysprocesses
WHERE spid IN (SELECT blocked FROM master.dbo.sysprocesses)

Script to Identify the blocking query:

SELECT
db.name DBName,
tl.request_session_id,
wt.blocking_session_id,
OBJECT_NAME(p.OBJECT_ID) BlockedObjectName,
tl.resource_type,
h1.TEXT AS RequestingText,
h2.TEXT AS BlockingTest,
tl.request_mode
FROM sys.dm_tran_locks AS tl
INNER JOIN sys.databases db ON db.database_id = tl.resource_database_id
INNER JOIN sys.dm_os_waiting_tasks AS wt ON tl.lock_owner_address =wt.resource_address
INNER JOIN sys.partitions AS p ON p.hobt_id =tl.resource_associated_entity_id
INNER JOIN sys.dm_exec_connections ec1 ON ec1.session_id =tl.request_session_id
INNER JOIN sys.dm_exec_connections ec2 ON ec2.session_id =wt.blocking_session_id
CROSS APPLY sys.dm_exec_sql_text(ec1.most_recent_sql_handle) AS h1
CROSS APPLY sys.dm_exec_sql_text(ec2.most_recent_sql_handle) AS h2
GO

 Script to view all current processes / sessions on the server:

select * from master.dbo.sysprocesses
