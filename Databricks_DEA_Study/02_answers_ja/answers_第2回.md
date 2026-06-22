# Answers 第2回

- Source: `C:\Users\motok\Desktop\Databricks DEA\Exam Guide\split_questions\answers_第2回.md`
- Count: 55
- ID format: P2-Q001

## P2-Q001

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 正答

- Under Advanced attributes, disable the setting “Automatically detect column types”

### 設問の解説

By default, when you upload a CSV or JSON file via the "Create or modify a table using file upload" UI, Databricks automatically attempts schema inference (it scans the row data to guess whether a column is an integer, boolean, date, etc.).

If you expand the Advanced attributes menu in the UI and toggle off (disable) the "Automatically detect column types" setting, Databricks stops checking for data patterns. As a result, it falls back to treating every column uniformly as a STRING data type. This is a best-practice strategy when your source data contains messy or irregular values that could otherwise break automatic schema inference.

Why the other options are incorrect:

Edit the inferred schema using header dropdowns to set all columns to STRING

While the Databricks UI does allow you to click individual column headers to change their types manually, you have to do this one by one. There is no bulk dropdown or quick setting in the header preview to change all columns to STRING simultaneously. If your CSV has dozens or hundreds of columns, this approach is highly inefficient and prone to error.

No action required; all CSV columns are created with the STRING data type by default

Databricks has "Automatically detect column types" enabled by default. Therefore, it will actively try to infer specific numeric, boolean, or timestamp types rather than defaulting to STRING.

The file upload UI does not provide any setting to update the inferred column data types

This statement is completely false. The UI provides explicitly designed controls to handle this—both at the individual column header level (manually overriding types) and at the global level under Advanced attributes (disabling detection completely).

リソース

## P2-Q002

### カテゴリ

Section 7: Governance and Security（15%）

### 正答

- Apply column masks to configure fine-grained access control

### 設問の解説

Column masks in Unity Catalog are security features that dynamically control the visibility of sensitive data in specific columns based on the identity or role of the user executing a query. Implemented as SQL user-defined functions (UDFs), column masks replace or transform the original column values at query runtime, ensuring that unauthorized users see redacted or anonymized data.

For example, a masking function might display full Social Security Numbers (SSNs) only to users in the Human Resources department, while showing masked values like ***-**-**** to others. These masks are applied declaratively using the MASK clause:

CREATE FUNCTION mask_ssn(ssn STRING)
RETURN CASE WHEN is_member('hr_team')
THEN ssn ELSE '***-**-****' END;

CREATE TABLE persons(name STRING, ssn STRING MASK mask_ssn);

Why other options are incorrect:

Use a dynamic view to mask sensitive PII columns

While dynamic views can be used for masking, column-level masking in Unity Catalog is more efficient and built-in for this purpose. Dynamic views require creating and maintaining additional views manually.

Use table object privileges to revoke access on sensitive PII columns

table object privileges control access to entire tables, not specific columns. This would prevent access entirely rather than selectively hiding PII.

Use row-level filters to restrict access to region-specific customers

Row-level filtering controls which rows a user sees, but it does not protect specific columns (like emails or phone numbers) from unauthorized users.

リソース

## P2-Q003

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 正答

- Task C is configured with run_if: At least one failed

### 設問の解説

In Databricks Lakeflow Jobs, tasks run in a Directed Acyclic Graph (DAG) based on the execution outcomes of their upstream dependencies. The behavior of a downstream task is dictated by its run_if (Run if dependencies) configuration.

Analyzing the Graph's State:

Task_A finished with a state of Succeeded.

Task_B finished with a state of Failed.

Task_C runs downstream, depending on both Task_A and Task_B. It completed with a state of Succeeded.

Evaluating the Condition:

Because Task_B failed, the default execution condition (All succeeded) is violated. If Task_C used All succeeded, it would have been marked as Upstream failed.

However, because Task_C is configured with At least one failed, the failure of Task_B satisfies this specific condition trigger. Therefore, Databricks evaluates the condition as met, allows Task_C to execute, and Task_C successfully runs to completion.

リソース

## P2-Q004

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 正答

- ALTER TABLE transactions ALTER COLUMN transaction_id SET NOT NULL;

### 設問の解説

In Databricks and Delta Lake, you manage constraints using standard SQL ALTER TABLE syntax. Delta Lake supports two types of constraints: NOT NULL and CHECK constraints:

NOT NULL constraints must be modified or added to existing tables using the ALTER TABLE ... ALTER COLUMN ... SET NOT NULL command. Each column requires its own separate statement to enforce the rule.

CHECK constraints are used for boolean expression value checks (e.g., CHECK (price > 0)). While you can use a check constraint to prevent nulls conceptually (like CHECK(column IS NOT NULL)), Delta Lake explicitly designates SET NOT NULL as the correct native approach for managing column nullability constraints.

Why the other options are incorrect:

ALTER COLUMNS (transaction_id, transaction_date)...: The syntax is invalid because ALTER COLUMN operates on a single column at a time.

CHECK(... IS NOT NULL): These attempt to use generic boolean validation logic instead of Delta Lake's native column property command for nullability. In addition, the syntax is incorrect because it is missing the ADD CONSTRAINT clause:

         ALTER TABLE table_name ADD CONSTRAINT constraint_name CHECK (...)

リソース

## P2-Q005

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 正答

- Eliminate rows where either order_id or payment_method contains null values

### 設問の解説

To understand why this is correct, we have to look at the default behavior of PySpark’s dropna() function (alias for df.na.drop() ). The complete under-the-hood signature for this method is:

df.dropna(how='any', thresh=None, subset=None)

