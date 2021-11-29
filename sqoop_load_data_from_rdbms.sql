--------------------------------
-- USING SQOOP TO IMPORT DATA --
--------------------------------
/* 
Apache Sqoop is an open source tool that was originally created at Cloudera. Its name comes from the contraction 
of “SQL to Hadoop”; it moves data between a relational database management system (RDBMS) and HDFS. For example, 
it can import all the tables from a database, just one table, or just part of a table, such as specific columns or
 specific rows. It can also export data from HDFS to a relational database.
*/

-- sqoop import command used to import data of single table in RDBMS to HDFS dir.:
	$ sqoop import \
    --connect jdbc:mysql://localhost/company \
    --username jdoe \
    --password bigsecret \
    --table customers

-- import all tables:
	$ sqoop import-all-tables \
    --connect jdbc:mysql://localhost/company \
    --username jdoe \
    --password bigsecret

-- include following setting after 'import' if table does not have PK:
	-Dorg.apache.sqoop.splitter.allow_text_splitter=true

-- --target-dir specifies HDFS dir.:
	$ sqoop import \
        --connect jdbc:mysql://localhost/company \
        --username jdoe \
        --password bigsecret \
        --table customers \
        --target-dir /mydata/customers

-- --warehouse-dir specifies HDFS parent dir.:
	$ sqoop import \
        --connect jdbc:mysql://localhost/company \
        --username jdoe \
        --password bigsecret \
        --table customers \
        --warehouse-dir /mydata

-- --fields-terminated-by specifies delim. b/w columns:
	 $ sqoop import \ 
        --connect jdbc:mysql://localhost/company \
        --username jdoe \
        --password bigsecret \
        --table customers \
        --fields-terminated-by '\t'

-- --columns specifies particular columns to import:
	$ sqoop import \
        --connect jdbc:mysql://localhost/company \
        --username jdoe \
        --password bigsecret \
        --table products \
        --columns "prod_id,name,price"

-- --where provides filter to import only specific rows:
	$ sqoop import \
        --connect jdbc:mysql://localhost/company \
        --username jdoe \
        --password bigsecret \
        --table products \
        --columns "prod_id,name,price" \
        --where "price >= 1000"

--------------------------------
-- USING SQOOP TO EXPORT DATA --
--------------------------------

-- export to RDBMS:
	$ sqoop export \
        --connect jdbc:mysql://localhost/company \
        --username jdoe \
        --password bigsecret \
        --table product_recommendations \
        --export-dir /mydata/recommender_output



























