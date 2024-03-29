SELECT SERVERPROPERTY('productversion'), SERVERPROPERTY('productlevel'), SERVERPROPERTY('edition')

The results are:
- The product version (for example, 8.00.534).
- The product level (for example, "RTM" or "SP2").
- The edition (for example, "Standard Edition"). For example, the result looks similar to: "8.00.534 RTM Standard Edition"

Use the following table to identify your version:

    Release	            Sqlservr.exe
    SQL Server 2000 RTM	2000.80.194.0
    SQL Server 2000 SP1	2000.80.384.0
    SQL Server 2000 SP2	2000.80.534.0
    SQL Server 2000 SP3	2000.80.760.0
    SQL Server 2000 SP3a	2000.80.760.0
    SQL Server 2000 SP4	2000.8.00.2039
    SQL Server 2005 RTM	2005.90.1399
    SQL Server 2005 Service Pack 1	2005.90.2047
    SQL Server 2005 Service Pack 2	2005.90.3042
    
    
https://docs.microsoft.com/zh-CN/troubleshoot/sql/general/determine-version-edition-update-level


--- Execute Against the Master Database
SELECT CASE WHEN CHARINDEX('64', CAST(SERVERPROPERTY('Edition') AS
VARCHAR(100))) > 0
THEN 64
ELSE 32
END;

select @@version

Example output: 
Microsoft SQL Server 2008 R2 (SP1) - 10.50.2550.0 (X64)   Jun 11 2012 16:41:53   Copyright (c) Microsoft Corporation  Standard Edition (64-bit) on Windows NT 6.1 (Build 7601: Service Pack 1) 

