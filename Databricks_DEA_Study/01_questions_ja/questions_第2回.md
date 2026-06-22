# Questions 第2回

- Source: `C:\Users\motok\Desktop\Databricks DEA\Exam Guide\split_questions\questions_第2回.md`
- Count: 55
- ID format: P2-Q001

## P2-Q001

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

A data engineer is using the file upload UI in Databricks to ingest a CSV file in a new Unity Catalog-managed table. The file upload UI automatically detects column types, but the engineer wants to create all columns with the STRING data type to avoid incorrect schema inference.

Which of the following options best meets this requirement?

### 選択肢

No action required; all CSV columns are created with the STRING data type by default

The file upload UI does not provide any setting to update the inferred column data types

Edit the inferred schema using header dropdowns to set all columns to STRING

Under Advanced attributes, disable the setting “Automatically detect column types”

## P2-Q002

### カテゴリ

Section 7: Governance and Security（15%）

### 設問

A data engineer has been tasked with creating a Unity Catalog table containing customer information, including email addresses and phone numbers, across multiple regions. The organization wants to ensure that users can query the table, but personally identifiable information (PII) is not exposed to those without proper access.

Which method should the engineer use to efficiently enforce this requirement?

### 選択肢

Use a dynamic view to redacting sensitive PII columns

Use row-level filters to restrict access to region-specific customers

Apply column masks to configure fine-grained access control

Use table object privileges to revoke access on sensitive PII columns

## P2-Q003

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 設問

A data engineer explores the following job run that succeeded with failures:

Which of the following explains why the job was executed successfully even though not all tasks succeeded?

### 選択肢

All tasks are configured with run_if: All done

Task B is configured with run_if: At least one failed

Task A is configured with run_if: At least one succeeded

Task C is configured with run_if: At least one failed

## P2-Q004

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 設問

A data engineer needs to enforce that transaction_id and transaction_date are never null on an existing Delta table named transactions.

Which SQL statements correctly add these constraints?

### 選択肢

ALTER TABLE transactions ALTER COLUMN transaction_id SET NOT NULL;

ALTER TABLE transactions ALTER COLUMN transaction_date SET NOT NULL;

ALTER TABLE transactions CHECK(transaction_id IS NOT NULL AND transaction_date IS NOT NULL);

ALTER TABLE transactions CHECK(transaction_id IS NOT NULL);

ALTER TABLE transactions CHECK(transaction_date IS NOT NULL);

ALTER TABLE transactions ALTER COLUMNS (transaction_id, transaction_date) SET NOT NULL;

## P2-Q005

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 設問

A data engineer is cleaning transaction data before loading it into a silver table. To improve data quality, the engineer uses the following PySpark command:

df.dropna(subset=['order_id', 'payment_method'])

What is this command used for?

### 選択肢

Replace null values in order_id and payment_method with empty strings

Eliminate rows where both columns contain null values

Eliminate rows where either order_id or payment_method contains null values

Drop both columns from the dataframe “df”

## P2-Q006

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

A data engineer has uploaded a JSON file to a Unity Catalog volume named “source_files” in the schema “events” under the catalog “analytics”. They want to query the file directly using Spark SQL.

Which of the following commands correctly reads the JSON file?

### 選択肢

SELECT * FROM json.`/Volumes/source_files/events/analytics/transactions.json`

SELECT * FROM json.`s3://source_files/events/analytics/transactions.json`

SELECT * FROM json.`dbfs:/FileStore/analytics/events/source_files/transactions.json`

SELECT * FROM json.`/Volumes/analytics/events/source_files/transactions.json`

## P2-Q007

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

In Lakeflow Connect, which of the following options does NOT belong to the set of managed ingestion connectors?

### 選択肢

Salesforce

PostgreSQL database

Workday Reports

Auto Loader

## P2-Q008

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

