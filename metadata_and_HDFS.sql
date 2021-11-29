-----------------------------------------
-- BROWSING HDFS WITH HUE FILE BROWSER --
-----------------------------------------
-- metadata = schema, data (HDFS) = values
-- HDFS files can be delimited in many ways (tab delim. .txt files/comma delim. .csv files)

-- metadata is stored in metastore, and data stored in HDFS:
	-- QUERY ->> IMPALA/HIVE ->> METADATA (TABLE STRUCTURE) ->> DATA (HDFS)

-- to browse files in HDFS:
	-- hue -> menu -> files
    
-- 'warehouse' directory is where Hive/Impala store table data by default:
	-- /user/hive/warehouse

-- switch assist panel from SQL mode to HDFS mode (left pane) 

-----------------------------------------
-- BROWSING HDFS FROM THE COMMAND LINE --
-----------------------------------------

-- to access HDFS in command line:
	$ hdfs dfs 
    $ hdfs dfs ls /user/hive/warehouse/  -- lists directory
    $ hdfs dfs -cat /user/hive/warehouse/orders/order.txt  -- prints file to screen
    $ hdfs dfs -get /user/hive/warehouse/orders/order.txt .  -- downloads file
    $ hadoop fs  -- alternative syntax for accessing
    
----------------------------------------------
-- UNDERSTANDING S3 & OTHER CLOUD PLATFORMS --
----------------------------------------------
-- Amazon's storage service is called  'S3' ('Simple Storage Service')
-- S3 very similar to HDFS

-- S3 organizes data into 'buckets' which are like folders at the top or highest level of a file system
	-- must have a unique name
    -- can store files and folders
    
-- S3 can ONLY store data 
-- HDFS can store and process (Hive/Impala), this is called 'data locality'

-------------------------------------------
-- BROWSING S3 BUCKETS FROM COMMAND LINE --
-------------------------------------------
-- open terminal:
	$ hdfs dfs s3a:// (some environments use, s3:// or s3n://)
	$ hdfs dfs -ls s3a://training-coursea1/  -- list directory
	$ hdfs dfs -get s3a://training-coursea1/employees/employees.csv  -- download file
	$ hdfs dfs -cat s3a://training-coursea1/employees/employees.csv  -- print file to screen
    
-- can be impractical to install HDFS shell to access S3, so use AWS CLI (install using site):
	$ aws s3
    $ aws s3 ls s3://path/
	$ aws s3 cp s3://path/file .  -- downloads file like 'get'
    $ aws s3 cp s3://path/file -  -- prints file to screen (files won't be stored to local files system)


































