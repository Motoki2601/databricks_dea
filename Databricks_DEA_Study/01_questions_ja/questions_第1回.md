# Questions 第1回

- Source: `C:\Users\motok\Desktop\Databricks DEA\Exam Guide\split_questions\questions_第1回.md`
- Count: 55
- ID format: P1-Q001

## P1-Q001

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 設問

A data engineer needs to schedule a daily job to read data from an on-premises PostgreSQL database hosted inside a corporate data center. They must choose the appropriate compute option to ensure reliable connectivity to the on-prem system.

Which compute type should the data engineer use?

### 選択肢

Serverless SQL warehouse

All-purpose classic compute

Classic job compute

Serverless job compute

## P1-Q002

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 設問

A data engineer maintains the following Lakflow Job:

Task B is configured with run_if: ALL_SUCCESS, while Task C is configured with run_if: ALL_DONE.

Which of the following correctly describe this logic?

### 選択肢

Task B runs if Task A and C succeed, and Task C runs only if Task A is skipped and retired.

Task B runs if Task A and C succeed, and Task C runs regardless of other tasks' outcomes.

Task B runs only if Task A succeeds, and Task C runs only if Task A does not succeed.

Task B runs only if Task A succeeds, and Task C runs regardless of Task A's outcome.

## P1-Q003

### カテゴリ

Section 5: Implementing CI/CD（10%）

### 設問

A data engineer has made changes to a notebook inside a Databricks Git folder on a feature branch. The engineer now wants to merge these changes into the main branch.

What is the correct workflow for performing this operation?

### 選択肢

Commit changes and merge the feature branch into main in Databricks Git folder, then push the changes into the remote main branch.

Commit and push changes to the remote feature branch, then use the Databricks Repos UI to create a pull request (PR).

Merge the feature branch into main in Databricks Git folder, then commit and push the changes into the remote main branch.

Commit and push changes to the remote feature branch, then use the GitHub Ul or GitHub CLI to create a pull request (PR).

## P1-Q004

### カテゴリ

Section 6: Troubleshooting, Monitoring, and Optimization（10%）

### 設問

How long is the default retention period of the VACUUM command ?

### 選択肢

7 days

365 days

30 days

0 days

## P1-Q005

### カテゴリ

Section 7: Governance and Security（15%）

### 設問

A data engineering team is managing Delta tables in Unity Catalog under the infra_catalog.ops_db schema. One of the tables, device_logs, was originally created as an external table, but the team now wants Databricks to fully manage the table lifecycle, including automatic cleanup of underlying files when the table is dropped.

Which command should the team use to convert this external table into a managed table while maintaining the same table name, permissions, and history?

### 選択肢

ALTER TABLE infra_catalog.ops_db.device_logs SET type = “MANAGED”;

CREATE OR CONVERT TABLE infra_catalog.ops_db.device_logs AS MANAGED;

CREATE OR REPLACE TABLE infra_catalog.ops_db.device_logs;

ALTER TABLE infra_catalog.ops_db.device_logs SET MANAGED;

## P1-Q006

### カテゴリ

Section 7: Governance and Security（15%）

### 設問

A data engineer at a healthcare organization manages a Delta Lake table patient_records with columns: patient_id, name, department, and diagnosis. They want to create a user-defined function that masks the diagnosis column so that only doctors can view values in that column.

Which of the following functions can the data engineer use to achieve this?

### 選択肢

CREATE FUNCTION patient_mask(doctors STRING)
  RETURN CASE WHEN is_account_group_member('diagnosis') THEN doctors ELSE 'CONFIDENTIAL' END;
CREATE FUNCTION patient_mask(diagnosis STRING)
  RETURN CASE WHEN diagnosis IS NOT NULL THEN diagnosis ELSE 'CONFIDENTIAL' END;

CREATE FUNCTION patient_mask(diagnosis STRING)
  RETURN CASE WHEN is_account_group_member('doctors') THEN diagnosis ELSE 'CONFIDENTIAL' END;
CREATE FUNCTION patient_mask(diagnosis STRING)
  RETURN CASE WHEN is_account_group_member('doctors') THEN 'CONFIDENTIAL' ELSE diagnosis END;

## P1-Q007

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

In Lakeflow Connect, which of the following options are considered managed ingestion connectors?

Choose 2 answers

### 選択肢

COPY INTO