A data engineer is tasked with designing an ETL pipeline with Lakeflow Declarative Pipelines (formerly Delta Live Tables) to efficiently handle near real-time data ingestion. The goal is to incrementally process incoming data streams using Auto Loader, ensuring that the data pipeline can continuously capture and load new records as they arrive while maintaining high performance and reliability.

Given this requirement, the engineer needs to choose an appropriate type of object that can best support incremental, near real-time data ingestion and processing.

Which of the following objects would be most suitable for this specific use case?

### 選択肢

Materialized view

Streaming table

Streaming view

Temporary view

## P2-Q009

### カテゴリ

Section 7: Governance and Security（15%）

### 設問

A data engineering team has a multi-tasks Job in production. The team members need to be notified in the case of job failure.

Which of the following approaches can be used to send emails to the team members in the case of job failure ?

### 選択肢

Only Job owner can be configured to be notified in the case of job failure

They can configure email notifications settings in the job page

They can use Job API to programmatically send emails according to each task status

There is no way to notify users in the case of job failure

## P2-Q010

### カテゴリ

Section 5: Implementing CI/CD（10%）

### 設問

Which of the following operations can a data engineer use to save local changes of a Git folder to its remote repository?

### 選択肢

Merge & Push

Merge & Pull

Commit & Pull

Commit & Push

## P2-Q011

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 設問

A data engineer is validating incoming transaction data in a Databricks SQL pipeline. Some records contain unexpected symbols in numeric fields. The engineer runs the following query:

SELECT CAST('100$' AS INT);

Which of the following describes the result of this query?

### 選択肢

$100

An error is thrown

NULL

100

## P2-Q012

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 設問

A data engineer observes in the Spark UI that most partitions in a stage contain around 100 MB of data, but a few partitions contain several gigabytes. Tasks processing these larger partitions take significantly longer to finish.

What is the primary performance bottleneck?

### 選択肢

Executor memory leak

Small file problem

Network timeout

Data skew

## P2-Q013

### カテゴリ

Section 7: Governance and Security（15%）

### 設問

A data engineer wants to create a relational object by pulling data from two tables. The relational object will only be used in the current session. In order to save on storage costs, the date engineer wants to avoid copying and storing physical data.

Which of the following relational objects should the data engineer create?

### 選択肢

Global Temporary view

Managed table

Temporary view

View

## P2-Q014

### カテゴリ

Section 7: Governance and Security（15%）

### 設問

A data engineering team is implementing a new analytics pipeline that needs to read governed tables in Unity Catalog. Which TWO compute types support access to Unity Catalog data?

### 選択肢

Classic compute that runs Databricks Runtime below 11.3 LTS

Classic compute configured with “No isolation shared” access mode

SQL warehouse compute

Classic compute that runs Databricks Runtime below 10.4 LTS

Classic compute configured with standard or dedicated access mode

## P2-Q015

### カテゴリ

Section 7: Governance and Security（15%）

### 設問

A data analyst creates a Python notebook in a Databricks workspace to analyze confidential enterprise data. The analyst is concerned about how and where this notebook is stored within the platform.

Where is the notebook stored within the Databricks architecture?

### 選択肢

In Unity Catalog as encrypted data assets

In the compute plane, inside the Spark cluster filesystem

In Delta Lake tables within the data plane

In the control plane as a securely stored and encrypted workspace object

## P2-Q016

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 設問

A data engineer runs df.collect() on a large Spark DataFrame and the job fails with a driver OOM error. What is the most likely cause?

### 選択肢

spark.memory.fraction is too high

spark.sql.autoBroadcastJoinThreshold is too high

spark.driver.memory is insufficient to hold the collected data

spark.executor.cores is too low

## P2-Q017

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 設問

A data engineering team wants to update downstream Gold tables every 15 minutes to ensure they meet the company’s Service Level Agreement (SLA).

Which trigger configuration should the team use for this job while minimizing compute costs and DBU consumption?

### 選択肢

File arrival trigger

Table update trigger

Scheduled trigger

Continuous trigger

## P2-Q018

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

