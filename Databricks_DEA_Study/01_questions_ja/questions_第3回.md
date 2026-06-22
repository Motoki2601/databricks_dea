# Questions 第3回

- Source: `C:\Users\motok\Desktop\Databricks DEA\Exam Guide\split_questions\questions_第3回.md`
- Count: 55
- ID format: P3-Q001

## P3-Q001

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 設問

A data engineer is validating incoming transaction data in a Databricks SQL pipeline. Some records contain unexpected symbols in numeric fields. The engineer runs the following query:

SELECT COALESCE(CAST("100$" AS INT), 0)

Which of the following describes the result of this query?

### 選択肢

0

100

NULL

An error is thrown

## P3-Q002

### カテゴリ

Section 7: Governance and Security（15%）

### 設問

A data engineering team is migrating a high-traffic external table to a managed table. They require a conversion process with minimal disruption to avoid impacting ongoing analytics workloads and business operations. To meet this requirement, they must decide between using ALTER TABLE … SET MANAGED and a DEEP CLONE approach.

Which advantage does SET MANAGED provide over DEEP CLONE for this conversion?

Choose 2 answers

### 選択肢

SET MANAGED migrates only the Delta transaction logs to reduce data copy times.

SET MANAGED leaves data in place and just references the existing table location.

SET MANAGED minimizes reader and writer downtime.

SET MANAGED schedules the conversion process to run during off-peak periods using predictive optimization.

SET MANAGED handles concurrent writes during conversion.

## P3-Q003

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 設問

Which of the following statements is Not true about CTAS statements ?

### 選択肢

CTAS statements support manual schema declaration

CTAS statements stand for CREATE TABLE _ AS SELECT statement

With CTAS statements, data will be inserted during the table creation

CTAS statements automatically infer schema information from query results

## P3-Q004

### カテゴリ

Section 6: Troubleshooting, Monitoring, and Optimization（10%）

### 設問

A data engineer got a java.lang.OutOfMemoryError after running df.toPandas() on a large Spark DataFrame?

Which action should the data engineer take to fix this issue?

### 選択肢

increase the number of shuffle partitions

Enable Adaptive Query Execution (AQE)

Increase executor memory

increase the driver memory

## P3-Q005

### カテゴリ

Section 7: Governance and Security（15%）

### 設問

A finance analytics team manages a Delta Lake table in Unity Catalog called “transactions” with columns: id, amount, region, and account_manager. They want to apply row filtering on this table so that:

Finance team members can see all transactions, while

Other users can only see records from the US region.

Which of the following user-defined functions help achieve this?

### 選択肢

CREATE FUNCTION us_filter(region STRING)
RETURN CASE
    WHEN IS_ACCOUNT_GROUP_MEMBER('finance_team') THEN region='US'
    ELSE true END
CREATE FUNCTION us_filter(region STRING)
RETURN CASE
    WHEN IS_ACCOUNT_GROUP_MEMBER('finance_team') THEN true
    ELSE region END
CREATE FUNCTION us_filter(region STRING)
RETURN IF(IS_ACCOUNT_GROUP_MEMBER('finance_team'), region='US', true);

CREATE FUNCTION us_filter(region STRING)
RETURN IF(IS_ACCOUNT_GROUP_MEMBER('finance_team'), true, region='US');

## P3-Q006

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

Which of the following statements best describes the usage of CREATE SCHEMA command ?

### 選択肢

It’s used to create a table schema (columns names and datatype)

It’s used to merge the schema when writing data into a target table

It’s used to infer and store schema in “cloudFiles.schemaLocation”

It’s used to create a database

## P3-Q007

### カテゴリ

Section 6: Troubleshooting, Monitoring, and Optimization（10%）

### 設問

A data engineering team is processing a large-scale ETL pipeline that involves joining multiple large datasets, each containing hundreds of columns and billions of records. During the join phase, they notice that the Spark executors are repeatedly spilling data to disk, and performance significantly degrades due to excessive shuffling.

What type of resource optimization should the team prioritize to improve the performance of this job?

### 選択肢

Compute Optimized

GPU Optimized

Storage Optimized

Memory Optimized

## P3-Q008

### カテゴリ

Section 6: Troubleshooting, Monitoring, and Optimization（10%）