CREATE TABLE AS (CTAS)

Auto Loader

Software as a Service (SaaS) connectors

Database connectors

## P1-Q008

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 設問

Which of the following code blocks can a data engineer use to create a user defined function (UDF)?

### 選択肢

CREATE FUNCTION plus_one(value INTEGER)

RETURNS INTEGER

RETURN value +1;

CREATE UDF plus_one(value INTEGER)

RETURN value +1;

CREATE UDF plus_one(value INTEGER)

RETURNS INTEGER

RETURN value +1;

CREATE FUNCTION plus_one(value INTEGER)

RETURN value +1

## P1-Q009

### カテゴリ

Section 5: Implementing CI/CD（10%）

### 設問

A data engineering team is developing a complex ETL pipeline on Databricks. They want to ensure that their workflow configurations are version-controlled and can be deployed reliably across staging and production environments.

What is the most appropriate solution to achieve this task?

### 選択肢

Leverage Notebook built-in version history for source control, and deploy jobs using serverless notebook's Environment

Leverage Notebook built-in version history for source control, and create jobs using Databricks UI

Store the source code in Git folders, and deploy jobs using Databricks Asset Bundles (DAB)

Store the source code in Git Folders, and deploy jobs using Databricks REST API

## P1-Q010

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 設問

In the Spark UI, a stage contains 500 tasks. Most tasks complete in under 20 seconds, but a few tasks handling extremely large partitions take more than 25 minutes.

What Spark issue is occurring?

### 選択肢

Network timeout

Data skew

Small file problem

Executor memory leak

## P1-Q011

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 設問

A data engineer is validating incoming transaction data in a Databricks SQL pipeline. Some records contain unexpected symbols in numeric fields. The engineer runs the following query:

SELECT TRY_CAST('100$' AS INT);

Which of the following describes the result of this query?

### 選択肢

100

An error is thrown

NULL

$100

## P1-Q012

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 設問

According to the Databricks Lakehouse architecture, which of the following is located in the customer's cloud account?

### 選択肢

Classic compute virtual machines

Notebooks

Workflows

Databricks web application

## P1-Q013

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

Which of the following statements best describes Auto Loader?

### 選択肢

Auto loader monitors a source location, in which files accumulate, to identify and ingest only new arriving files with each command run. While the files that have already been ingested in previous runs are skipped.

Auto loader enables efficient insert, update, deletes, and rollback capabilities by adding a storage layer that provides better data reliability to data lakes.

Auto loader allows cloning a source Delta table to a target destination at a specific version.

Auto loader allows applying Change Data Capture (CDC) feed to update tables based on changes captured in source data.

## P1-Q014

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 設問

A data engineer is troubleshooting a Databricks job cluster that repeatedly fails during startup. The driver logs show frequent “Executor Lost” and “OutOfMemoryError: Java heap space” messages. Switching to a larger instance has resolved the issue.

What was the most likely reason for this issue?

### 選択肢

Schema mismatch

Incorrect file format

Misconfigured library

Input data size

## P1-Q015

### カテゴリ

Section 7: Governance and Security（15%）

### 設問

A data engineering team has a long-running multi-tasks Job. The team members need to be notified when the run of this job completes.

Which of the following approaches can be used to send emails to the team members when the job completes?

### 選択肢

They can configure email notifications settings in the job page

They can use Job API to programmatically send emails according to each task status

There is no way to notify users when the job completes

Only Job owner can be configured to be notified when the job completes

## P1-Q016

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 設問

A data engineer is working with a PySpark DataFrame df that contains online store visits. Each row represents a customer viewing a product page, with several columns including: user_id, product_id, and timestamp.

They want to ensure uniqueness at the product-view level, meaning each user should only have one record per product.

Which of the following PySpark code correctly implements this logic?

### 選択肢

df.dropDuplicates(["user_id", "product_id"])

df.dropDuplicates(["user_id", "product_id",”timestamp”])

df.dropDuplicates()

df.dropDuplicates(["timestamp"])

## P1-Q017

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

Given the following Structured Streaming query

(spark.readStream
        .format("cloudFiles")
        .option("cloudFiles.format", "json")
        .load(ordersLocation)
     .writeStream
        .option("checkpointLocation", checkpointPath)
        .table("uncleanedOrders")
)

Which of the following best describe the purpose of this query in a Medallion Architecture?

### 選択肢