A data engineer defines the following function in their Lakeflow Spark Declarative Pipeline (formerly Delta Live Tables):

from pyspark import pipelines as dp
 
@dp.table
@dp.expect_or_drop("recent_transaction", "transaction_date >= '2025-01-01'")
@dp.expect_or_drop("valid_transaction", "transaction_id IS NOT NULL'")
def silver_sales():
    return spark.readStream("bronze_sales")

Which of the following correctly describes the result of running this pipeline?

### 選択肢

Rows that violate the defined expectations are deleted from both tables.

Rows that violate the defined expectations are streamed into the silver_sales table.

Rows that violate the defined expectations are deleted from the bronze_sales table.

Rows that violate the defined expectations are filtered out, and only valid rows are written to silver_sales

## P2-Q019

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

A data engineer designs a Lakeflow Job with multiple notebook tasks that builds a Bronze-to-Silver pipeline. The Bronze notebook task calculates a latest_batch_number from an ingestion audit table. The Silver notebook task must consume that value during the same job run.

They want to pass the computed value between tasks without writing intermediate results to external storage.

Which configuration approach best satisfies these requirements?

### 選択肢

In the Bronze notebook, call: dbutils.jobs.taskValues.set("latest_batch_number", value) and in the Silver task configuration reference: {{tasks.BronzeTask.values.latest_batch_number}}

Pass latest_batch_number through notebook widgets and manually chain notebook execution using dbutils.notebook.run.

Write latest_batch_number to a temporary view in the Bronze notebook and query that view from Silver notebooks.

Store latest_batch_number in a cluster environment variable and read it in the Silver notebooks using spark.conf.get.

## P2-Q020

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 設問

A data engineer uses the following PySpark code to transform a DataFrame, df:

df.na.fill({"source": "unknown"})

Which of the following statements best describes this transformation?

### 選択肢

Rows with source="unknown" are converted into null values

Rows with source="unknown" are filtered out

All values in the source column are assigned the value “unknown”

Null values in the source column are assigned the value “unknown”

## P2-Q021

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 設問

A data engineering team builds a Lakeflow Job that processes a streaming workload of incoming IoT sensor data. The team needs to run the processing with the lowest possible latency and keep the job running indefinitely.

What trigger configuration should the team use for this job?

### 選択肢

Table update trigger

Continuous trigger

File arrival trigger

Scheduled trigger

## P2-Q022

### カテゴリ

Section 6: Troubleshooting, Monitoring, and Optimization（10%）

### 設問

“An optimization technique where a copy of a small table is cached on all nodes of the cluster for use in all future queries during the cluster lifetime, eliminating data shuffling”

Which of the following is being described in the above statement?

### 選択肢

Cross Join

Delta caching

OPTIMIZE

Broadcast Join

## P2-Q023

### カテゴリ

Section 7: Governance and Security（15%）

### 設問

Which of the following services can a data engineer use for task orchestration in the Databricks platform?

### 選択肢

Databricks Jobs

Delta Live Tables

Unity Catalog Linage

Databricks Connect

## P2-Q024

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 設問

“An optimization technique in Apache Spark that makes use of the runtime statistics to choose the most efficient query execution plan. It improves performance by adjusting shuffle partitions, switching join strategies, and handling data skew on the fly”

Which of the following is being described in the above statement?

### 選択肢

Photon Engine

Liquid Clustering

Adaptive Query Execution (AQE)

Predictive Optimization

## P2-Q025

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

In Lakeflow Connect, which of the following statements is Not true about managed ingestion connectors?

### 選択肢

Managed connectors leverage efficient incremental reads and writes to make data ingestion faster, scalable, and more cost-efficient.

Managed connectors require writing custom Python code to handle the full authentication flow, data update logic, and network requests.

The resulting ingestion pipeline is governed by Unity Catalog and is powered by serverless compute and Lakeflow Spark Declarative Pipelines.

Managed connectors support ingesting data from enterprise databases and Software as a Service (SaaS) applications.