### 設問

A data engineer noticed that there are unused data files in the directory of a Delta table. They executed the VACUUM command on this table; however, only some of those unused data files have been deleted.

Which of the following could explain why only some of the unused data files have been deleted after running the VACUUM command ?

### 選択肢

The deleted data files were older than the default retention threshold. While the remaining files are newer than the default retention threshold and can not be deleted.

The deleted data files were newer than the default retention threshold. While the remaining files are older than the default retention threshold and can not be deleted.

The deleted data files were larger than the default size threshold. While the remaining files are smaller than the default size threshold and can not be deleted.

The deleted data files were smaller than the default size threshold. While the remaining files are larger than the default size threshold and can not be deleted.

## P3-Q009

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

A data engineering team needs to ingest clickstream events from an Apache Kafka topic into Databricks. The system receives 10,000 events per second, and the data must be processed with a latency of under 60 seconds.

Which ingestion approach is most appropriate?

### 選択肢

Structured Streaming from Kafka into Databricks

Batch ingestion using scheduled Spark jobs every minute

Incremental ingestion using a Lakeflow managed connector for Kafka

Full table reload from Kafka every 24 hours

## P3-Q010

### カテゴリ

Section 7: Governance and Security（15%）

### 設問

A data engineering team is discussing the optimal data layout strategy on a growing managed Delta table in Unity Catalog. They are considering partitioning, Z-ordering, and Liquid Clustering to improve query performance.

Which scenario best indicates that Automatic Liquid Clustering is the recommended choice?

### 選択肢

The table experiences diverse, frequently changing query filters across multiple columns, with unpredictable access patterns.

The team has identified stable clustering keys for the table.

None of the listed options are correct. Automatic Liquid Clustering can not be applied on managed tables.

The table is heavily filtered by a consistent, small set of date ranges.

## P3-Q011

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

Which of the following technologies is used by Auto Loader to load data incrementally?

### 選択肢

COPY INTO

Spark Structured Streaming

DEEP CLONE

Multi-hop architecture

## P3-Q012

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 設問

A data pipeline team notices that several scheduled job runs are delayed during peak hours and start later than their scheduled time.

What is the most likely explanation for this behavior?

### 選択肢

The job is configured with a low timeout_seconds value causing delayed retries

The task dependencies are causing circular execution delays

The cluster is using spot instances that are frequently terminated

The workflow is configured with queueing enabled and has reached its max_concurrent_runs limit

## P3-Q013

### カテゴリ

Section 6: Troubleshooting, Monitoring, and Optimization（10%）

### 設問

A data engineer wants to increase the cluster size of an existing Databricks SQL warehouse.

Which of the following is the benefit of increasing the cluster size of Databricks SQL warehouses ?

### 選択肢

The cluster size of SQL warehouses is not configurable. Instead, they can increase the number of clusters

Reduces the latency of the queries execution

Reduces cost since large clusters use Spot instances

Speeds up the start up time of the SQL warehouse

## P3-Q014

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

In the Medallion Architecture, which of the following statements best describes the Bronze layer?

### 選択肢

It provides business-level aggregated version of data

It maintains data that powers analytics, machine learning, and production applications

It maintains raw data ingested from various sources

It represents a filtered, cleaned, and enriched version of data

## P3-Q015

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 設問

A data engineer is working with a table products that has the following schema:

product_id STRING,

updated_at TIMESTAMP,

details STRUCT<name: STRING, category: STRING, pricing: STRUCT<base_price: DOUBLE, discount: DOUBLE>>,

They want to flatten all fields inside details so that name, category, and the nested pricing fields become root-level columns.

Which SQL query correctly achieves this goal?

### 選択肢

SELECT *
FROM products;

SELECT
 product_id, updated_at, details.name, details.category,
 details.pricing.base_price, details.pricing.discount
FROM products;
SELECT
 product_id, updated_at, details.*
FROM products;
SELECT
 product_id, updated_at, EXPLODE(details)
FROM products;

## P3-Q016

### カテゴリ

Section 7: Governance and Security（15%）

### 設問

“A centralized governance layer that manages metadata and access controls across workspaces and clouds. It organizes data using a three-level namespace (catalog.schema.table) and enables fine-grained permissions down to column level, while also providing audit logging and data lineage for compliance.”

