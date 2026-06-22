# Questions 第4回

- Source: `C:\Users\motok\Desktop\Databricks DEA\Exam Guide\split_questions\questions_第4回.md`
- Count: 55
- ID format: P4-Q001

## P4-Q001

### カテゴリ

Section 6: Troubleshooting, Monitoring, and Optimization（10%）

### 設問

A data architect is designing a hybrid data platform that must securely connect to on-premises databases. These databases need to be queried using SQL from within Databricks, and the platform must remain within the enterprise's custom-defined network for compliance reasons.

Which compute type should the architect choose to support this architecture?

### 選択肢

Pro SQL Warehouse

Serverless compute for jobs

Serverless compute for notebooks

Serverless SQL Warehouse

## P4-Q002

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 設問

In Lakeflow Jobs, which compute option helps reduce operational overhead and idle cluster costs?

### 選択肢

Classic all-purpose compute

Serverless jobs compute

Classic jobs compute

SQL warehouses

## P4-Q003

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 設問

A data engineer needs to enforce that age is greater than 18 on an existing Delta table named users;

Which SQL statement correctly adds this constraint?

### 選択肢

ALTER TABLE users CHECK (age > 18)

ALTER TABLE users ALTER COLUMN age SET (age > 18);

ALTER TABLE users ADD CONSTRAINT eligible_adult CHECK (age > 18)

ADD CONSTRAINT eligible_adult ON TABLE users CHECK (age > 18)

## P4-Q004

### カテゴリ

Section 5: Implementing CI/CD（10%）

### 設問

An IoT platform stores device telemetry in a bronze table. The column payload is a STRING containing JSON data like:

{"device_id":"A1","temperature":22.5","humidity":60}

A data engineer needs to extract fields for a silver table so they can be queried efficiently.

Which TWO queries correctly extract data from the JSON?

### 選択肢

SELECT get_json_object(payload, '$.device_id') AS device_id,
       get_json_object(payload, '$.temperature') AS temperature
FROM bronze_iot; 
SELECT from_json(payload,
                 'device_id STRING, temperature STRING, humidity STRING') AS parsed_payload
FROM bronze_iot:
SELECT json_extract(payload, 'device_id') AS device_id,
       json_extract(payload, 'temperature') AS temperature
FROM bronze_iot;

SELECT payload:device_id AS device_id,
       payload:temperature AS temperature
FROM bronze_iot;
SELECT payload.device_id AS device_id,
       payload.temperature AS temperature
FROM bronze_iot;

## P4-Q005

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 設問

A data engineer is tasked with calculating both the total and average salary of employees, grouped by their department. They use PySpark’s groupBy and wish to apply multiple aggregations to each group.

Complete the following code snippet:

result_df = df.groupBy("department").____________(  
    sum("salary").alias("total_salary"),  
    avg("salary").alias("average_salary")  
)

What function should be used to complete the code?

### 選択肢

agg

withColumn

select

filter

## P4-Q006

### カテゴリ

Section 7: Governance and Security（15%）

### 設問

A data engineer uses the Catalog Explorer in the Databricks workspace to manage object privileges in Unity Catalog for a retail company, as follows:

On catalog sales, they open Permissions and grant USE CATALOG to retail-analysts

On schema transactions, they open Permissions and grant USE SCHEMA to retail-analysts

On the table daily_revenue, they open Permissions and grant SELECT to retail-analysts

Which of the following correctly describe the result of these actions?

### 選択肢

The retail-analysts group will be able to query all tables in the transactions schema because USE SCHEMA automatically grants SELECT on every table in the schema.

The retail-analysts group will be able to read data from daily_revenue using SQL warehouses, but will not be able to create, alter, or delete objects in the sales catalog or transactions schema.

The permissions configured through the Catalog Explorer UI will not take effect until the data engineer executes the generated GRANT SQL commands manually in the Databricks SQL editor.

The retail-analysts group will be able to create new tables in the transactions schema because they were granted both USE CATALOG and USE SCHEMA.

## P4-Q007

### カテゴリ

Section 5: Implementing CI/CD（10%）

### 設問

A data engineer has deployed a bundle with a job resource keyed as sales_job and wants to execute it in the target workspace.

Which Databricks CLI command can the data engineer use to achieve this goal?

### 選択肢

databricks bundle deploy --run sales_job

databricks bundle run sales_job

databricks bundle trigger sales_job

databricks bundle execute sales_job

## P4-Q008

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 設問

A junior data engineer is exploring a large dataset in Databricks and executes df.describe() to better understand the data.

A senior data engineer suggested using df.summary() instead.

Which advantage does df.summary() provide over df.describe() for data exploration?

### 選択肢

df.summary() generates visual charts and interactive plots for each column in the dataset.

df.summary() automatically cleans null values and removes outliers before computing statistics.

df.summary() offers an AI-generated summary of the dataset that provides insights, patterns, and recommendations based on the underlying data values.

df.summary() provides extended statistics such as approximate quartiles (25%, 50%, 75%), which are not available in df.describe().

## P4-Q009

### カテゴリ

Section 7: Governance and Security（15%）

### 設問

A finance data analyst requires read-only access to all existing and future tables within the Unity Catalog schema enterprise.reporting. Access must be limited exclusively to this schema, with no permissions granted to other schemas in the enterprise catalog.

Which SQL commands will correctly grant this access?

### 選択肢

GRANT USE SCHEMA ON SCHEMA enterprise.reporting TO finance-analyst;  
GRANT USE CATALOG ON CATALOG enterprise TO finance-analyst;
GRANT BROWSE ON SCHEMA enterprise.reporting TO finance-analyst;  
GRANT USE SCHEMA ON SCHEMA enterprise.reporting TO finance-analyst;  
GRANT USE CATALOG ON CATALOG enterprise TO finance-analyst;
GRANT SELECT ON CATALOG enterprise TO finance-analyst; 
GRANT USE SCHEMA ON CATALOG enterprise TO finance-analyst; 
GRANT USE CATALOG ON CATALOG enterprise TO finance-analyst;

GRANT SELECT ON SCHEMA enterprise.reporting TO finance-analyst;  
GRANT USE SCHEMA ON SCHEMA enterprise.reporting TO finance-analyst;  
GRANT USE CATALOG ON CATALOG enterprise TO finance-analyst;

## P4-Q010

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 設問

A data engineer is working with a PySpark DataFrame called productsDf that contains multiple columns, including one named price. They want to return all columns from the DataFrame while displaying the price column with a temporary alias unit_price in the query output, without modifying the original DataFrame schema.

Which PySpark code fragment meets this requirement?

### 選択肢

productsDf = productsDf.withColumnRenamed("price", "unit_price")

productsDf.selectExpr("price as unit_price")

productsDf.select(col("*"), col("price").alias("unit_price"))

productsDf.select(col("price").alias("unit_price"))

## P4-Q011

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

A data engineer converts an external Delta table into a managed table in a production environment using the ALTER TABLE ... SET MANAGED command. After the conversion is completed, the streaming query stops receiving new data with the following error:

“DELTA_STREAMING_INTERRUPTED_BY_MANAGED_TABLE_CONVERSION: The table at <path> has been converted to a Unity Catalog managed table. The stream has been stopped to ensure data consistency.”

How should the data engineer fix this issue?

### 選択肢

Roll back the converted managed table to an external table as this feature is supported by the SET MANAGED command.

Restart the stream and it will automatically resume from the last committed offset using the converted table.

Run the REPAIR TABLE command to update the checkpointing offset of the converted table.

Run the VACUUM command on the converted table to remove stale files and restore streaming state.

## P4-Q012

### カテゴリ

Section 6: Troubleshooting, Monitoring, and Optimization（10%）

### 設問

A data engineer is optimizing a Spark job in Databricks that joins a large fact table with a small dimension table. They want to ensure that Spark automatically sends small tables up to 100 MB to all executors to improve join performance. What configuration should they set?

### 選択肢

spark.conf.set("spark.sql.broadcastTimeout", 100)

spark.conf.set("spark.executor.memory", 104857600)

spark.conf.set("spark.sql.shuffle.partitions", 100)

spark.conf.set("spark.sql.autoBroadcastJoinThreshold", 104857600)

## P4-Q013

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

Which of the following techniques allows Auto Loader to track the ingestion progress and store metadata of the discovered files ?

### 選択肢

Photon engine

Checkpointing

COPY INTO

Watermarking

## P4-Q014

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

A data engineer needs to use Auto Loader to ingest JSON files that may contain new fields over time.

How should Auto Loader be configured to allow the table schema to evolve as new columns are detected during processing?

### 選択肢

Auto Loader cannot detect the addition of new columns in input files during processing.

Set inferColumnTypes to true to automatically detect new columns with their data types.

Set mergeSchema to true to enable Delta Lake merge schemas during writes

Configure cloudFiles.schemaLocation, and set cloudFiles.schemaEvolutionMode=addNewColumns to support automatic schema evolution

## P4-Q015

### カテゴリ

Section 7: Governance and Security（15%）

### 設問

A data engineer has converted an external table to a managed table using the ALTER TABLE ... SET MANAGED command.

What are the key advantages of using SET MANAGED for this conversion?

Choose 2 answers

### 選択肢

Immediately deletes the original external storage location after conversion to save storage costs.

Continues using the original external location as the single source of truth for both reads and writes after conversion.

Syncs both managed and external locations in parallel to support dual-write consistency after conversion.

Supports rolling back the converted managed table to an external table.

Redirects path-based reads and writes to allow legacy code to function after conversion.

## P4-Q016

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

A data engineer is building a Lakeflow Spark Declarative Pipeline (formerly Delta Live Tables) to process product sales data. The pipeline needs to enforce the following data quality rules:

valid_products = {"valid_id": "products_id IS NOT NULL", "recent_sales": "date >= '2025-01-01", "quantity_within_range": "quantity BETWEEN 0 AND 1000"}

Any invalid records should still be written to the target, while metrics about these violations are captured by the pipeline.

Which of the following configurations would satisfy these requirements?

### 選択肢

@dp.table

@dp.expect_or_drop(valid_products)

def silver_sales():

    return spark.readStream("bronze_sales")

@dp.table

@dp.expect_or_fail(valid_products)

def silver_sales():

    return spark.readStream("bronze_sales")

@dp.table

@dp.expect_all(valid_products)

def silver_sales():

    return spark.readStream("bronze_sales")

@dp.table

@dp.expect(valid_products)

def silver_sales():

    return spark.readStream("bronze_sales")

## P4-Q017

### カテゴリ

Section 7: Governance and Security（15%）

### 設問

A data engineer is asked to investigate why a Lakeflow Job experienced a gradual increase in execution duration over several production runs. The engineer needs a feature that visualizes execution trends and compares metrics from prior job executions. Which option should be selected?

### 選択肢

Dashboards

Catalog Explorer

Run History

Query History

## P4-Q018

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 設問

Which of the following locations hosts the Databricks workspace web application?

### 選択肢

Data plane

Customer Cloud Account

Control plane

Databricks-managed cluster

## P4-Q019

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 設問

What is the primary benefit of using spot instances in Databricks clusters?

### 選択肢

Guaranteed job execution time

Significantly lower compute costs

Increased security and compliance

Reduced data storage latency

## P4-Q020

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

Given the following Structured Streaming query:

(spark.readStream
        .table("cleanedOrders")
        .groupBy("productCategory")
        .agg(sum("totalWithTax"))
    .writeStream
        .option("checkpointLocation", checkpointPath)
        .outputMode("complete")
        .table("aggregatedOrders")
)

Which of the following best describe the purpose of this query in a Medallion Architecture?

### 選択肢

The query is performing raw data ingestion into a Bronze table

The query is performing data transfer from a Gold table into a production application

The query is performing a hop from Silver layer to a Gold table

The query is performing a hop from a Bronze table to a Silver table

## P4-Q021

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

A data engineer is building a Lakeflow Spark Declarative Pipeline (SDP) to ingest data from a PostgreSQL database, and want to use a streaming table for near-real-time analytics. The engineer assumes that streaming tables can directly enable continuous ingestion from JDBC sources.

Which statement is correct regarding this assumption?

### 選択肢

Streaming tables support continuous JDBC ingestion from PostgreSQL

PostgreSQL can be consumed directly like Kafka in streaming tables

JDBC sources are automatically treated as streaming sources in SDP

PostgreSQL ingestion is only supported via batch JDBC, not native streaming

## P4-Q022

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

Which of the following will utilize Gold tables as their source?

### 選択肢

Auto loader

Bronze tables

Silver tables

Dashboards

## P4-Q023

### カテゴリ

Section 7: Governance and Security（15%）

### 設問

A data engineering team is working on a user activity events table stored in Unity Catalog. Queries often involve filters on multiple columns like user_id and event_date.

Which data layout technique should the team implement to avoid expensive table scans?

### 選択肢

Use Z-order indexing on the user_id

Use partitioning on the event_date column.

Use partitioning on the user_id column, along with Z-order indexing on the event_date column.

Use liquid clustering on the combination of user_id and event_date

## P4-Q024

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 設問

Which of the following SQL commands will append this new row to the existing Delta table users?

### 選択肢

INSERT VALUES (“0015”, “Adam”, 23) INTO users

INSERT INTO users VALUES (“0015”, “Adam”, 23)

APPEND INTO users VALUES (“0015”, “Adam”, 23)

APPEND VALUES (“0015”, “Adam”, 23) INTO users

## P4-Q025

### カテゴリ

Section 6: Troubleshooting, Monitoring, and Optimization（10%）

### 設問

Which of the following compute resources is available in Databricks SQL?

### 選択肢

SQL engines

Single-node clusters

SQL warehouses

Multi-nodes clusters

## P4-Q026

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

Which of the following services provides a data warehousing solution in the Databricks Intelligence Platform?

### 選択肢

Lakeflow Connect

SQL warehouse

Databricks SQL

Unity Catalog

## P4-Q027

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 設問

The engineering team is managing a large Delta Lake table with frequent updates and deletes. They notice that query performance is degrading over time due to an increase in small data files. To address this, they decide to run the OPTIMIZE command with Z-Order indexing on columns frequently used in filters.

What type of resource optimization should the engineering team prioritize to ensure these commands execute efficiently?

### 選択肢

Storage Optimized

Memory Optimized

Compute Optimized

GPU Optimized

## P4-Q028

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

A data engineering team is ingesting JSON logs from cloud storage into a Delta table using the following code:

COPY INTO target_table
FROM 'abfss://logs@staging.dfs.core.windows.net/'
FILEFORMAT = JSON
____________;

The source contains both old and newly updated files and the team wants to filter them by their last modification time to load only recent files.

Which option correctly fills in the blank to meet the specified requirement?

### 選択肢

FORMAT_OPTIONS ('modificationTime'  >  'ts')

FORMAT_OPTIONS (file.modification_time  >  'ts')

FORMAT_OPTIONS ('modifiedAfter'  =  'ts')

FORMAT_OPTIONS (_metadata.file_modification_time  >  'ts’)

## P4-Q029

### カテゴリ

Section 5: Implementing CI/CD（10%）

### 設問

A global airline stores flight booking events from multiple countries. Booking timestamps are recorded in local airport time zones.

To ensure accurate reporting and customer activity tracking, how should timestamps be standardized?

### 選択肢

Keep timestamps in local time and apply timezone conversion only in BI tools

Store all timestamps as TIMESTAMP type in UTC

Store timestamps without timezone context

Store all timestamps as STRING type for readability

## P4-Q030

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 設問

A data engineer is validating incoming transaction data in a Databricks SQL pipeline. Some records contain unexpected symbols in numeric fields. The engineer runs the following query:

SELECT COALESCE(TRY_CAST("100$" AS INT), 0)

Which of the following describes the result of this query?

### 選択肢

NULL

An error is thrown

0

100

## P4-Q031

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

A data engineer wants to develop a standard connector using Lakeflow Connect to ingest sales transactions into a Unity Catalog table nightly. The engineer needs to retain historical data in the table for 30 days, while preventing duplicates across repeated loads.

Which command can the data engineer use to meet these requirements?

### 選択肢

INSERT OVERWRITE

MERGE INTO

COPY INTO

INSERT INTO

## P4-Q032

### カテゴリ

Section 5: Implementing CI/CD（10%）

### 設問

A data engineer uses Declarative Automation Bundles (formerly Databricks Asset Bundles) to manage workflows across dev and prod environments.

The CI/CD process must verify bundle configurations on dev for every pull request. On merges to the prod branch, the system should automatically deploy to production.

Which set of actions meets these requirements?

### 選択肢

In PR pipelines, execute databricks bundle deploy -t dev –verify;

On prod, execute databricks bundle deploy -t prod

In PR pipelines, execute databricks bundle run validate -t dev;

On prod, execute databricks bundle run deploy -t prod

In PR pipelines, execute databricks bundle deploy -t dev;

On prod, execute databricks bundle run validate -t prod

In PR pipelines, execute databricks bundle validate -t dev;
On prod, execute databricks bundle deploy -t prod

## P4-Q033

### カテゴリ

Section 5: Implementing CI/CD（10%）

### 設問

A data engineering team is building a reusable product filtering query in Databricks SQL. The query must accept a runtime input value for product_id using a named parameter called “pid” so that different values can be passed without changing the SQL logic. Which query correctly defines and uses the named parameter?

### 選択肢

SELECT *
FROM products
WHERE product_id = ${var.pid};
SELECT *
FROM products
WHERE product_id = pid;
SELECT *
FROM products
WHERE product_id = $pid;

SELECT *
FROM products
WHERE product_id = :pid;

## P4-Q034

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

A data engineer is using the following Auto Loader stream to incrementally ingest JSON files from an object cloud storage into a Delta table:

spark.readStream
        .format("cloudFiles")
        .option("cloudFiles.format", "json")
        _____________________________
        .load(cloud_storage_path)
     .writeStream
        .option("checkpointLocation", checkpoint_path)
        .toTable(target_table)

Files may occasionally be re-uploaded under the same path and filename to apply data corrections. Which option correctly fills in the blank in order to load those corrections into the table?

### 選択肢

.option("cloudFiles.includeExistingFiles", "true")

.option("mergeSchema", "true")

.option("cloudFiles.allowOverwrites", "true")

.option("cloudFiles.force", "true")

## P4-Q035

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 設問

A data engineer has a custom-location schema named db_hr, and they want to know where this schema was created in the underlying storage.

Which of the following commands can the data engineer use to complete this task?

### 選択肢

DESCRIBE EXTENDED db_hr

SELECT location FROM db_hr.db

DESCRIBE DATABASE db_hr

DESCRIBE db_hr

## P4-Q036

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

A healthcare analytics company receives medical imaging metadata files every few seconds into cloud object storage. Due to compliance requirements, the storage location has accumulated thousands of archived JSON files over several months. The engineering team wants a streaming ingestion solution that can:

Process all archived files exactly once

Automatically detect new incoming files in near real time

Minimize storage API calls and metadata listing overhead

Which ingestion strategy is most appropriate?

### 選択肢

Use COPY INTO initially to efficiently process the existing files, then use Auto Loader with file notification mode to process new files.

Use Auto Loader with file notification mode to enable event-based file detection for current and future files.

Use a CTAS statement initially to load the existing files in batch mode, then use Auto Loader to incrementally process new files.

Use Auto Loader in directory listing mode because archived files must always be discovered through full directory scans before streaming can begin.

## P4-Q037

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 設問

A data engineer is cleaning transaction data before loading it into a silver table. To improve data quality, the engineer uses the following PySpark command:

df.na.drop(how='all')

What is the effect of this operation?

### 選択肢

Replaces all null values with empty strings

Removes rows where all columns are non-null

Removes rows where any column contains a null value

Removes rows only when all columns in the row are null

## P4-Q038

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 設問

Given the following table faculties

Fill in the following blank to get the students enrolled in less than 3 courses from the array column students

SELECT
  faculty_id,
  students,
  ___________ AS few_courses_students
FROM faculties

FILTER (students, total_courses < 3)

TRANSFORM (students, total_courses < 3)

TRANSFORM (students, i -> i.total_courses < 3)

### 選択肢

FILTER (students, i -> i.total_courses < 3)

## P4-Q039

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

A data engineering team needs to sync sales data from Snowflake into Databricks every 6 hours. Only records that have changed should be ingested to avoid unnecessary processing and duplication.

Which ingestion approach best meets this requirement?

### 選択肢

Structured Streaming ingestion from Snowflake

Export Snowflake data to files and append it to the target table every 6 hours

Incremental ingestion using Lakeflow managed connector for Snowflake

Full refresh of the Snowflake table every 6 hours

## P4-Q040

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

A production environment has an S3 bucket receiving thousands of image files daily in different formats (.png, .jpg, .gif). A data engineer has been tasked with modifying the following streaming ingestion script to ensure only .jpg files are processed.

df = spark.readStream
           .format("cloudFiles") \
           .option("cloudFiles.format", "binaryFile") \
           .option("_____________", "*.jpg") \
           .load("s3://shop/raw/invoices/")

Which option correctly fills in the blank to meet the specified requirement ?

### 選択肢

pathGlobFilter

cloudFiles.fileExtension

fileExtension

cloudFiles.pathGlobFilter

## P4-Q041

### カテゴリ

Section 5: Implementing CI/CD（10%）

### 設問

Which of the following functionalities can be performed in Git folders?

### 選択肢

Delete branches

Create pull requests

Create new remote Git repositories

Pull changes from a remote Git repository

## P4-Q042

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 設問

A data engineer runs a Spark job that performs a wide transformation where data need to be reshuffled across partitions, but it fails with an ExecutorLostFailure error message.

Which TWO actions should the data engineer take to fix this issue?

### 選択肢

Increase executor memory

Increase the number of cores per executor

increase the driver memory

Enable the Photon engine

increase the number of shuffle partitions

## P4-Q043

### カテゴリ

Section 7: Governance and Security（15%）

### 設問

A data engineering team manages a Delta Lake table in Unity Catalog called employees, with columns: id, name, salary, and region. They want to apply row filtering on this table so that only members of the HR team can access all records. If the table is queried by a non-HR team member, it should only show records in the France (FR) region. To achieve this, they implemented the following user-defined function:

CREATE FUNCTION fr_filter(region STRING)
RETURN IF(IS_ACCOUNT_GROUP_MEMBER('hr_team'), true, region='FR');

Which of the following commands can the team use to apply this function as a row filter to the table?

### 選択肢

ALTER TABLE employees SET ROW FILTER fr_filter ON (region);

ALTER TABLE employees ALTER COLUMN region SET ROW FILTER fr_filter;

ALTER TABLE employees SET ROW FILTER fr_filter;

SET ROW FILTER fr_filter ON TABLE employees TO COLUMN region

## P4-Q044

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 設問

A data engineer is analyzing a Spark job via the Spark UI. They have the following summary metrics for 27 completed tasks in a particular stage

Which conclusion can the data engineer draw from the above statistics?

### 選択肢

The stage is running normally without any major issues.

The cluster does not have enough resources to handle the workload.

The data is not evenly distributed across tasks, indicating data skew.

The system is spending too much time on garbage collection (GC)

## P4-Q045

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 設問

A data engineer has defined the following data quality constraint in a Delta Live Tables pipeline:

CONSTRAINT valid_id EXPECT (id IS NOT NULL) _____________

Fill in the above blank so records violating this constraint will be added to the target table, and reported in metrics

ON VIOLATION NONE

ON VIOLATION FAIL UPDATE

ON VIOLATION ADD ROW

### 選択肢

There is no need to add ON VIOLATION clause. By default, records violating the constraint will be kept, and reported as invalid in the event log

## P4-Q046

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 設問

A data engineer has the following query in a Lakeflow Spark Declarative Pipeline (formerly Delta Live Tables):

CREATE STREAMING TABLE sales_silver
AS
  SELECT store_id, total + tax AS total_after_tax
  FROM sales_bronze

The pipeline is failing to start due to an error in this query.

Which of the following changes should be made to this query to successfully start the DLT pipeline ?

### 選択肢

CREATE STREAMING TABLE sales_silver
AS
  SELECT store_id, total + tax AS total_after_tax
  FROM STREAMING(sales_bronze)
CREATE STREAMING TABLE sales_silver
AS
  SELECT store_id, total + tax AS total_after_tax
  FROM STREAMING sales_bronze
CREATE STREAM TABLE sales_silver
AS
  SELECT store_id, total + tax AS total_after_tax
  FROM STREAM(LIVE.sales_bronze)

CREATE STREAMING TABLE sales_silver
AS
  SELECT store_id, total + tax AS total_after_tax
  FROM STREAM(sales_bronze)

## P4-Q047

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 設問

A data engineer needs to execute a scheduled Python notebook on an hourly basis. This job involves processing relatively small volumes of data. The execution environment should be efficient, require no cluster pre-warming, and deliver consistent, reliable performance.

Considering these requirements, which compute option is recommended for executing this job?

### 選択肢

Serverless Job Compute

Classic Job Cluster

Classic All-purpose Cluster

Serverless SQL Warehouse

## P4-Q048

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

In the Medallion Architecture, which of the following statements best describes the Gold layer tables?

### 選択肢

They maintain raw data ingested from various sources

The table structure in this layer resembles that of the source system table structure with any additional metadata columns like the load time, and input file name.

They provide business-level aggregations that power analytics, machine learning, and production applications

They represent a filtered, cleaned, and enriched version of data

## P4-Q049

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

A data engineer has been tasked with consuming a stream of events from a Kafka topic named events_topic, which is hosted on a remote Kafka broker at host:port.

Which of the following code snippets correctly establishes a streaming DataFrame in PySpark to read from this Kafka topic?

### 選択肢

eventsStream = (spark.readStream
                    .format("cloud_files")
                    .option("cloudFiles.format", "kafka")
                    .option("cloudFiles.bootstrap.servers", "host:port")
                    .option("cloudFiles.subscribe", "events_topic")
                    .option("cloudFiles.startingOffsets", "latest")
                    .load()
                )

eventsStream = (spark.readStream
                    .format("kafka")
                    .option("kafka.bootstrap.servers", "host:port")
                    .option("subscribe", "events_topic")
                    .option("startingOffsets", "latest")
                    .load()
                )
eventsStream = spark.readStream.format("kafka").load("host:port", "events_topic", "latest")
 
eventsStream = spark.readStream.kafka("host:port", "events_topic", "latest")

## P4-Q050

### カテゴリ

Section 7: Governance and Security（15%）

### 設問

“A mechanism to dynamically apply row filters and column masks using governed tags. It offers a single catalog-level definition that automatically applies to all current and future tables without per-table configuration.”

Which of the following Unity Catalog features is being described in the above statement?

### 選択肢

Attribute-Based Access Control (ABAC) policies

Liquid Clustering

Dynamic views

Predictive Optimization

## P4-Q051

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

Which of the following offers a low-code, fully managed data ingestion solution from popular enterprise applications into Unity Catalog tables?

### 選択肢

Lakeflow Connect managed connector

COPY INTO

Auto Loader

Databricks Connect

## P4-Q052

### カテゴリ

Section 7: Governance and Security（15%）

### 設問

How does Automatic Liquid Clustering determine which columns to use as clustering keys in a Unity Catalog-managed Delta table?

### 選択肢

It automatically determines optimal clustering keys based on the type and order of column definition in the schema.

It intelligently selects clustering keys from predefined clustering columns specified during table creation.

It leverages Predictive Optimization to choose optimal clustering keys based on observed query behavior.

It leverages advanced sampling strategies to randomize column selection after uniformly balancing data across all files.

## P4-Q053

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 設問

A data engineering team at a supply chain company uses Lakeflow Declarative Pipelines (formerly Delta Live Tables) to manage inventory data. The team maintains an append-only streaming table, inventory_raw, that stores raw inventory status information, with columns: product_id, quantity, and event_timestamp.

A data engineer is tasked with creating a new table, inventory_latest, to capture near real-time changes in product inventory levels from inventory_raw. The new table will include the columns: product_id, current_quantity, and updated_timestamp.

Which of the following types of objects would be most suitable to implement the inventory_latest table?

### 選択肢

Streaming view

Streaming table

Materialized view

Temporary view

## P4-Q054

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 設問

Which of the following describes Cron syntax in Databricks Jobs?

### 選択肢

It’s an expression to represent the maximum concurrent runs of a job

It’s an expression to represent complex job schedule that can be defined programmatically

It’s an expression to represent the retry policy of a job

It’s an expression to represent the run timeout of a job

## P4-Q055

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

A data engineering team maintains a reporting job that should automatically refresh whenever a Delta table is updated by upstream ingestion pipelines. The goal is to react to changes in the table so that downstream reports remain consistent and up to date as new data arrives.

What trigger configuration should the team use for this job?

### 選択肢

Continuous trigger

Scheduled trigger

File arrival trigger

Table update trigger