## P2-Q026

### カテゴリ

Section 5: Implementing CI/CD（10%）

### 設問

A junior data engineer uses the built-in Databricks Notebooks versioning for source control. A senior data engineer recommended using Git folders instead.

Which of the following could explain why Git folders is recommended instead of Databricks Notebooks versioning?

### 選択肢

Git folders support automatic conflict resolution when multiple users edit the same notebook

Git folders support creating and managing branches for development work.

Git folders automatically sync all notebook changes to the remote Git repository in real time

Git folders store source code files in Unity Catalog for centralized security and governance

## P2-Q027

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

A data engineering team is using the Silver Layer in the Medallion Architecture to join customer data with external lookup tables and apply filters.

A team member makes the following claims about the Silver Layer. Which of these claims is incorrect?

### 選択肢

The Silver Layer handles data de-duplication

The Silver Layer stores raw data enriched with source file details and ingestion timestamps

The Silver Layer is responsible for data cleansing and filtering

The Silver Layer integrates with other sources for data enrichment

## P2-Q028

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 設問

Given the following 2 tables:

Fill in the blank to make the following query returns the below result:

SELECT students.name, students.age, enrollments.course_id
FROM students
_____________ enrollments
ON students.student_id = enrollments.student_id

ANTI JOIN

INNER JOIN

LEFT JOIN

### 選択肢

RIGHT JOIN

## P2-Q029

### カテゴリ

Section 7: Governance and Security（15%）

### 設問

A data scientist from the marketing department requires read-only access to the ‘customer_insights’ table located in the analytics schema, which is part of the BI catalog. The data will be used to generate quarterly customer engagement reports. In accordance with the principle of least privilege, only the minimum permissions necessary to perform the required tasks should be granted.

Which SQL commands will correctly grant access with the least privileges?

### 選択肢

GRANT SELECT ON TABLE bi.analytics.insights TO marketing_team;
GRANT USE CATALOG ON CATALOG bi TO marketing_team;
GRANT SELECT ON TABLE bi.analytics.insights TO marketing_team;
  

GRANT SELECT ON TABLE bi.analytics.insights TO marketing_team;
GRANT USE SCHEMA ON SCHEMA bi.analytics TO marketing_team;
GRANT USE CATALOG ON CATALOG bi TO marketing_team;
GRANT SELECT ON TABLE bi.analytics.insights TO marketing_team;
GRANT USE SCHEMA ON SCHEMA bi.analytics TO marketing_team;

## P2-Q030

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

A data engineer is building a pipeline to incrementally ingest new files from Azure Data Lake Storage. The workload is moderate, and files arrive at irregular intervals. The organization wants the simplest setup with no dependency on external event services.

Which ingestion approach should the data engineer choose?

### 選択肢

Use Auto Loader with file notifications enabled to support event-based file detection.

Use Auto Loader in directory listing mode to periodically scan the storage container for new files.

Use streaming ingestion with manual checkpoint state stored in a Delta table.

Use COPY INTO with a cron job scheduled every minute.

## P2-Q031

### カテゴリ

Section 7: Governance and Security（15%）

### 設問

In which of the following locations can a data engineer change the owner of a table?

### 選択肢

In the Catalog Explorer, under the Permissions tab of the database's page, since owners are set at database-level

In the Catalog Explorer, from the Owner field in the database's page, since owners are set at database-level

In the Catalog Explorer, under the Permissions tab of the table's page

In the Catalog Explorer, from the Owner field in the table's page

## P2-Q032

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 設問

A data engineer is troubleshooting high cloud costs associated with a Databricks job cluster. The cluster is configured with a fixed size of 15 workers, but the workload typically requires fewer resources except during peak processing periods.

Which recommendation would best optimize compute usage while reducing cost?

### 選択肢

Replace the job cluster with an all-purpose cluster to improve cluster availability

Switch to smaller instance types while maintaining a fixed-size cluster configuration