Which of the following is being described in the above statement?

### 選択肢

Hive metastore

Databricks SQL

Unity Catalog

Delta Lake

## P3-Q017

### カテゴリ

Section 7: Governance and Security（15%）

### 設問

A data engineer uses the following SQL query:

GRANT USE SCHEMA ON SCHEMA sales_db TO finance_team

Which of the following is the benefit of the USE SCHEMA privilege ?

### 選択肢

Gives read access on the database

Gives full permissions on the entire database

Gives the ability to view database objects and their metadata

It's a prerequisite to perform any action on the database

## P3-Q018

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

Which TWO of the following are native capabilities of Delta table?

### 選択肢

Delta Lake enables efficient table data storage using JSON format.

Delta Lake automatically deletes old data versions after every write operation to save space.

Delta Lake can evolve the table schema to include new optional columns without having to manually recreate the table.

Delta Lake eliminates the need for any underlying storage system such as cloud object storage.

Delta Lake prevents writes that do not conform to the table schema.

## P3-Q019

### カテゴリ

Section 6: Troubleshooting, Monitoring, and Optimization（10%）

### 設問

A data engineer is joining a very large PySpark dataframe with a small dataframe, as follows:

largeDF.join(smallerDF, ["key"], "inner")

This join operation is slow due to data shuffling. They want to optimize it by allowing the smaller dataFrame to be sent to all executor nodes in the cluster.

Which of the following functions can be used to mark a dataFrame as small enough to fit in memory on all executors?

### 選択肢

pyspark.sql.functions.explode

pyspark.sql.functions.shuffle

pyspark.sql.functions.distribute

pyspark.sql.functions.broadcast

## P3-Q020

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

In Delta Lake tables, which of the following is the primary format for the data files?

### 選択肢

JSON

Delta

Parquet

Both, Parquet and JSON

## P3-Q021

### カテゴリ

Section 5: Implementing CI/CD（10%）

### 設問

Which of the following tasks is not supported by Git folders, and must be performed in your Git provider ?

### 選択肢

Create and checkout branches for development work.

Clone, push to, or pull from a remote Git repository.

Visually compare differences upon commit.

Delete branches

## P3-Q022

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 設問

A data engineer is analyzing a Spark job via the Spark UI. They have the following summary metrics for 27 completed tasks in a particular stage

Which conclusion can the data engineer draw from the above statistics ?

### 選択肢

All tasks are operating over partitions with larger skewed amounts of data.

All task are operating over partitions with even amounts of data

Number of tasks are operating over partitions with larger skewed amounts of data.

Number of tasks are operating over empty or near empty partitions

## P3-Q023

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 設問

A data engineer has a Job with multiple tasks that takes more than 2 hours to complete. In the last run, the final task unexpectedly failed.

Which of the following actions can the data engineer perform to complete this Job Run while minimizing the execution time?

### 選択肢

They can keep the failed Run, and simply start a new Run for the Job

They can repair this Job Run so only the failed tasks will be re-executed

They need to delete the failed Run, and start a new Run for the Job

They can run the Job in Production mode which automatically retries execution in case of errors

## P3-Q024

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

A junior data engineer usually uses INSERT INTO command to write data into a Delta table. A senior data engineer suggested using another command that avoids writing of duplicate records.

Which of the following commands is the one suggested by the senior data engineer ?

### 選択肢

COPY INTO

MERGE INTO

INSERT OR OVERWRITE

UPDATE

## P3-Q025

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 設問

For production jobs, which of the following cluster types is recommended to use?

### 選択肢

On-premises clusters

Production clusters

All-purpose clusters

Job clusters

## P3-Q026

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 設問

A data engineer has a DataFrame, employeesDf, with a column named salary and wants to permanently rename this column to base_salary for all future operations on employeesDf.

Which PySpark code fragment meets this requirement?

### 選択肢

employeesDf = employeesDf.select(col("*"), col("salary").alias("base_salary"))

employeesDf = employeesDf.select(col("salary").alias("base_salary"))

employeesDf = employeesDf.withColumn("salary", "base_salary")