The query is performing data transfer from a Gold table into a production application

The query is performing a hop from a Bronze table to a Silver table

The query is performing raw data ingestion into a Bronze table

The query is performing a hop from Silver table to a Gold table

## P1-Q018

### カテゴリ

Section 7: Governance and Security（15%）

### 設問

“A feature that illustrates the relationship between different data assets including tables, queries, notebooks, and dashboards, enabling users to trace the origin and flow of data across the entire lakehouse platform.”

Which of the following is being described in the above statement?

### 選択肢

Databricks Jobs

Databricks Lakeflow

Unity Catalog Data Lineage

Delta Live Tables DAGs

## P1-Q019

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

Which of the following statements is Not true about Delta Lake ?

### 選択肢

Delta Lake provides scalable data and metadata handling

Delta Lake provides audit history and time travel

Delta Lake provides ACID transaction guarantees

Delta Lake builds upon standard data formats: Parquet + XML

## P1-Q020

### カテゴリ

Section 5: Implementing CI/CD（10%）

### 設問

Which Databricks CLI command is used to create a new asset bundle project in a local directory?

### 選択肢

databricks bundle initialize

databricks bundle create

databricks bundle new

databricks bundle init

## P1-Q021

### カテゴリ

Section 7: Governance and Security（15%）

### 設問

A data engineering team working in Unity Catalog needs to ensure that the hr_group does not retain any existing privileges on the main.hr_schema before assigning a new, restricted set of permissions.

What command should the team execute first to meet this requirement?

### 選択肢

SHOW GRANTS hr_group ON SCHEMA main.hr_schema;

SHOW GRANTS ON SCHEMA main.hr_schema;

REVOKE ALL PRIVILEGES ON SCHEMA main.hr_schema FROM hr_group;

DENY ALL PRIVILEGES ON SCHEMA main.hr_schema TO hr_group;

## P1-Q022

### カテゴリ

Section 5: Implementing CI/CD（10%）

### 設問

A data engineer is configuring a new bundle project in the following databricks.yml file:

bundle:
  name: demo_bundle
 