By default, the how parameter is set to 'any'. When you specify a list of columns in the subset argument, PySpark narrows its scan to only those columns. Because how='any' is applied implicitly, Spark will drop a row if it finds a null value in order_id OR a null value in payment_method.

Why the other options are incorrect:

Eliminate rows where both columns contain null values This behavior only occurs if you explicitly set the how parameter to 'all'—for example, df.dropna(subset=['order_id', 'payment_method'], how='all'). Since it is not specified here, it defaults to 'any'.

Replace null values in order_id and payment_method with empty strings The dropna() function is strictly designed to delete entire rows from a DataFrame. If you want to replace null values with blank strings or filler text, you would use the df.fillna() (or df.na.fill()) method instead.

Drop both columns from the dataframe “df” This option confuses dropna() with the df.drop() method. Running df.drop('order_id', 'payment_method') removes structural columns entirely, whereas dropna() filters out data rows based on missing values.

リソース

## P2-Q006

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 正答

- SELECT * FROM json.`/Volumes/analytics/events/source_files/transactions.json`

### 設問の解説

In Databricks Unity Catalog, Volumes provide a path-based interface for accessing non-tabular data (like JSON, CSV, images, or PDF files). The standardized URI format for referencing files stored within a Unity Catalog volume is:

/Volumes/<catalog_name>/<schema_name>/<volume_name>/<file_path>

Based on this scenario:

Catalog name: analytics

Schema name: events

Volume name: source_files

File name: transactions.json

Putting this together yields the path /Volumes/analytics/events/source_files/transactions.json.

Why the other options are incorrect:

dbfs:/FileStore/...: This refers to the legacy Databricks File System (DBFS) root, not a Unity Catalog Volume.

s3://...: This bypasses Unity Catalog's managed volume pathing entirely and assumes a raw cloud storage structure, which won't work directly through the Volume abstraction layer.

/Volumes/source_files/...: This reverses the hierarchy. Unity Catalog always follows the standard 3-layer namespace: Catalog -> Schema -> Object (Volume or Table).

リソース

## P2-Q007

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 正答

- Auto Loader

### 設問の解説

In Databricks Lakeflow Connect, ingestion features are split into different categories based on the level of code and automation involved:

Managed Connectors (No-Code): These are fully managed, UI-driven connectors designed for popular SaaS systems and databases. They handle authentication, scheduling, schema drift, and Change Data Capture (CDC) automatically. Salesforce, Workday Reports, and PostgreSQL database all belong to this managed ingestion set.

Standard Connectors (Code-Based): Auto Loader falls into this tier. While it is highly automated and optimized for incrementally loading files from cloud object storage (like AWS S3, ADLS, or GCS), it is classified as a standard, code-based connector that requires you to write Structured Streaming or Lakeflow Spark Declarative Pipelines code rather than using a fully managed no-code wizard.

リソース

## P2-Q008

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 正答

- Streaming table

### 設問の解説

For this use case, the most suitable object is a Streaming table. Streaming tables are designed to handle near real-time data ingestion and incremental processing, allowing Lakeflow Declarative Pipelines to continuously capture and process new records as they arrive via Auto Loader, ensuring high performance and reliability. So, streaming tables specifically support continuous, real-time updates, making them ideal for pipelines that require up-to-the-moment data freshness.

While Materialized Views (formerly Live Tables) provide batch-oriented or scheduled incremental processing. Temporary views, in contrast, are ephemeral and not suited for persistent, incremental streaming workloads.

リソース

## P2-Q009

### カテゴリ

Section 7: Governance and Security（15%）

### 正答

- They can configure email notifications settings in the job page

### 設問の解説

Databricks Jobs* support email notifications to be notified in the case of job start, success, or failure. Under Job notifications in the details panel of your job page, click Edit notifications to add one or more email addresses.

* Please note that Databricks Jobs has been recently renammed to Lakeflow Jobs, however, the current exam version may still refer to it as Databricks Jobs.

Study materials from our exam preparation course on Udemy:

Hands-on

リソース
ドメイン
Productionizing Data Pipelines

## P2-Q010

### カテゴリ

Section 5: Implementing CI/CD（10%）

### 正答

- Commit & Push

### 設問の解説

Commit & Push is used to save the changes on a local repo, then uploads this local repo content to the remote repository.

Study materials from our exam preparation course on Udemy:

Hands-on

リソース
ドメイン
Development and Ingestion

## P2-Q011

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 正答

- An error is thrown

### 設問の解説

By default, if you use the CAST function on a string that contains characters that are not part of the target type (such as the trailing $ symbol in '100$'), the query will fail immediately and throw a runtime exception: [CAST_INVALID_INPUT].

If the engineer wanted the query to tolerate malformed data and return a NULL instead of failing, they would need to use the TRY_CAST function instead:

SELECT TRY_CAST('100$' AS INT); -- This would safely return NULL

リソース

## P2-Q012

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 正答

- Data skew

### 設問の解説

Data Skew occurs when data is unevenly distributed across the partitions in a cluster. While most partitions are a healthy, uniform size (around 100 MB), a few partitions holding "several gigabytes" indicate that a specific key or set of keys has a massive amount of associated data.

In Apache Spark, a single task processes a single partition. Because of this, the tasks assigned to those massive gigabyte-sized partitions take significantly longer to finish than the rest. This creates a classic "straggler task" scenario, where the entire stage is held up waiting for just a few slow tasks to complete.

Why the other options are incorrect:

Network timeout: While a data-skewed task can eventually cause network timeouts if an executor becomes completely unresponsive under heavy load, the timeout itself is a symptom, not the primary bottleneck causing the uneven task distribution.