employeesDf = employeesDf.withColumnRenamed("salary", "base_salary")

## P3-Q027

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

A data engineer wants to incrementally ingest sales transaction data from multiple enterprise sources (Salesforce, SQL database, Kafka stream, and Azure Data Lake Storage) into Unity Catalog tables.

Which configuration should the data engineer use to meet this requirement?

### 選択肢

Single managed connector for all sources with CDC

Separate connectors per source with CDC

Single standard connector for all sources with CDC

Single unified Lakeflow connector for all sources with CDC

## P3-Q028

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

A data engineer is configuring a Databricks Auto Loader stream to ingest JSON data from an S3 bucket. The pipeline should fail when new columns are detected in the incoming data, but those new columns should still be added to the schema so that subsequent runs can resume successfully with the updated schema. Existing columns must retain their data types.

spark.readStream \
        .format("cloudFiles") \
        .option("cloudFiles.format", "json") \
        .option("cloudFiles.schemaLocation", "s3://checkpoints/orders")
        .option("cloudFiles.schemaEvolutionMode", "_______________") \
        .load("s3://shop/raw/orders/json/") \
    .writeStream \
        .option("checkpointLocation", "s3://checkpoints/orders") \
        .start("orders_table")

Which option correctly fills in the blank to meet the specified requirement ?

### 選択肢

failOnNewColumns

addNewColumns

none

rescue

## P3-Q029

### カテゴリ

Section 7: Governance and Security（15%）

### 設問

A data engineer schedules a notebook as a Databricks Job to process daily confidential data. They are concerned about where the notebook code actually runs when the job is triggered.

Which of the following explains where the execution of this job occurs?

### 選択肢

In the control plane where the notebook is stored

In Unity Catalog during query planning

In the workspace storage bucket

In the compute plane on a cluster running Spark

## P3-Q030

### カテゴリ

Section 5: Implementing CI/CD（10%）

### 設問

A data engineering team has the following Declarative Automation Bundle (DAB) configuration:

bundle:
  name: demo_bundle
 
variables:
 catalog_name:
   default: demo_catalog

The team wants to set the catalog_name variable per target to enable environment-specific behavior without modifying the business code.

Which configuration meets this requirement?

### 選択肢

variables:
 catalog_name:
   default: demo_catalog
   targets:
       dev: dev_catalog
       prod: prod_catalog

targets:
 dev:
   variables:
     catalog_name: dev_catalog
 prod:
   variables:
     catalog_name: prod_catalog
variables:
 catalog_name:
   default: demo_catalog
   target: ${target}_catalog
variables:
 catalog_name:
   default: demo_catalog
   dev: dev_catalog
   prod: prod_catalog

## P3-Q031

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 設問

In Databricks Jobs, which of the following approaches can a data engineer use to configure a linear dependency between Task A and Task B ?

### 選択肢

They can visually drag and drop an arrow from Task A to Task B in the Job canvas

They can assign Task A an Order number of 1, and assign Task B an Order number of 2

They can select the Task A in the Depends On field of the Task B configuration

They can configure the dependency at the notebook level using the dbutils.jobs utility

## P3-Q032

### カテゴリ

Section 7: Governance and Security（15%）

### 設問

Which part of the Databricks platform can a data engineer use to grant and revoke permissions on securable objects for principals?

### 選択肢

Catalog Explorer

Account console

Workspace Admin Console

Data Studio

## P3-Q033

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 設問

A data engineer currently uses an all-purpose cluster with auto-termination set to 6 hours to run a nightly incremental ETL job. The workloads complete at different times each night, ranging from 1-3 hours. They want to reduce compute costs while maintaining the same scheduling behavior.

Which approach should the data engineer use to reduce compute costs?

### 選択肢

Configure the all-purpose cluster to use smaller worker nodes

Use the AvailableNow trigger option to stop the stream processing automatically

Use a job compute cluster that automatically terminates after workload completion

Decrease the auto-termination setting on the all-purpose cluster to 3 hours

## P3-Q034

### カテゴリ

Section 7: Governance and Security（15%）

### 設問

A data engineer defines the following Unity Catalog ABAC policy to centrally apply column masking using the mask_credit_card(cc STRING) UDF.

