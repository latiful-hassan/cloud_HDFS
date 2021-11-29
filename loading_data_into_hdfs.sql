------------------------------------------------------
-- LOADING FILES INTO HDFS WITH HUE'S TABLE BROWSER --
------------------------------------------------------
### Load New Table ###
-- table brows. > new table > upload > format > dest/prop/storedefault > INVALIDATE METADATA tab > query

### Load Data Into Directory of Existing Table ###
-- table brows. > table > import data > upload > override(Y/N) > REFRESH tab

-----------------------------------------------------
-- LOADING FILES INTO HDFS WITH HUE'S FILE BROWSER --
-----------------------------------------------------
-- allows you to load data into any directory, not just storage directories for tables
-- table brows. > table > location > upload (files)
-- can copy files to another location
-- edit file in file browser to remove headers (REFRESH after)
-- data course panel (left) can be used to upload aswell (plus sign)

---------------------------------------------------
-- LOADING FILES INTO HDFS FROM THE COMMAND LINE --
---------------------------------------------------
-- more systematic way and can be scripted to schedule it and make it more reproduceable

-- remove file: 
	$ hdfs dfs -rm /path/
-- copy file to another dir.: 
	$ hdfs dfs -cp /old/path/ /new/path/
-- move file within HDFS: 
	$ hdfs dfs -mv
-- delete all files in dir.: 
	-- $ hdfs dfs -rm /path/*
-- upload files from local dir. to HDFS: 
	$ hdfs dfs -put /old/path/ /new/path/
-- upload multiple files with common name: 
	-- $ hdfs dfs -put /old/path/*file /new/path/
-- always REFRESH after

---------------------------------
-- MORE ON HDFS SHELL COMMANDS --
---------------------------------
-- create parent dir.: 
	$ hdfs dfs -p
-- create dir. under parent dir.: 
	$ hdfs dfs -mkdir
-- delete dir. and all sub-dir.: 
	$ hdfs dfs -r

-- /path/to/directory/ or /path/to/directory/file/ is 'unqualified path'
-- depending on config. you must quality fully e.g.:
	hdfs://hostname/path/to/directory/file.ext
    hdfs://hostname.domain/path/to/directory/file.ext

-- HDFS has 'trash' dir. (must be enabled) for recently deleted files:
	$ hdfs dfs -skipTrash -- bypass trash and delete file immediately

---------------------------------------------
-- CHAINING & SCRIPTING WITH HDFS COMMANDS --
---------------------------------------------
-- can use | (pipe) to chain commands

### Viewing First Few Lines of File ###
	$ hdfs dfs -cat /path/to/file.txt | head

### Loading Data Without the Header Line ###
	$ tail -n +2 source_file.txt | hdfs dfs -put - /path/to/destination_file.txt

### remove header line when copying a file in the opp.direction (HDFS to local file system) ###
	$ hdfs dfs -cat /path/to/source_file.txt | tail -n +2 > destination_file.txt












