Small file problem: This is the exact opposite issue. The small file problem occurs when you have thousands of tiny partitions (e.g., a few kilobytes or megabytes each), leading to excessive coordination overhead for the driver.

Executor memory leak: An executor memory leak would typically cause tasks to slow down progressively across the board over time, or result in sudden OutOfMemoryError (OOM) crashes, rather than causing a specific, highly visible imbalance in partition sizes within the Spark UI.

リソース

## P2-Q013

### カテゴリ

Section 7: Governance and Security（15%）

### 正答

- Temporary view

### 設問の解説

In order to avoid copying and storing physical data, the data engineer must create a view object. A view in databricks is a virtual table that has no physical data. It’s just a saved SQL query against actual tables.

The view type should be Temporary view since it’s tied to a Spark session and dropped when the session ends.

Study materials from our exam preparation course on Udemy:

Lecture

Hands-on

リソース
ドメイン
Data Processing & Transformations

## P2-Q014

### カテゴリ

Section 7: Governance and Security（15%）

### 正答

- SQL warehouse compute
- Classic compute configured with standard or dedicated access mode

### 設問の解説

The compute requirements to securely access data in Unity Catalog are, either:

SQL Warehouse Compute: Unity Catalog is securely supported by default on all SQL warehouse compute versions.

Access Modes: To successfully read or write governed tables in Unity Catalog using classic compute clusters, the cluster must be configured with a compatible access mode. These access modes ensure data isolation and governance. The primary supported modes are:

Standard (formerly known as Shared access mode)

Dedicated (formerly known as Single User access mode)

Why other options are incorrect:

"No isolation shared" access mode explicitly bypasses the necessary isolation barriers required by Unity Catalog security and is therefore unsupported.

Databricks Runtime versions below 11.3 LTS do not have the required core features to support Unity Catalog functionality (Unity Catalog requires Databricks Runtime 11.3 LTS or above).

リソース

## P2-Q015

### カテゴリ

Section 7: Governance and Security（15%）

### 正答

- In the control plane as a securely stored and encrypted workspace object

### 設問の解説

In the control plane as a securely stored and encrypted workspace object
Databricks employs a dual-plane architecture consisting of a Control Plane and a Compute Plane (historically called the Data Plane). The control plane houses the backend services managed by Databricks, which includes the web application UI, cluster management services, and workspace object coordination. Notebook source files and commands are treated as workspace assets; they are permanently stored in the Databricks-managed control plane and are fully encrypted at rest.

Why the other options are incorrect:

In the compute plane, inside the Spark cluster filesystem
The compute plane is where your data processing takes place using transient or persistent clusters (virtual machines). While a notebook is actively running, its execution context is attached to the cluster to run code cells via language REPLs. However, the cluster file system itself is temporary—if the cluster terminates or if the notebook is detached, any files strictly inside the cluster filesystem are wiped. The master copy of the notebook does not live here.

In Unity Catalog as encrypted data assets
Unity Catalog is Databricks' centralized data governance tool used to manage access permissions, data lineage, and metadata for data assets (like tables, views, volumes, and models). It does not serve as the storage backend for interactive user notebooks.

In Delta Lake tables within the data plane
Delta Lake is an open-source storage layer that brings ACID transactions and reliability to Apache Spark workloads, storing structured data tables within the customer's cloud storage bucket. Notebook source code files are not written or saved into Delta Lake tabular structures.

リソース

## P2-Q016

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 正答

- spark.driver.memory is insufficient to hold the collected data

spark.executor.cores is too low

### 設問の解説

When you call an action like df.collect() or df.toPandas() in Apache Spark, you are instructing Spark to gather all the distributed data from the executor nodes across the cluster and send it back to a single centralized location: the driver node.

Here is why this causes an OutOfMemory (OOM) error on the driver:

The Mechanism: Spark is designed for distributed computing, where datasets are split into smaller chunks (partitions) and processed in parallel by executors. However, df.collect() breaks this paradigm. It forces every single partition to be pulled over the network into the driver's local memory as a single unified collection (like a local Java list or an array).

The Root Cause: If the total size of the distributed dataset exceeds the memory allocated to the driver process (configured by spark.driver.memory), the driver's Java Virtual Machine (JVM) will completely run out of heap space, resulting in a java.lang.OutOfMemoryError: Java heap space.

Why the Other Options are Incorrect

spark.executor.cores is too low: This configuration controls the number of concurrent tasks an executor can run. If it is too low, your job will simply run slower because it has less parallelism, but it will not cause a driver-side OOM.

spark.sql.autoBroadcastJoinThreshold is too high: While setting this too high can sometimes cause driver OOMs during a join operation (because Spark tries to broadcast a table that is too large), it is not the direct or most likely cause of a failure triggered specifically by a manual df.collect() call.

spark.memory.fraction is too high: This parameter controls the fraction of JVM heap space allocated for Spark execution and storage on the executors. High values reduce user memory space on executors, which might cause executor-side OOMs, but not driver-side OOMs during collection.

## P2-Q017

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 正答

- Scheduled trigger

### 設問の解説

To update tables on a predictable cadence (every 15 minutes*) while minimizing compute costs and DBU consumption, a Scheduled trigger (using a cron expression) is the most cost-effective option.

When you use a Scheduled trigger with a Job Cluster, Databricks provisions the compute resources only when the job starts, runs the transformation logic to update the Gold tables, and immediately terminates the cluster upon completion. This prevents you from paying for idle compute time.

* If your SLA is strictly 15 minutes, scheduling the job exactly every 15 minutes leaves you zero margin for error. Instead, you can schedule it to run every 12 minutes, for example. By setting the interval to 12 minutes, you build in a 3-minute safety buffer. Even with cluster start-up times and slight processing delays, the data lands safely within the 15-minute window required by the business.