CREATE POLICY banking_policy ON SCHEMA bank.safebox
COLUMN MASK bank.safebox.mask_credit_card
TO financial_analysts EXCEPT admins
FOR TABLES
__________________________
ON COLUMN cc;

They need to mask every column tagged pii=credit_card across all tables in the schema bank.safebox. Users in the group financial_analysts should see masked values, while users in the group admins should see unmasked values.

Which option correctly fills in the blank to meet the specified requirement?

### 選択肢

MATCH COLUMNS hasTag('pii') AS credit_card

MATCH COLUMNS hasTagValue('pii', ‘cc’) AS credit_card

MATCH COLUMNS hasTagValue('pii','credit_card') AS cc

MATCH COLUMNS hasTagValue('pii') AS credit_card

## P3-Q035

### カテゴリ

Section 1: Databricks Intelligence Platform（6%）

### 設問

Which of the following locations completely hosts the customer data?

### 選択肢

Control plane

Databricks account

Databricks-managed cluster

Customer's cloud account

## P3-Q036

### カテゴリ

Section 5: Implementing CI/CD（10%）

### 設問

A junior data engineer has been tasked with implementing data quality validation in a Lakeflow Spark Declarative Pipeline (SDP). They added several expectation functions to ensure that incoming datasets meet certain criteria before being processed further. After the junior engineer submitted a pull request, a senior data engineer began reviewing the code and noticed that one of the function calls used for validation was not correct.

As part of the review, the senior engineer wants to ensure that all expectation functions used in the pipeline are valid according to Databricks documentation.

Which of the following function calls is Not a valid expectation function in Lakeflow Declarative Pipelines?

### 選択肢

expect_or_warn(...)

expect_or_drop(...)

expect(...)

expect_or_fail(...)

## P3-Q037

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 設問

A junior data engineer creates a Databricks job with 15 notebook tasks, each performing the same data validation logic on 15 different tables. Each task depends on the completion of the previous one, making the workflow long and difficult to maintain.

What would be a more efficient and scalable solution for this use case?

### 選択肢

Combine all table validations into one large notebook and loop through all tables sequentially

Configure the 15 notebook tasks to run in parallel, each with a separate cluster configuration

Schedule 15 separate jobs instead of having multiple tasks in one job

Use a foreach task to run the same validation notebook for each table in parallel, passing the table name as a parameter

## P3-Q038

### カテゴリ

Section 5: Implementing CI/CD（10%）

### 設問

A data engineer configures a Declarative Automation Bundle (formerly Databricks Asset Bundle) and wants to push the assets to the defined target workspace.

Which Databricks CLI command can the data engineer use to achieve this goal?

### 選択肢

databricks bundle validate

databricks bundle deployment

databricks bundle deploy

databricks bundle push

## P3-Q039

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 設問

A data engineer is validating incoming transaction data in a Databricks SQL pipeline. Some records contain unexpected symbols in numeric fields. The engineer runs the following query:

SELECT INT("100$")

Which of the following describes the result of this query?

### 選択肢

$100

100

NULL

An error is thrown

## P3-Q040

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 設問

A data engineer maintains the following Lakflow Job:

They want to add a new task, Task 5, to run after the completion of all the parallel tasks (Tasks 2, 3, and 4).

Which task configuration meets this requirement?

### 選択肢

Add Task 5 without any dependency but with condition run_if: ALL_DONE

Set Task 5 to depend only on Task 4, which runs after Tasks 2 and 3 in order.

Configure Task 5 in a separate job and schedule it to run after the current job completes.

Set Task 5 to depend on all three parallel tasks using fan-in control flow

## P3-Q041

### カテゴリ

Section 7: Governance and Security（15%）

### 設問

A data engineering team manages Unity Catalog tables with predictive optimization enabled. They are unsure which operations are automatically performed on these tables as part of predictive optimization’s automatic maintenance.

Which of the following operations is Not handled automatically by predictive optimization for enabled tables?

### 選択肢

VACUUM

ZORDER

ANALYZE

OPTIMIZE

## P3-Q042

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 設問

A data engineer needs to run a Lakeflow job that aggregates sales data once every night at 2 AM. The job does not require real-time processing and should execute only at a fixed time each day.

What trigger configuration should the data engineer use for this job?