Configure auto-termination after periods of inactivity during idle times

Configure autoscaling with appropriate minimum and maximum worker limits

## P2-Q033

### カテゴリ

Section 7: Governance and Security（15%）

### 設問

A data engineering team wants to migrate a large external table to a managed table. A senior data engineer suggested using the ALTER TABLE ... SET MANAGED command to achieve this goal.

What are the key advantages of using SET MANAGED for this conversion?

Choose 2 answers

### 選択肢

Immediately deletes the original external storage location after conversion to save storage costs.

Incrementally synchronizes changes from the source to the target location on each run.

Minimizes downtime during migration by copying only the latest table version.

Keeps the same table configurations, including name, settings, permissions, and views.

Retains table history and supports rolling back to an external table.

## P2-Q034

### カテゴリ

Section 5: Implementing CI/CD（10%）

### 設問

Which Databricks CLI command is used to check a bundle configuration for errors before deployment?

### 選択肢

databricks bundle verify

databricks bundle validate

databricks bundle init

databricks bundle check

## P2-Q035

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

Fill in the following blank to successfully create a table using data from CSV files located at /path/input

CREATE TABLE my_table
(col1 STRING, col2 STRING)
____________
OPTIONS (header = "true",
        delimiter = ";")
LOCATION = "/path/input"
USING DELTA

AS CSV

USING CSV

### 選択肢

FROM CSV

## P2-Q036

### カテゴリ

Section 7: Governance and Security（15%）

### 設問

When dropping a Delta table, which of the following explains why both the table's metadata and the data files will be deleted?

### 選択肢

The data files are older than the default retention period

The table is external

The table is shallow cloned

The table is managed

## P2-Q037

### カテゴリ

Section 6: Troubleshooting, Monitoring, and Optimization（10%）

### 設問

Which of the following commands can a data engineer use to purge stale data files of a Delta table?

### 選択肢

VACUUM

OPTIMIZE

CLEAN

DELETE

## P2-Q038

### カテゴリ

Section 5: Implementing CI/CD（10%）

### 設問

A data platform team is deploying a Declarative Automation Bundle (formerly Databricks Asset Bundle) to the production workspace. They want to ensure that the deployment is aborted if any existing jobs or pipelines defined in the bundle are currently running, to prevent overwriting active workloads.

Which deployment command should the team use to meet this requirement?

### 選択肢

databricks bundle deploy -t prod --force

databricks bundle deploy -t prod --fail-on-active-runs

databricks bundle deploy -t prod --check-executions

databricks bundle deploy -t prod --stop-if-running

## P2-Q039

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 設問

Which of the following is Not a valid task type in Databricks Jobs?

### 選択肢

REST API call

SQL query

Python wheel

If/else condition

## P2-Q040

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

A data engineer has defined the following data quality constraint in a Lakeflow Spark Declarative Pipeline (formerly Delta Live Tables):

CONSTRAINT valid_id EXPECT (id IS NOT NULL) _____________

Fill in the above blank so records violating this constraint will be dropped, and reported in metrics

ON VIOLATION DELETE ROW

ON VIOLATION DROP ROW

ON VIOLATION FAIL UPDATE

### 選択肢

There is no need to add ON VIOLATION clause. By default, records violating the constraint will be discarded, and reported as invalid in the event log

## P2-Q041

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

Given the following Structured Streaming query:

(spark.table("orders")
        .withColumn("total_after_tax", col("total")+col("tax"))
    .writeStream
        .option("checkpointLocation", checkpointPath)
        .outputMode("append")
        .___________
        .table("new_orders") )

Fill in the blank to make the query executes multiple micro-batches to process all available data, then stops the trigger.