Why other options are incorrect:

Continuous trigger: This keeps a job permanently running by instantly launching a new run as soon as the previous one finishes or fails. For a 15-minute SLA, continuous mode would result in massive, unnecessary compute costs and DBUs because the cluster remains active and billing even when no new data is being processed.

Table update trigger & File arrival trigger: These are event-driven triggers. If upstream tables or files are updated frequently (e.g., every few seconds or minutes), these triggers would fire constantly. This would either keep a cluster up indefinitely or cause severe overhead from repeatedly spinning clusters up and down, driving up costs and failing to respect the specific 15-minute interval requirement.

リソース

## P2-Q018

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 正答

- Rows that violate the defined expectations are filtered out, and only valid rows are written to silver_sales

### 設問の解説

The expect_or_drop function is a data quality enforcement rule in SDP (previously known as DLT):

The expect part defines the quality constraint (e.g., "quantity BETWEEN 0 AND 1000").

The or_drop part defines the action to take when the expectation is violated. "Drop" means that the violating row is discarded (filtered out) and will not be written to the target table (silver_sales).

In this example, only rows that successfully pass all three defined expectations (quantity_within_range, recent_transaction, and valid_transaction) will be included in the silver_sales table. Rows failing any of them are discarded.

リソース

## P2-Q019

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 正答

- In the Bronze notebook, call: dbutils.jobs.taskValues.set("latest_batch_number", value) and in the Silver task configuration reference: {{tasks.BronzeTask.values.latest_batch_number}}

### 設問の解説

Databricks Lakeflow Jobs provide a built-in feature called Task Values. This feature is specifically designed to pass small pieces of information (like batch numbers, status codes, or strings) sequentially from one task to another within the same job run without needing to persist them to an external database, storage layer, or delta table.

How it works:

The upstream task (Bronze) sets the value using the Databricks Utilities (dbutils) API: dbutils.jobs.taskValues.set("latest_batch_number", value)

The downstream task (Silver) can then reference this value in its task parameter configuration using standard Databricks Jobs dynamic value references: {{tasks.BronzeTask.values.latest_batch_number}}

Why other options are incorrect:

Cluster environment variables: Cluster environment variables are static and set at the time of cluster creation or restart; they cannot be dynamically mutated by one notebook task and instantly read by another separate task in a shared workflow execution via spark.conf.get.

Temporary views: Spark temporary views are scoped strictly to the specific SparkSession in which they were created. Once the Bronze notebook task finishes execution and its session closes, the temporary view is completely destroyed and is inaccessible to the Silver notebook task.

Notebook widgets with dbutils.notebook.run: While this works for legacy workflows, it requires the engineer to manually orchestrate the pipeline from a single "master" driver notebook. It defeats the architectural purpose of using a Lakeflow Job workflow DAG (Directed Acyclic Graph), where Databricks natively handles the task scheduling, dependencies, and execution tracking visually.

リソース

## P2-Q020

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 正答

- Null values in the source column are assigned the value “unknown”

### 設問の解説

In PySpark, the df.na.fill() (alias for df.fillna()) function is specifically designed to replace missing or missing/null (None or NaN) values within a DataFrame.

When you pass a dictionary to this method—such as {"source": "unknown"}—the keys of the dictionary specify the target column names, and the corresponding values specify what to replace the nulls with.

Therefore, df.na.fill({"source": "unknown"}) looks explicitly at the source column, identifies any null values, and replaces them with the string "unknown". All non-null values in that column remain completely untouched.

リソース

## P2-Q021

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 正答

- Continuous trigger

### 設問の解説

In Lakeflow Jobs, the Continuous trigger keeps a job running indefinitely by launching a new run immediately after the previous one finishes or fails. It is optimized for continuous stream processing rather than reacting dynamically to newly dropped batch files.

The Continuous trigger is specifically designed for streaming workloads that require the lowest possible latency.

Why other options are incorrect:

Scheduled trigger: Runs the job at specific time intervals (e.g., every hour or every night). This introduces massive latency for real-time IoT data and does not run "continuously."

File arrival trigger: Only triggers the job when a new file lands in a specified storage location. While useful for event-driven batching, it isn't optimized for the absolute lowest-latency streaming loops required by continuous IoT streams.

Table update trigger: Runs a job only when a specific upstream table changes. Similar to the file arrival trigger, it is an event-based model rather than a continuous, low-latency streaming loop.

リソース

## P2-Q022

### カテゴリ

Section 6: Troubleshooting, Monitoring, and Optimization（10%）

### 正答

- Broadcast Join

### 設問の解説