### 選択肢

Scheduled trigger

Continuous trigger

File arrival trigger

Table update trigger

## P3-Q043

### カテゴリ

Section 5: Implementing CI/CD（10%）

### 設問

A data engineer is preparing a Databricks asset bundle to define a job that executes a notebook located at ./src/my_notebook.py. While writing the YAML configuration, the engineer drafts the following:

bundle:
    name: my_bundle
 
____________:
  jobs:
    my_job:
      name: my_notebook_job
      tasks:
        - task_key: test_task
            existing_cluster_id: 1234-911320-xyzwpm999
            notebook_task:
              notebook_path: './src/my_notebook.py'

To ensure the bundle is valid and deployable, which key should correctly replace the above blank?

### 選択肢

resources

settings

workflows

pipelines

## P3-Q044

### カテゴリ

Section 7: Governance and Security（15%）

### 設問

A data engineer has been tasked with granting the service principal with Application ID ‘fe7bcf95-ab87-4dce-a2fd-8c55f8158a02’ a read-only access to the enterprise.reporting.transactions table.

Which SQL commands will correctly grant access with the least privileges?

### 選択肢

GRANT SELECT ON TABLE enterprise.reporting.transactions TO `fe7bcf95-ab87-4dce-a2fd-8c55f8158a02`;
 
GRANT SELECT ON TABLE enterprise.reporting.transactions TO `fe7bcf95-ab87-4dce-a2fd-8c55f8158a02`;
GRANT USE CATALOG ON CATALOG enterprise TO `fe7bcf95-ab87-4dce-a2fd-8c55f8158a02`;
GRANT SELECT ON TABLE enterprise.reporting.transactions TO `fe7bcf95-ab87-4dce-a2fd-8c55f8158a02`;
GRANT USE SCHEMA ON SCHEMA enterprise.reporting TO `fe7bcf95-ab87-4dce-a2fd-8c55f8158a02`;

GRANT SELECT ON TABLE enterprise.reporting.transactions TO `fe7bcf95-ab87-4dce-a2fd-8c55f8158a02`;
GRANT USE SCHEMA ON SCHEMA enterprise.reporting TO `fe7bcf95-ab87-4dce-a2fd-8c55f8158a02`;
GRANT USE CATALOG ON CATALOG enterprise TO `fe7bcf95-ab87-4dce-a2fd-8c55f8158a02`;

## P3-Q045

### カテゴリ

Section 5: Implementing CI/CD（10%）

### 設問

Which of the following operations can a data engineer use to update a Git folder from its remote Git repository?

### 選択肢

Commit

Clone

Push

Pull

## P3-Q046

### カテゴリ

Section 6: Troubleshooting, Monitoring, and Optimization（10%）

### 設問

A data engineer wants to review all changes made to a Delta table in the last 30 days, including transaction timestamps, operation types, and executing users. Which command should they use?

### 選択肢

DESCRIBE EXTENDED my_table

DESCRIBE DETAIL my_table

SELECT * FROM my_table VERSION AS OF <version_number>

DESCRIBE HISTORY my_table

## P3-Q047

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 設問

Which scenario is best suited for using spot instances in Databricks?

### 選択肢

Real-time stream processing with strict SLA requirements

Non-critical batch processing jobs with retry capability

Interactive data analysis by business analysts

Transactional workloads with high concurrency demands

## P3-Q048

### カテゴリ

Section 5: Implementing CI/CD（10%）

### 設問

A data engineer wants to use Declarative Automation Bundles (formerly known as Databricks Asset Bundles) to deploy jobs into the dev workspace via a PAT token from their local machine.

Which TWO environment variables should the data engineer set in their shell environment to configure Databricks Unified Authentication?

### 選択肢

DATABRICKS_CLIENT_SECRET

DATABRICKS_CLIENT_ID

DATABRICKS_HOST

DATABRICKS_WORKSPACE

DATABRICKS_TOKEN

## P3-Q049

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 設問

A data engineer has a DataFrame, df, with a location column formatted as “City ZipCode”, such as "Paris 75015". They want to create two new columns, city and zip_code, by extracting both values, then removing the original location column.

Which PySpark code snippet should the data engineer use?

### 選択肢