trigger(processingTime=”0 seconds")

trigger(micro-batches=True)

trigger(once=True)

### 選択肢

trigger(availableNow=True)

## P2-Q042

### カテゴリ

Section 5: Implementing CI/CD（10%）

### 設問

What is the primary purpose of the targets section in a Databricks Asset Bundle's databricks.yml file?

### 選択肢

To specify different deployment environments with their respective configurations

To define user roles and access policies for the workspace

To list the external libraries required by the bundle

To configure the version of the Databricks Runtime

## P2-Q043

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

A financial services company wants to migrate nightly account data from an on-premises PostgreSQL database into the Databricks platform. The ingested records must be stored in a managed Unity Catalog table, while maintaining automatic lineage tracking for compliance audits.

Which implementation best satisfies these requirements?

### 選択肢

jdbc_url = "jdbc:postgresql://db-host:5432/finance"
credentials = {"user": "<user_name>", "password": "<password>"}
df = spark.read.jdbc(url=jdbc_url, table="main.accounts", properties=credentials)
df.write.mode("overwrite").saveAsTable("finance.main.accounts")
spark.readStream
        .format("postgresql")
        .option("postgresql.server", "db-host:5432/finance")
        .option("table", "main.accounts")
        .load()
    .writeStream
        .option("checkpointLocation", checkpoint_path)
        .toTable("finance.main.accounts")
CREATE OR REPLACE TABLE finance.main.accounts
AS SELECT * FROM postgresql.`db-host:5432/finance/main/accounts`
COPY INTO finance.main.accounts
FROM 'db-host:5432/finance'
FILEFORMAT = TABLE
COPY_OPTIONS (name="main.accounts", properties=credentials);

## P2-Q044

### カテゴリ

Section 7: Governance and Security（15%）

### 設問

"One of the foundational technologies provided by the Databricks Intelligence Platform is an open-source, file-based storage format that brings reliability to data lakes"

Which of the following technologies is being described in the above statement?

### 選択肢

Apache Spark

Delta Lake

Unity Catalog

Delta Lives Tables (DLT)

## P2-Q045

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 設問

A data analyst works with two PySpark DataFrames: doctors_df and appointments_df, both containing a doctor_id column. They need a new DataFrame that includes only doctors who have scheduled appointments, combining columns from both DataFrames.

Which PySpark code achieves this?

### 選択肢

joined_df = doctors_df.join(appointments_df, "doctor_id", "cross")

joined_df = doctors_df.join(appointments_df, "doctor_id", "inner")

joined_df = doctors_df.join(appointments_df, "doctor_id", "full")

joined_df = doctors_df.join(appointments_df, "doctor_id", "left")

## P2-Q046

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 設問

An e-commerce company experiences rapid data growth due to seasonal traffic spikes. Their engineering team needs to ensure that batch processing jobs complete within a fixed timeframe, even during peak hours. The team has limited human resources for infrastructure management and seeks a solution with automated scaling and optimization.

Which option best fulfills these conditions?

### 選択肢

Dedicated clusters with Photon enabled

Job clusters with maximum resource allocation

Databricks Serverless compute

All-purpose clusters with autoscaling enabled

## P2-Q047

### カテゴリ

Section 5: Implementing CI/CD（10%）

### 設問

A data engineer is configuring a job using Databricks Asset Bundles and wants to limit its access to authorized users. The following job definition includes tasks and job clusters, but the engineer also needs to define which user groups can manage or view the job.

resources:
  jobs:
    my-job:
      name: analytics-job
      tasks: [...]
      job_clusters: [...]
      __________:
        - group_name: devops-team
          level: CAN_MANAGE
        - group_name: qa-team
          level: CAN_VIEW

Which option correctly fills in the blank to meet the specified requirement?

### 選択肢

roles

permissions

job_settings

access_control

## P2-Q048

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

Which of the following code blocks can a data engineer use to query the events table as a streaming source?

### 選択肢

spark.read.table("events")

spark.readStream().table("events")

spark.readStream("events")

spark.readStream.table("events")

## P2-Q049

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 設問

A large Databricks job fails at task 12 of 15 due to a missing configuration file. After resolving the issue, what is the most appropriate action to resume the workflow?

### 選択肢

Wait for the next scheduled run

Restart the job

Repair run from task 12

Run the notebook associated with task 12 manually

## P2-Q050

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

A data engineer is using the following Auto Loader stream to incrementally ingest JSON files from an object cloud storage:

df = (
   spark.readStream
        .format("cloudFiles")
        .option("cloudFiles.format", "json")
        .option("cloudFiles.schemaLocation", path)
        .option("cloudFiles.inferColumnTypes", "true")
        .load(input_path)
)

Which of the following correctly explains the option("cloudFiles.inferColumnTypes", "true")?

### 選択肢

It enables the inference of relational column types (e.g., primary key and foreign key) from the JSON data

It enables the inference of precise data types (e.g., integers, booleans, and timestamps) from the JSON data

It forces all inferred columns to be treated as strings to ensure schema consistency across batches

It automatically enables schema evolution to add new columns with their inferred data types (e.g., integers, booleans, and timestamps).

## P2-Q051

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

In Delta Lake tables, which of the following is the primary format for the transaction log files?

### 選択肢

Delta

Parquet

XML

JSON

## P2-Q052

### カテゴリ

Section 7: Governance and Security（15%）

### 設問

A data engineer has the following SQL statement:

CREATE POLICY banking_policy ON SCHEMA bank.safebox
COLUMN MASK bank.safebox.mask_card
TO financial_analysts EXCEPT admins
FOR TABLES
MATCH COLUMNS hasTagValue('pii','credit_card') AS cc
ON COLUMN cc;

Which of the following correctly describe this statement?

### 選択肢

Apply column masking using the mask_card UDF for every column tagged pii across all tables in the schema bank.safebox. Users in the group financial_analysts see masked values, while users in the group admins see unmasked values.

Apply column masking using the mask_card UDF for every column tagged pii=credit_card across all tables in the schema bank.safebox. Users in the group financial_analysts see unmasked values, while users in the group admins see masked values.

Apply row filtering using the mask_card UDF for every column tagged pii=credit_card across all tables in the schema bank.safebox. Users in the group financial_analysts see filtered rows, while users in the group admins see unfiltered rows.

Apply column masking using the mask_card UDF for every column tagged pii=credit_card across all tables in the schema bank.safebox. Users in the group financial_analysts see masked values, while users in the group admins see unmasked values.

## P2-Q053

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

A data engineer is designing a streaming ingestion pipeline using Auto Loader. The requirement is that the pipeline should never fail on schema changes but must capture any new columns that arrive in the data for later inspection.

Which of the following schema evolution modes should the engineer use to meet this requirement?

### 選択肢

addNewColumns

rescue

none

failOnNewColumns

## P2-Q054

### カテゴリ

Section 7: Governance and Security（15%）

### 設問

A data engineer at a global bank manages a Delta Lake table customer_accounts with columns:

customer_id, name, account_number, credit_card. They want to apply a mask on the credit_card column so that only analysts in the Fraud Detection Department can view the actual values. To achieve this, they implemented the following user-defined function:

CREATE FUNCTION card_mask(credit_card STRING)
  RETURN CASE WHEN is_account_group_member('FraudDetectionDept') THEN credit_card ELSE '****-****-****-****' END;

Which command can the data engineer use to apply this function as a column mask to the table?

### 選択肢

ALTER TABLE customer_accounts SET MASK card_mask ON (credit_card);

ALTER TABLE customer_accounts SET MASK card_mask;

SET MASK card_mask ON TABLE customer_accounts TO COLUMN credit_card;

ALTER TABLE customer_accounts ALTER COLUMN credit_card SET MASK card_mask;

## P2-Q055

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

What is a key benefit of Liquid Clustering for analytical workloads in Databricks?

### 選択肢

It ensures real-time streaming from input datasource

It encrypts sensitive data fields automatically during ingestion

It prevents data duplication, thereby enhancing query performance

It reduces the volume of scanned data during query execution