The statement is describing a Broadcast Join (also known as a Broadcast Hash Join. Broadcast join is a join strategy where Spark broadcasts (copies) the smaller DataFrame to all executor nodes, so that each executor has a local copy and can perform the join without shuffling the larger DataFrame. This behavior can be understood through the following points:

Eliminating Data Shuffling: In distributed computing (like Apache Spark, Hive, or Delta Lake), joining two large tables requires moving data across the network so that matching keys end up on the same cluster node. This network movement is called shuffling and is incredibly expensive.

The "Broadcast" Mechanism: When one of the tables is small enough to fit easily into the memory of a single worker node, the system will broadcast (copy) that entire small table to every single node in the cluster.

Local Join Execution: Because every node now has a complete copy of the small table locally, it can join its portion of the large table against the small table without having to send any data across the network.

Why the other options are incorrect:

OPTIMIZE: This is a command used in Delta Lake to compact small files into larger ones (Z-Ordering/Data Skipping) to improve read performance, not a join technique.

Delta caching: This refers to caching data files locally on the nodes' NVMe/SSD storage to speed up subsequent reads of the same data, but it doesn't describe the specific join optimization mechanism of broadcasting tables.

Cross Join: This is a type of join that returns the Cartesian product of two tables (every row from table A paired with every row from table B). While a cross join can be broadcasted, the term "Cross Join" itself describes the logical operation, not the optimization technique of caching small tables across all nodes to eliminate shuffling.

リソース

## P2-Q023

### カテゴリ

Section 7: Governance and Security（15%）

### 正答

- Databricks Jobs

### 設問の解説

Databricks Jobs* allow to orchestrate data processing tasks. This means the ability to run and manage multiple tasks as a directed acyclic graph (DAG) in a job.

* Please note that Databricks Jobs has been recently renammed to Lakeflow Jobs, however, the current exam version may still refer to it as Databricks Jobs.

Study materials from our exam preparation course on Udemy:

Hands-on

リソース
ドメイン
Productionizing Data Pipelines

## P2-Q024

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 正答

- Adaptive Query Execution (AQE)

### 設問の解説

In Apache Spark, Adaptive Query Execution (AQE) is a feature that re-optimizes and adjusts query plans based on runtime statistics gathered during the execution of the query.

Spark's traditional Catalyst Optimizer creates an execution plan before the query runs (at compile time). However, it often lacks accurate data characteristics like the exact size of intermediate datasets. AQE solves this by looking at the actual runtime statistics, and dynamically applying three major optimizations:

Dynamically Coalescing Shuffle Partitions: It reduces the number of post-shuffle partitions if the intermediate data is small, avoiding the overhead of too many small tasks.

Dynamically Switching Join Strategies: If one of the join relations turns out to be small enough to fit into memory at runtime, AQE can switch a costly Sort-Merge Join into a much faster Broadcast Hash Join on the fly.

Dynamically Handling Data Skew: It detects if certain partitions are significantly larger than others (skewed data) and splits them into smaller sub-partitions to prevent a few slow tasks from bottlenecking the entire stage.

Why the other options are incorrect:

Photon Engine: This is Databricks' vectorized query engine written in C++ designed to speed up Spark workloads, but it is not the name of the dynamic framework that alters query plans based on runtime statistics.

Liquid Clustering: This is a Delta Lake feature that replaces traditional table partitioning and Z-ordering with a dynamic data layout technique.

Predictive Optimization: This is a Databricks platform feature that automatically runs maintenance operations (like OPTIMIZE and VACUUM) on Delta tables behind the scenes.

リソース

## P2-Q025

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 正答

- Managed connectors require writing custom Python code to handle the full authentication flow, data update logic, and network requests.

### 設問の解説

Databricks Lakeflow Connect provides fully-managed ingestion connectors designed to eliminate the need for writing and maintaining custom API code, pagination, or network handling. Instead of writing custom Python code, users can configure connections and ingestion pipelines using a point-and-click UI or a simple declarative API/SDK configuration. Databricks automatically handles the underlying authentication flow, network requests, and complex data update mechanics out of the box.

Reference & Verification of True Statements:

True: "...leverage efficient incremental reads and writes...": Lakeflow Connect uses change data capture (CDC) and incremental log processing to ingest data efficiently, minimizing api load on the sources and reducing ETL processing costs.

True: "...ingesting data from enterprise databases and Software as a Service (SaaS) applications.": It supports a large library of pre-built connectors including enterprise databases (such as MySQL, SQL Server) and popular SaaS applications (such as Salesforce, Microsoft Dynamics 365, Workday, ServiceNow).

True: "...governed by Unity Catalog and is powered by serverless compute and Lakeflow Spark Declarative Pipelines.": Lakeflow Connect integrates natively with Unity Catalog for end-to-end data lineage and governance. The backend ingestion pipelines deploy on managed serverless compute and feed natively into downstream Spark Declarative Pipelines (SDP).

リソース

## P2-Q026

### カテゴリ

Section 5: Implementing CI/CD（10%）

### 正答

- Git folders support creating and managing branches for development work.

### 設問の解説

One advantage of Git folders over the built-in Databricks Notebooks versioning is that Git folders support creating and managing branches for development work.

Study materials from our exam preparation course on Udemy:

Hands-on

リソース
ドメイン
Development and Ingestion

## P2-Q027

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 正答

- The Silver Layer stores raw data enriched with source file details and ingestion timestamps

### 設問の解説

Silver tables provide a more refined view of the raw data. For example, data can be cleaned and filtered at this level. And we can also join fields from various bronze tables to enrich our silver records

Study materials from our exam preparation course on Udemy:

Lecture

Hands-on

リソース
ドメイン
Data Processing & Transformations

## P2-Q028

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 正答

- LEFT JOIN

### 設問の解説

LEFT JOIN returns all values from the left table and the matched values from the right table, or appends NULL if there is no match. In the above example, we see NULL in the course_id of John (U0003) since he is not enrolled in any course.

リソース
ドメイン
Data Processing & Transformations

## P2-Q029

### カテゴリ

Section 7: Governance and Security（15%）

### 正答

- GRANT SELECT ON TABLE bi.analytics.insights TO marketing_team;
GRANT USE SCHEMA ON SCHEMA bi.analytics TO marketing_team;
GRANT USE CATALOG ON CATALOG bi TO marketing_team;
GRANT SELECT ON TABLE bi.analytics.insights TO marketing_team;
GRANT USE SCHEMA ON SCHEMA bi.analytics TO marketing_team;

### 設問の解説

To access a specific table, the user must be granted SELECT on the table itself, USE SCHEMA on the containing schema, and USE CATALOG on the parent catalog. This provides just enough access for read operations without overprovisioning.

Study materials from our exam preparation course on Udemy:

Lecture

Hands-on

リソース

## P2-Q030

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 正答

- Use Auto Loader in directory listing mode to periodically scan the storage container for new files.

### 設問の解説

Databricks Auto Loader provides a highly efficient, incremental way to ingest files from Azure Data Lake Storage (ADLS) without complex code. Choosing directory listing mode satisfies all of the organization's constraints:

Simplest Setup: Directory listing mode is the default behavior of Auto Loader. It requires zero cloud infrastructure configurations or extra permissions beyond access to the files themselves.

No External Event Services: Unlike file notification mode—which relies on setting up Azure Event Grid, Storage Queues, and managing the associated infrastructure permissions—directory listing mode operates entirely within the storage container itself.

Handles Irregular Intervals & Moderate Workloads: For a moderate workload, directory listing mode can efficiently scan the directory structure to identify new files since the last run. To save costs when files arrive irregularly, it can be run using the Trigger.AvailableNow (or once=True) setting to process only what has arrived since the last run and shut down.

Why the other options fall short

File Notifications Enabled: This mode requires setting up Azure Event Grid and Queue storage. It fails the requirement of having "no dependency on external event services."

Manual Checkpoint State in a Delta Table: This introduces unnecessary complexity and manual state tracking, violating the request for the "simplest setup." Auto Loader automatically handles checkpointing and state tracking out of the box.

COPY INTO with a 1-minute Cron Job: While COPY INTO is a great declarative SQL command for low-complexity ingestion, running a cron job every single minute to scan a directory can become highly inefficient and expensive as the number of total files in the container grows over time.

リソース

## P2-Q031

### カテゴリ

Section 7: Governance and Security（15%）

### 正答

- In the Catalog Explorer, from the Owner field in the table's page

### 設問の解説

From the Catalog explorer in your Databricks workspace, you can navigate to the table's page to review and change the owner of the table. Simply, click on the Owner field, then Edit owner to set the new owner.

Study materials from our exam preparation course on Udemy:

Hands-on

リソース

## P2-Q032

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 正答

- Configure autoscaling with appropriate minimum and maximum worker limits

### 設問の解説

The scenario describes a workload that typically requires fewer resources but occasionally experiences peak processing periods.

Databricks autoscaling allows the cluster to dynamically scale the number of workers up during peak times to handle heavy processing, and scale down during low-demand periods. Setting appropriate minimum and maximum limits ensures you have enough compute power when needed while preventing unnecessary spending when the workload is light. According to Databricks optimization best practices, autoscaling directly addresses under-utilization in fixed-size clusters.

Why other options are incorrect:

Using all-purpose clusters: All-purpose (interactive) clusters are significantly more expensive per Databricks Unit (DBU) than job clusters. Moving a production job to an all-purpose cluster would increase costs rather than reduce them.

Configuring auto-termination: Auto-termination shuts down a cluster after a period of inactivity. Since this is a job cluster, it already terminates automatically as soon as the job finishes. Furthermore, auto-termination does not solve the issue of paying for 15 workers while the job is running with low resource utilization.

Using fixed-size smaller instance types: Keeping a fixed-size cluster with smaller instances might lower costs slightly, but it sacrifices performance during peak processing periods and risks job failures due to Out-Of-Memory (OOM) errors if the instances are too small.

リソース

## P2-Q033

### カテゴリ

Section 7: Governance and Security（15%）

### 正答

- Keeps the same table configurations, including name, settings, permissions, and views.
- Retains table history and supports rolling back to an external table.

### 設問の解説

The two key advantages of using the ALTER TABLE ... SET MANAGED command for this conversion are:

Retains table history and supports rolling back to an external table.

Keeps the same table configurations, including name, settings, permissions, and views.

When migrating to a Unity Catalog managed table, Databricks explicitly states that using SET MANAGED provides several benefits over recreation methods (like CREATE TABLE AS SELECT). Most important among these is the preservation of full table history (allowing for continuous time travel) and the built-in ability to cleanly roll back using UNSET MANAGED if a safety net is needed. Furthermore, it avoids the manual overhead of rebuilding metadata because it completely preserves all table configurations—such as table name, Unity Catalog permissions, tags, properties, and associated views.

Why other options are incorrect:

Deletes the original external storage location after conversion: The original data is not deleted immediately; there is a safety window (typically 14 days) before data in the old location is automatically or manually vacuumed.

Incrementally synchronizes changes: SET MANAGED is a conversion command that shifts metadata management, not an incremental synchronization tool or an ongoing replication process.

Minimizes downtime by copying only the latest table version: While it does minimize reader/writer downtime, it does so by handling concurrent writes safely and preserving history, not by skipping past versions and only copying the latest.

## P2-Q034

### カテゴリ

Section 5: Implementing CI/CD（10%）

### 正答

- databricks bundle validate

### 設問の解説

Declarative Automation Bundles (DABs), the databricks bundle validate command checks whether your DAB configuration (defined in your databricks.yml file) is syntactically correct and structurally sound before you attempt to deploy any resources to your workspace.

Why other options are incorrect:

databricks bundle init: Used to initialize a brand-new bundle project template.

databricks bundle check: Not a valid Databricks CLI bundle command.

databricks bundle verify: Not a valid Databricks CLI bundle command.

リソース

## P2-Q035

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 正答

- USING CSV

### 設問の解説

CREATE TABLE USING allows to specify an external data source type like CSV format, and with any additional options. This creates an external table pointing to files stored in an external location.

Study materials from our exam preparation course on Udemy:

Lecture

Hands-on

リソース
ドメイン
Data Processing & Transformations

## P2-Q036

### カテゴリ

Section 7: Governance and Security（15%）

### 正答

- The table is managed

### 設問の解説

Managed tables are tables whose metadata and the data are managed by Databricks.

When you run DROP TABLE on a managed table, both the metadata and the underlying data files are deleted.

Study materials from our exam preparation course on Udemy:

Lecture

Hands-on

リソース
ドメイン
Data Processing & Transformations

## P2-Q037

### カテゴリ

Section 6: Troubleshooting, Monitoring, and Optimization（10%）

### 正答

- VACUUM

### 設問の解説

The VACUUM command deletes the unused data files older than a specified data retention period.

Study materials from our exam preparation course on Udemy:

Lecture

Hands-on

ドメイン
Databricks Intelligence Platform

## P2-Q038

### カテゴリ

Section 5: Implementing CI/CD（10%）

### 正答

- databricks bundle deploy -t prod --fail-on-active-runs

### 設問の解説

The --fail-on-active-runs flag explicitly instructs the deployment engine to fail and stop the deployment if there are any active, ongoing runs for the jobs or pipelines defined within that bundle.

This is a critical best practice when pushing to a production target (-t prod) because it prevents the deployment from corrupting active operational workloads—such as abruptly deleting and recreating an underlying Python package artifact while an active task is in the middle of spinning up and trying to read it.

Why the other options are incorrect:

--force: Used to bypass Git branch validation rules defined in production mode targets.

--stop-if-running and --check-executions: These are a non-existent flag for the bundle deploy command.

リソース

## P2-Q039

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 正答

- REST API call

### 設問の解説

In Databricks Jobs, valid task types include:

Python wheel: for running a Python wheel package.

SQL query: for executing an SQL command or query.

If/else condition: for adding a boolean conditional logic within a job workflow.

However, REST API call is not a task type in Databricks Jobs.

リソース

## P2-Q040

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 正答

- ON VIOLATION DROP ROW

### 設問の解説

With ON VIOLATION DROP ROW, records that violate the expectation are dropped, and violations are reported in the event log.

Study materials from our exam preparation course on Udemy:

Hands-on

リソース
ドメイン
Development and Ingestion

## P2-Q041

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 正答

- trigger(availableNow=True)

### 設問の解説

In Spark Structured Streaming, we use trigger(availableNow=True) to run the stream in batch mode where it processes all available data in multiple micro-batches. The trigger will stop on its own once it finishes processing the available data.

Study materials from our exam preparation course on Udemy:

Lecture

Hands-on

リソース
ドメイン
Development and Ingestion

## P2-Q042

### カテゴリ

Section 5: Implementing CI/CD（10%）

### 正答

- To specify different deployment environments with their respective configurations

### 設問の解説

The targets section in a databricks.yml file is used to define multiple deployment environments (such as development, staging, and production). Each target can have unique configurations such as workspace paths, cluster settings, and environment-specific variables. This structure supports environment isolation and deployment flexibility.

Study materials from our exam preparation course on Udemy:

Hands-on

リソース
ドメイン
Productionizing Data Pipelines

## P2-Q043

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 正答

- jdbc_url = "jdbc:postgresql://db-host:5432/finance"
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

### 設問の解説

The correct option uses the standard PySpark DataFrame API (spark.read.jdbc) to establish a synchronous JDBC connection, pull the nightly PostgreSQL records into memory, and overwrite them directly into a managed table utilizing Databricks Unity Catalog's 3-level namespace convention (catalog.schema.table, here expressed as finance.main.accounts).

Lineage Tracking: Unity Catalog automatically captures runtime, table-to-table, and column-level data lineage for all native Spark Dataframe API actions executed within Databricks (across Python, SQL, Scala, and R). Writing to a target table via df.write.saveAsTable() ensures that the process is completely audited and populated in the Unity Catalog lineage graph automatically.

リソース

## P2-Q044

### カテゴリ

Section 7: Governance and Security（15%）

### 正答

- Delta Lake

### 設問の解説

Delta Lake is an open source technology that extends Parquet data files with a file-based transaction log for ACID transactions that brings reliability to data lakes.

Study materials from our exam preparation course on Udemy:

Lecture

Hands-on

リソース
ドメイン
Databricks Intelligence Platform

## P2-Q045

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 正答

- joined_df = doctors_df.join(appointments_df, "doctor_id", "inner")

### 設問の解説

An inner join keeps only the rows where there is a match in both DataFrames based on the join key (doctor_id).

Because the analyst needs only doctors who have scheduled appointments, any doctor without an appointment (found only in doctors_df) and any appointment without a valid doctor (found only in appointments_df) will be filtered out.

By passing "doctor_id" as a string (instead of a column condition like doctors_df.doctor_id == appointments_df.doctor_id), PySpark automatically handles the duplicate column issue, leaving you with exactly one doctor_id column in the resulting DataFrame alongside all other combined columns from both sides.

Why the other options are incorrect:

"left" (Left Outer Join): This would include all doctors from doctors_df, even if they have zero scheduled appointments (the appointment columns would just show null).

"full" (Full Outer Join): This would include all doctors and all appointments, regardless of whether they match, padding missing data with null values on either side.

"cross" (Cross Join / Cartesian Product): This joins every single doctor row with every single appointment row, resulting in a massive, incorrect dataset that does not respect matching doctor_id values.

リソース

## P2-Q046

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 正答

- Databricks Serverless compute

### 設問の解説

Databricks serverless compute is designed to automatically adjust to variable workloads. This means the company does not need to overprovision resources during off-peak times, and it can still meet SLA obligations during high-demand periods. It removes operational overhead and allows engineers to focus on developing and optimizing data logic rather than infrastructure.

Study materials from our exam preparation course on Udemy:

Lecture

リソース
ドメイン
Productionizing Data Pipelines

## P2-Q047

### カテゴリ

Section 5: Implementing CI/CD（10%）

### 正答

- permissions

### 設問の解説

The permissions mapping is used to specify the access control lists (ACLs) for the job, defining which users or groups have what level of access (like CAN_MANAGE or CAN_VIEW).

リソース

## P2-Q048

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 正答

- spark.readStream.table("events")

### 設問の解説

Delta Lake is deeply integrated with Spark Structured Streaming. You can load tables as a stream using:

spark.readStream.table(<table_name>)

Study materials from our exam preparation course on Udemy:

Lecture

Hands-on

リソース
ドメイン
Development and Ingestion

## P2-Q049

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 正答

- Repair run from task 12

### 設問の解説

Databricks allow you to repair failed jobs by running only the subset of unsuccessful tasks and any dependent tasks. Because successful tasks are not re-run, this feature reduces the time and resources required to recover from unsuccessful job runs.

* Please note that Databricks Jobs has been recently renammed to Lakeflow Jobs, however, the current exam version may still refer to it as Databricks Jobs.

Study materials from our exam preparation course on Udemy:

Hands-on

リソース
ドメイン
Productionizing Data Pipelines

## P2-Q050

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 正答

- It enables the inference of precise data types (e.g., integers, booleans, and timestamps) from the JSON data

### 設問の解説

By default, when Auto Loader infers the schema for text-based formats that don't encode data types implicitly (like JSON, CSV, and XML), it infers all columns as strings to prevent type-mismatch issues during subsequent stream batches.

Setting option("cloudFiles.inferColumnTypes", "true") changes this default behavior. It instructs Auto Loader to sample the initial batch of files and select precise, specific data types for columns (such as integers, doubles, booleans, and timestamps) based on the actual formatting of the values found in the data, identical to how standard Apache Spark DataFrameReader schema inference functions.

リソース

## P2-Q051

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 正答

- JSON

### 設問の解説

Delta Lake builds upon standard data formats. Delta lake table gets stored on the storage in one or more data files in Parquet format, along with transaction logs in JSON format.

Study materials from our exam preparation course on Udemy:

Lecture

Hands-on

リソース
ドメイン
Databricks Intelligence Platform

## P2-Q052

### カテゴリ

Section 7: Governance and Security（15%）

### 正答

- Apply column masking using the mask_card UDF for every column tagged pii=credit_card across all tables in the schema bank.safebox. Users in the group financial_analysts see masked values, while users in the group admins see unmasked values.

### 設問の解説

This SQL syntax is an implementation of Attribute-Based Access Control (ABAC) policies in platforms like Databricks Unity Catalog. Here is how the components of the SQL statement map directly to the correct answer:

COLUMN MASK bank.safebox.mask_card: Explicitly states that this is a column masking policy using the specified User-Defined Function (UDF) rather than a row filtering policy.

ON SCHEMA bank.safebox ... FOR TABLES: Indicates that the policy is defined at the schema level and will dynamically cascade down to apply to columns across all tables inside the bank.safebox schema.

MATCH COLUMNS hasTagValue('pii','credit_card'): The hasTagValue function evaluates the tags applied to metadata. It searches specifically for columns tagged with the exact key-value pair where the tag is pii and its value is credit_card.

TO financial_analysts EXCEPT admins: This clause determines the target principals. The policy applies to members of the financial_analysts group (meaning they will see the masked results produced by the UDF). However, because admins are explicitly exempted via the EXCEPT clause, they bypass the restriction and see the raw, unmasked data.

リソース

## P2-Q053

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 正答

- rescue

### 設問の解説

The rescue schema evolution mode in Auto Loader ensures that the schema does not evolve, so the stream will not fail if new columns are added. Instead, any new columns are stored in the rescued data column, allowing later inspection without interrupting the stream. This meets the requirement to keep the stream running without failures and still capture new schema elements.

spark.readStream
    .format("cloudFiles")
    .option("cloudFiles.format", "json")
    .option("cloudFiles.schemaEvolutionMode", "rescue")
    .load("/path/to/files")

Auto Loader supports the following modes for schema evolution:

Study materials from our exam preparation course on Udemy:

Lecture

リソース
ドメイン
Development and Ingestion

## P2-Q054

### カテゴリ

Section 7: Governance and Security（15%）

### 正答

- ALTER TABLE customer_accounts ALTER COLUMN credit_card SET MASK card_mask;

### 設問の解説

To ensure that only analysts in the Fraud Detection Department can view the actual credit card numbers while others see masked values, the data engineer should apply the masking function directly to the specific column in the Delta Lake table. The correct SQL command to achieve this is:

ALTER TABLE customer_accounts ALTER COLUMN credit_card SET MASK card_mask;

This command modifies the existing credit_card column by associating it with the card_mask function, which conditionally reveals or masks the credit card data based on the user’s group membership.

リソース

## P2-Q055

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 正答

- It reduces the volume of scanned data during query execution

### 設問の解説

Liquid Clustering in Databricks is a feature designed to progressively optimize the physical layout of data within Delta tables by organizing it according to specified clustering keys, typically columns that are frequently queried.

By clustering related data together based on these clustering keys, Liquid Clustering enable data skipping, which significantly decreases the amount of data that needs to be scanned during query execution. This optimization leads to faster query response times and more efficient resource usage.

Study materials from our exam preparation course on Udemy:

Lecture

リソース
ドメイン
Databricks Intelligence Platform

