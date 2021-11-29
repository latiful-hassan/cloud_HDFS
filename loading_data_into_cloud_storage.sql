---------------------------------------------
-- LOADING FILES INTO S3 FROM COMMAND LINE --
---------------------------------------------
### HDFS COMMAND LINE ###
-- Delete: 	
	$ hdfs dfs -rm s3a://bucketname/path/file.ext
-- Copy (w/i S3 & HDFS -> S3):
	$ hdfs dfs -cp s3a://bucketnameold/path/file.ext s3a://bucketnamenew/path/file.ext
	$ hdfs dfs -cp hdfs:///bucketnameold/path/file.ext s3a://bucketnamenew/path/file.ext
-- Move (w/i S3 & HDFS -> S3):
	$ hdfs dfs -mv s3a://bucketnameold/path/file.ext s3a://bucketnamenew/path/file.ext
	$ hdfs dfs -mv hdfs:///bucketnameold/path/file.ext s3a://bucketnamenew/path/file.ext
-- Upload (local -> S3):
	$ hdfs dfs -put /source/path/file.ext s3a://bucketnamenew/path/file.ext
-- Create sub-dir. w/i S3 bucket:
	$ hdfs dfs -mkdir s3a://bucketname/directoryname
    $ hdfs dfs -rm s3a://bucketname/dir1 s3a://bucketname/dir2

### AWS CLI ###
### ONLY S3 ACCESS, DOES NOT ALLOW FOR HDFS ###
-- Delete: 	
	$ aws s3 rm s3://bucketname/path/file.ext
-- Copy:
	$ aws s3 cp s3://bucketnameold/path/file.ext s3://bucketnamenew/path/file.ext
-- Move (w/i S3 & HDFS -> S3):
	$ aws s3 mv s3://bucketnameold/path/file.ext s3://bucketnamenew/path/file.ext
	$ aws s3 mv /source/path/file.ext s3://bucketnamenew/path/file.ext
-- Upload:
	$ aws s3 cp /source/path/file.ext s3://bucketnamenew/path/file.ext
-- Create sub-dir.:
	-- there is not equiv. of -mkdir (cp and mv created sub-dir. automatically)

--------------------
-- MISSING VALUES --
--------------------
-- when data is stored in delim. externally to Hive/Impala, NULL can be assign to empty string ('')
-- use table property clause to solve this:
	TBLPROPERTIES ('serialization.null.format' = '')
    ALTER TABLE names SET TBLPROPERTIES ('serialization.null.format' = '');
-- good practice to represent NULL as '\N' in data files before storing in table dir.











































