include:
  - resources/*.yml
  - pipelines/*.yml

They want to define a target environment “dev” for development by setting the host URL and a root storage path.

Which configuration meets this requirement?

### 選択肢

workspaces:
      target: dev
      host: https://adb-1234567890123456.7.azuredatabricks.net
      root_path: /Users/dev.user@databricks.com/.bundle/${bundle.name}

targets:
  dev:
    mode: development
    workspace:
      host: https://adb-1234567890123456.7.azuredatabricks.net
      root_path: /Users/dev.user@databricks.com/.bundle/${bundle.name}
environments:
  dev:
    mode: development
    workspace:
      host: https://adb-1234567890123456.7.azuredatabricks.net
      root_path: /Users/dev.user@databricks.com/.bundle/${bundle.name}
hosts:
    dev:
      URL: https://adb-1234567890123456.7.azuredatabricks.net
      root_path: /Users/dev.user@databricks.com/.bundle/${bundle.name}

## P1-Q023

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 設問

A data engineering team is comparing records between two datasets in Databricks SQL to return matching rows. The comparison must also treat NULL values as equal when they appear in both datasets.

Which query satisfies null-safe equality in Databricks SQL?

### 選択肢

SELECT a.order_id, b.order_id
FROM orders_a a
INNER JOIN orders_b b
ON a.order_id <> b.order_id;
SELECT a.order_id, b.order_id
FROM orders_a a
INNER JOIN orders_b b
ON a.order_id = b.order_id;

SELECT a.order_id, b.order_id
FROM orders_a a
INNER JOIN orders_b b
ON a.order_id <=> b.order_id;
SELECT a.order_id, b.order_id
FROM orders_a a
INNER JOIN orders_b b
ON a.order_id = b.order_id
AND (a.order_id IS NULL
OR b.order_id IS NULL);

## P1-Q024

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 設問

A data engineering team is building a notebook and needs fast iteration and debugging during development. Which compute should they use in this case?

### 選択肢

Serverless SQL warehouse

Instance pools

Interactive compute

Serverless Job compute

## P1-Q025

### カテゴリ

Section 7: Governance and Security（15%）

### 設問

Which TWO of the following describe benefits of enabling predictive optimization on managed tables in Unity Catalog?

### 選択肢

It enhances query performance by collecting statistics as data is written to the table.

It reduces overall cost by forecasting storage usage and reallocating data across tiers.

It improves data profiling by automatically predicting missing values in the table columns.

It simplifies maintenance by automatically running maintenance operations on the table.

It boosts data privacy by automatically encrypting data on write and masking sensitive columns.

## P1-Q026

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 設問

A data engineer designs a Lakeflow Job with multiple notebook tasks. They want to configure the parameter processing_region once for the entire job so that every task receives the same value. The value of processing_region should also be able to be changed at runtime from the Jobs UI without modifying notebook code.

Which configuration approach best satisfies these requirements?

### 選択肢

Define processing_region as a job-level parameter and reference it in each task using the dynamic value {{job.parameters.processing_region}}

Hard-code processing_region separately inside every notebook to ensure consistency across tasks.

Define processing_region as a cluster environment variable and access it in notebooks using spark.conf.get.

Pass processing_region only to the first notebook task and forward it manually to downstream notebooks using dbutils.notebook.run.

## P1-Q027

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

A data engineering team is loading CSV files from cloud storage into a Delta table using COPY INTO. Some files were previously partially ingested due to a failed pipeline run, and now the team wants to reprocess all files regardless of whether they were already loaded.

What should they use to ensure all files are re-ingested?

### 選択肢

COPY_OPTIONS('force' = 'true')

COPY_OPTIONS('checkpointing' = 'false')

COPY_OPTIONS('idempotency' = 'false')

COPY_OPTIONS('overwrite' = 'true')

## P1-Q028

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

A data engineering team builds a Lakeflow Job with an ingestion task followed by two possible execution paths: one for streaming processing and one for batch processing. They want to select the appropriate path dynamically based on a parameter processing_mode.

Which solution best supports conditional task execution in a Lakeflow Job?

### 選択肢

Execute both tasks in parallel and evaluate the processing_mode parameter inside each task.

Execute both tasks in parallel and let downstream tasks ignore irrelevant outputs based on the parameter.

Use an if/else conditional task to route execution based on the processing_mode parameter.

Combine streaming and batch logic in a single notebook task and determine the execution flow programmatically within the code.

## P1-Q029

### カテゴリ

Section 7: Governance and Security（15%）

### 設問

When dropping a Delta table, which of the following explains why only the table's metadata will be deleted, while the data files will be kept in the storage?

### 選択肢

Delta prevents deleting files less than retention threshold, just to ensure that no long-running operations are still referencing any of the files to be deleted

The table is external

The table is managed

The user running the command has no permission to delete the data files

## P1-Q030

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 設問

A data analyst works with two PySpark DataFrames: products_df and reviews_df, both containing a product_id column. They need a DataFrame that includes all products, even if they have no reviews, and enriches it with review data where available.

Which PySpark code achieves this?

### 選択肢

joined_df = products_df.join(reviews_df, "product_id", "full")

joined_df = products_df.join(reviews_df, "product_id", "left")

joined_df = products_df.join(reviews_df, "product_id", "inner")

joined_df = products_df.join(reviews_df, "product_id", "cross")

## P1-Q031

### カテゴリ

Section 6: Troubleshooting, Monitoring, and Optimization（10%）

### 設問

Which of the following commands can a data engineer use to compact small data files of a Delta table into larger ones ?

### 選択肢

ZORDER BY

COMPACT

VACUUM

OPTIMIZE

## P1-Q032

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

A data engineer builds a Lakeflow Job that ingests JSON logs from cloud storage. New files arrive at unpredictable times, and the team wants to automatically run the job as soon as new files land so the data is processed immediately.

What trigger configuration should the data engineer use for this job?

### 選択肢

Continuous trigger

File arrival trigger

Scheduled trigger

Table update trigger

## P1-Q033

### カテゴリ

Section 7: Governance and Security（15%）

### 設問

Which of the following commands can a data engineer use to grant full permissions to the HR team on the table employees ?

### 選択肢

GRANT ALL PRIVILEGES ON TABLE employees TO hr_team

GRANT FULL PRIVILEGES ON TABLE employees TO hr_team

GRANT ALL PRIVILEGES ON employees TO hr_team

GRANT SELECT, MODIFY, CREATE, READ_METADATA ON TABLE employees TO hr_team

## P1-Q034

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

A data engineer needs to use Lakeflow Connect to incrementally ingest customer data from a supported SaaS application into Unity Catalog-governed tables.

Which configuration step in Lakeflow Connect is required to achieve this ingestion?

### 選択肢

Export CSV files from the SaaS application into a Unity Catalog volume and use COPY INTO command to incrementally load the exported files into a Delta table.

Select a Unity Catalog connection that stores the application credentials, then configure a foreign catalog to directly access the SaaS application and load the data.

Select a Unity Catalog connection that stores the application credentials, then configure the destination catalog and schema, and set the schedule and notifications.

Export JSON files from the SaaS application into a Unity Catalog volume and use Auto Loader to incrementally write the exported files into a Delta table.

## P1-Q035

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

A data engineering team is ingesting 100,000 new files of small JSON files per day into a Delta table from Azure Data Lake Storage. The team requires low-latency incremental ingestion and wants to minimize storage API costs caused by frequent directory scans.

Which ingestion configuration should the team prioritize?

### 選択肢

Use COPY INTO scheduled every 5 minutes with recursive directory scanning.

Use Spark Structured Streaming with manual file tracking using a metadata Delta table.

Use Auto Loader in directory listing mode with reduced interval to frequently check for new files.

Use Auto Loader with cloudFiles.useNotifications = true to enable event-based file detection

## P1-Q036

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 設問

A data analyst at a clothing e-commerce company is building a product catalog generator. They work with two PySpark DataFrames:

colors_df (containing available product colors)

sizes_df (containing available product sizes)

They need to generate every possible combination of color and size so that the design team can create all valid variations for inventory planning.

Which PySpark code achieves this?

### 選択肢

joined_df = colors_df.join(sizes_df, "color_id", "full")

joined_df = colors_df.crossJoin(sizes_df)

joined_df = colors_df.join(sizes_df, "color_id", "left")

joined_df = colors_df.join(sizes_df, "color_id", "inner")

## P1-Q037

### カテゴリ

Section 6: Troubleshooting, Monitoring, and Optimization（10%）

### 設問

A data engineer is analyzing a dataset of clickstream events from a high-traffic website. The dataset includes fields such as user_id, timestamp, event_type, and page_url. During a join operation between the clickstream logs and a user profile dataset (joined on user_id), the job’s performance is significantly hindered due to uneven data distribution. Further analysis confirms a data skew caused by a small subset of users generating a disproportionately large number of events.

Which of the following approaches is NOT an appropriate solution to mitigate the skew in this scenario?

### 選択肢

Broadcast the skewed keys to all worker nodes to avoid shuffle during the join.

Separate processing of skewed keys by handling high-frequency users in a dedicated job.

Use salting by appending a random prefix to skewed user_id values to distribute the load across partitions.

Repartition the clickstream dataset to increase the number of partitions before the join.

## P1-Q038

### カテゴリ

Section 5: Implementing CI/CD（10%）

### 設問

A data platform team is setting up a CI/CD pipeline to deploy a Declarative Automation Bundle (formerly Databricks Asset Bundle) to the production workspace. The deployment must run non-interactively in an automated pipeline, ensuring that no confirmation prompts block execution.

Which deployment command should the team use to meet this requirement?

### 選択肢

databricks bundle deploy --target prod --force

databricks bundle deploy --target prod --confirm

databricks bundle deploy --target prod --auto-approve

databricks bundle deploy --target prod --non-interactive

## P1-Q039

### カテゴリ

Section 5: Implementing CI/CD（10%）

### 設問

Which of the following best describes the correct format of a Databricks Asset Bundle configuration file?

### 選択肢

A XML file named asset_bundle.xml specifying the workspace path, job IDs, and compute specifications

A JSON file named databricks_asset.json containing cluster definitions and job schedules

A YAML file named databricks.yml that defines the bundle's structure, including targets, resources, and configurations.

A YAML file named bundle-config.yml with fields for environment variables and user roles

## P1-Q040

### カテゴリ

Section 6: Troubleshooting, Monitoring, and Optimization（10%）

### 設問

A data engineering team is running a Spark SQL query on a large Delta table. The query performs a join between a large fact table and a small dimension table. After enabling Adaptive Query Execution (AQE), they notice improved performance without changing the query logic.

What is the primary reason AQE improves performance in this scenario?

### 選択肢

AQE disables shuffling entirely for all joins

AQE rewrites the query into Python code for faster execution

AQE automatically converts the join to a broadcast join at runtime based on actual data statistics

AQE forces all joins to use sort-merge join regardless of data size

## P1-Q041

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

In the Medallion Architecture, which of the following statements best describes the Silver layer tables?

### 選択肢

The table structure in this layer resembles that of the source system table structure with any additional metadata columns like the load time, and input file name.

They provide a more refined view of raw data, where it’s filtered, cleaned, and enriched.

They maintain raw data ingested from various sources

They maintain data that powers analytics, machine learning, and production applications

## P1-Q042

### カテゴリ

Section 5: Implementing CI/CD（10%）

### 設問

A data engineering team has the following Declarative Automation Bundle (DAB) configuration:

variables:
 schema_name:
   default: demo_schema
 
resources:
 jobs:
   sales_job:
     name: sales_job
     tasks:
       - task_key: load_data
         notebook_task:
           notebook_path: ../src/load_data.py
           base_parameters:
             schema_name: ${var.schema_name}

A data engineer deploys the bundle using:

databricks bundle deploy -t dev --var="schema_name=finance_schema"

Later, the data engineer runs the job using:

databricks bundle run -t dev sales_job --var="schema_name=marketing_schema"

What value will be passed to the notebook parameter schema_name during the job run?

### 選択肢

marketing_schema

The run will fail because variables cannot be passed to bundle run

finance_schema

demo_schema

## P1-Q043

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 設問

A data engineer is analyzing customer transactions and needs to determine the maximum and minimum transaction amounts for each customer. They use the following code structure:

from pyspark.sql import functions as F
 
result_df = df.____________("customer_id").agg(
    F.max("transaction_amount").alias("max_transaction"),
    F.min("transaction_amount").alias("min_transaction")
)

Which function correctly fills in the blank to meet the specified requirement?

### 選択肢

withColumn

window

groupBy

select

## P1-Q044

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

A data analyst at a retail company is responsible for generating daily reports on sales performance across multiple regions and product categories. The company ingests transaction data continuously from its online stores using Lakeflow Declarative Pipelines (formerly Delta Live Tables). The analyst needs to create a relational object that can efficiently precompute business-level aggregations, such as total revenue, average order value, and units sold per category, so that downstream reporting and dashboards can access the data quickly without recalculating it every time.

Which of the following objects is most suitable for this use case?

### 選択肢

Streaming table

Temporary view

Streaming view

Materialized view

## P1-Q045

### カテゴリ

Section 6: Troubleshooting, Monitoring, and Optimization（10%）

### 設問

What is the primary function of Liquid Clustering in Databricks?

### 選択肢

To encrypt data stored in Delta Lake

To improve the speed of network connectivity between nodes

To incrementally optimize data layout for improved query performance

To automate the creation of new data pipelines

## P1-Q046

### カテゴリ

Section 7: Governance and Security（15%）

### 設問

A data engineer is trying to grant a user access to a table. They run the following command successfully:

GRANT SELECT ON TABLE bank_catalog.fraud_schema.alert_cases TO analyst_group;

However, members of analyst_group get an “Insufficient Permissions” error when attempting to query the table.

Which TWO causes are most likely responsible for this issue?

### 選択肢

The analyst_group does not have the SELECT privilege on fraud_schema

The analyst_group does not have the USE SCHEMA privilege on fraud_schema

The analyst_group does not have the SELECT privilege on bank_catalog

The data engineer is not the owner of the alert_cases table

The analyst_group does not have the USE CATALOG privilege on bank_catalog

## P1-Q047

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

A streaming ETL job uses Auto Loader with the default schema evolution mode "addNewColumns" for ingesting sales data into a Delta table. After deployment, producers start sending a new column named discount.

How does Auto Loader handle this field?

### 選択肢

discount is added automatically, and all previous rows that do not match the new schema are deleted from the table.

discount is added automatically as a nullable column, with values populated only for new records.

discount is added automatically and all previous rows are rewritten with default discount = 0.

discount is upserted using an automatic merge operation, enabling previous rows to be updated based on matching keys

## P1-Q048

### カテゴリ

Section 6: Troubleshooting, Monitoring, and Optimization（10%）

### 設問

A data engineer is trying to use Delta time travel feature to rollback a table to a previous version, but the data engineer received an error that the data files are no longer present.

Which of the following commands was run on the table that caused deleting the data files?

### 選択肢

OPTIMIZE

VACUUM

ZORDER BY

DELETE

## P1-Q049

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

A data engineer has implemented the following streaming ingestion code using Databricks Auto Loader:

spark.readStream \
        .format("cloudFiles") \
        .schema(expected_schema) \
        .option("cloudFiles.format", "json") \
        .option("cloudFiles.schemaEvolutionMode", "failOnNewColumns") \
        .load("s3://vendor/raw/sales/json/") \
    .writeStream \
        .option("checkpointLocation", "s3://vendor/checkpoints/sales") \
        .start("sales_table")

What is the expected behavior of this streaming job if a new column appears in the incoming JSON files that is not part of the original schema?

### 選択肢

The stream fails and will not restart unless the schema is manually updated or the problematic data file is removed.

The stream fails temporarily but continues by ignoring the new columns without schema update.

The stream fails, but it automatically restarts after updating the schema with the new columns.

The stream fails, and all new columns are saved in a rescued data column for later processing.

## P1-Q050

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 設問

Given the following Structured Streaming query:

(spark.table("orders")
        .withColumn("total_after_tax", col("total")+col("tax"))
      .writeStream
        .option("checkpointLocation", checkpointPath)
        .outputMode("append")
         .______________ 
        .table("new_orders")
)

Fill in the blank to make the query executes a micro-batch to process data every 30 seconds

processingTime(”30 seconds") 

trigger(processingTime=”30 seconds")

trigger(”30 seconds")

### 選択肢

trigger(once=”30 seconds”)

## P1-Q051

### カテゴリ

Section 7: Governance and Security（15%）

### 設問

A data engineer wants to apply row filters and column masks for every column tagged confidential_info across many tables in the catalog.

Which approach should the data engineer use to complete this task?

### 選択肢

Apply Unity Catalog ABAC policies centrally across all relevant tables

Partition tables by confidential columns at table creation and restrict access at the partition level

Write custom code logic to manage table masking rules dynamically

Create dynamic views manually for every table to enforce masking rules individually

## P1-Q052

### カテゴリ

Section 7: Governance and Security（15%）

### 設問

A data engineer uses the following SQL query:

GRANT MODIFY ON TABLE employees TO hr_team

Which of the following describes the ability given by the MODIFY privilege ?

### 選択肢

It gives the ability to add data from the table

It gives the ability to delete data from the table

It gives the ability to modify data in the table

It gives the ability to add, update, or delete data within the table

## P1-Q053

### カテゴリ

Section 6: Troubleshooting, Monitoring, and Optimization（10%）

### 設問

Which of the following is the benefit of using the Auto Stop feature of Databricks SQL warehouses ?

### 選択肢

Improves the performance of the warehouse by automatically stopping ideal services

Minimizes the total running time of the warehouse

Provides higher security by automatically stopping unused ports of the warehouse

Increases the availability of the warehouse by automatically stopping long-running SQL queries

## P1-Q054

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 設問

A data engineer has a DataFrame, df, with a date_str column formatted as year-month, such as "2026-01", and wants to create a new column, month, that contains only the month value.

Which PySpark code snippet should the data engineer use?

### 選択肢

import pyspark.sql.functions as F
 
resultDf = df.withColumn("month", F.split(F.col("date_str"), "-").getItem(1) )
import pyspark.sql.functions as F
 
resultDf = df.withColumn("month", F.split(F.col("date_str"), "-").getItem(2) )
import pyspark.sql.functions as F
 
resultDf = df.withColumn("month", F.split(F.col("date_str"), "-0").getItem(2) )
import pyspark.sql.functions as F
 
resultDf = df.withColumn("month", F.split(F.col("date_str"), "-0").getItem(1) )

## P1-Q055

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 設問

A data engineer is exploring a large dataset in Databricks and executes df.summary() to better understand the data.

Which of the following best describes the output of this command?

### 選択肢

An AI-generated summary of the dataset that provides insights, patterns, and recommendations based on the underlying data values.

A DataFrame containing statistical metrics, including count, mean, standard deviation, min, max, and approximate quartile values for each column.

A Spark execution plan for DataFrame transformations, including details about logical and physical query optimization steps performed during execution.

A visualization dashboard showing trends and charts, including histograms, pie charts, and interactive graphs generated automatically from the DataFrame.