from pyspark.sql.functions import getItem, col
 
df = (
     df.withColumn("city", getItem(col("location"), 0))
       .withColumn("zip_code", getItem(col("location"),1))
       .drop("location")
)
from pyspark.sql.functions import explode
 
df = (
    df.select(explode('location').alias('places'))
      .select('places[0]', 'places[1]')
      .drop("location")
)
from pyspark.sql.functions import split
 
df = (
    df.select(split('location', ' ').alias('places'))
      .select('places[0]', 'places[1]')
)

from pyspark.sql.functions import split, col
 
df = (
        df.withColumn("city", split(col("location"), " ")[0])
          .withColumn("zip_code", split(col("location")," ")[1])
          .drop("location")
)

## P3-Q050

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 設問

A data analyst works with two PySpark DataFrames: teachers_df and courses_df, both containing a teacher_id column. They need a DataFrame of teachers who do not teach any courses.

Which PySpark code achieves this requirement?

### 選択肢

joined_df = teachers_df.join(courses_df, "teacher_id", "left_semi")

joined_df = teachers_df.join(courses_df, "teacher_id", "left_anti")

joined_df = teachers_df.join(courses_df, "teacher_id", "full")

joined_df = teachers_df.join(courses_df, "teacher_id", "left")

## P3-Q051

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 設問

A data engineering team needs to run a Spark job that processes skewed data during a join operation, which may lead to performance delays. Adaptive Query Execution (AQE) is enabled in the cluster.

How does AQE help address data skew in this case?

### 選択肢

AQE automatically detects skewed partitions and splits them into smaller sub-partitions for parallel processing

AQE converts all joins into Cartesian products to balance load and improve parallelism

AQE disables partitioning entirely to improve execution efficiency while still preserving the benefits of distributed processing.

AQE removes skewed data from the dataset to dynamically mitigate the impact of data skew

## P3-Q052

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

A data engineer needs to determine whether to use Auto Loader or COPY INTO command in order to load input data files incrementally.

In which of the following scenarios should the data engineer use Auto Loader over COPY INTO command ?

### 選択肢

If the data schema is not going to evolve frequently

If they are going to load a subset of re-uploaded files

If they are going to ingest files in the order of millions or more over time

If they are going to ingest few number of files in the order of thousands

## P3-Q053

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 設問

A data engineer has defined the following data quality constraint in a Lakeflow Spark Declarative Pipeline (formerly Delta Live Tables):

CONSTRAINT valid_id EXPECT (id IS NOT NULL) _____________

Fill in the above blank so records violating this constraint cause the pipeline to fail.

ON VIOLATION FAIL UPDATE

ON VIOLATION FAIL

There is no need to add ON VIOLATION clause. By default, records violating the constraint cause the pipeline to fail.

### 選択肢

ON VIOLATION FAIL PIPELINE

## P3-Q054

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

A financial services company wants to migrate nightly account data from an on-premises SQL Server database into a governed analytics platform. The ingested records must be stored in a managed Unity Catalog table so analysts can query the data immediately using SQL dashboards, while maintaining automatic lineage tracking for compliance audits.

Which implementation best satisfies these requirements?

### 選択肢

Extract data through ODBC into temporary files before manually registering tables

Export CSV files to object storage and load them later with a separate ETL pipeline

Use a local Python script with Pandas and upload Parquet files to Unity Catalog Volume

Read data using Spark JDBC and write directly into a Unity Catalog managed table

## P3-Q055

### カテゴリ

Section 5: Implementing CI/CD（10%）

### 設問

A data engineer has an existing Databricks job and wants to manage it using Declarative Automation Bundles (formerly Databricks Asset Bundles). They want to:

Use the Databricks CLI to get the YAML definition of the job and download its referenced artifacts.

Automatically links the generated resource with the existing one in the workspace, ensuring that any updates to the bundle’s YAML definition will modify the linked job rather than creating a new one.

Which of the following commands allows the data engineer to achieve this?

### 選択肢

databricks bundle download job --existing-job-id <job_id> --bind

databricks bundle get job --existing-job-id <job_id> --link

databricks bundle generate job --existing-job-id <job_id> --bind

databricks bundle clone job --existing-job-id <job_id> --link

