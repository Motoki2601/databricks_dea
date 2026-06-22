# Answers 第4回

- Source: `C:\Users\motok\Desktop\Databricks DEA\Exam Guide\split_questions\answers_第4回.md`
- Count: 55
- ID format: P4-Q001

## P4-Q001

### カテゴリ

Section 6: Troubleshooting, Monitoring, and Optimization（10%）

### 正答

- Pro SQL Warehouse

### 設問の解説

Pro SQL Warehouses support secure connectivity to custom-defined networks, including hybrid architectures where data resides both in the cloud and on-premises. This setup is ideal for scenarios requiring private network access to databases or event-driven architectures.

Serverless options are managed by Databricks and typically do not operate within custom VPCs, making them unsuitable for such scenarios.

Study materials from our exam preparation course on Udemy:

Lecture

リソース

## P4-Q002

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 正答

- Serverless jobs compute

### 設問の解説

Serverless jobs compute With serverless compute, Databricks fully manages the infrastructure in its own compute plane (handling scaling, patching, and resource allocation). It dynamically provisions exactly what the job needs and terminates immediately when the job finishes. It dramatically reduces operational overhead because you no longer need to configure cluster sizing or VM types, and it virtually eliminates idle cluster costs because you are only billed for the exact duration your workload runs (with minimal startup delay).

Why the other options are incorrect:

SQL warehouses: While serverless SQL warehouses exist, they are optimized specifically for SQL analytics, BI tooling, and running ad-hoc queries, rather than natively orchestrating multi-step data pipelines within Lakeflow Jobs.

Classic all-purpose compute: This option is meant for interactive, ad-hoc development (like running code cells inside a notebook). Running production jobs on all-purpose compute incurs significantly higher Databricks Unit (DBU) costs and leaves you highly vulnerable to idle costs if the cluster doesn't shut down promptly after the job finishes.

Classic jobs compute: Though cheaper than all-purpose compute, classic jobs require you to manually size, configure, and manage instance types or pools. They also suffer from a 4-to-6 minute startup latency on your cloud provider's plane, during which you are still paying for infrastructure initialization.

リソース

## P4-Q003

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 正答

- ALTER TABLE users ADD CONSTRAINT eligible_adult CHECK (age > 18)

### 設問の解説

In Databricks and Delta Lake, you manage constraints using standard SQL ALTER TABLE syntax. Delta Lake supports two types of constraints: NOT NULL and CHECK constraints.

To add a CHECK constraint to an existing table, the required syntax specifies the table name, the ADD CONSTRAINT clause with a unique name for the constraint, and the CHECK condition itself.

ALTER TABLE table_name ADD CONSTRAINT constraint_name CHECK (condition);

Before enforcing the constraint, Delta Lake will automatically verify that all existing rows in the table meet the condition. If any existing row has an age less than or equal to 18, the command will fail.

The other options are incorrect because they represent invalid syntax formats.

リソース

## P4-Q004

### カテゴリ

Section 5: Implementing CI/CD（10%）

### 正答

- SELECT get_json_object(payload, '$.device_id') AS device_id,
       get_json_object(payload, '$.temperature') AS temperature
FROM bronze_iot; 
SELECT from_json(payload,
                 'device_id STRING, temperature STRING, humidity STRING') AS parsed_payload
FROM bronze_iot:
SELECT json_extract(payload, 'device_id') AS device_id,
       json_extract(payload, 'temperature') AS temperature
FROM bronze_iot;
- SELECT payload:device_id AS device_id,
       payload:temperature AS temperature
FROM bronze_iot;
SELECT payload.device_id AS device_id,
       payload.temperature AS temperature
FROM bronze_iot;

### 設問の解説

The TWO correct queries that extract data from the JSON string in Databricks SQL are:

1. payload:device_id (The Colon Sign Operator)

Databricks SQL features native semi-structured data extraction using the : syntax. When you use column:field, it acts as a shortcut to parse a STRING containing JSON (or a VARIANT type) and extract the specified key directly. It is highly readable and standard practice in modern Databricks pipelines.

2. get_json_object(payload, '$.field')

This is a standard built-in function designed specifically to parse JSON strings using JSONPath syntax. The $ represents the root JSON object, followed by .field to point to the desired key. It extracts the value efficiently and returns it as a string.

Why the other options are incorrect:

payload.device_id (Dot Notation)

Dot notation only works out-of-the-box if the column is already a native complex type like a STRUCT or a VARIANT. Because the prompt states that the payload column is a STRING, regular dot notation will fail with a compilation error because strings do not have native sub-attributes.

json_extract(payload, 'device_id')

json_extract is a valid function in Presto/Trino and Presto-flavored SQL dialects, but it is not a valid Databricks SQL built-in function. Running this in Databricks throws an "unresolved attribute / function not found" error.

from_json(payload, 'device_id STRING...')

While from_json is a completely valid Databricks function, this query contains two terminal errors:

Syntax Error: The schema definition string is broken. It opens with a single quote ('device_id...) but is missing the closing single quote before the closing parenthesis.

Logical Error: from_json parses the string into a single nested structural object (a STRUCT). To actually extract the individual fields out as columns for the silver table, you would still need to append dot notation to the outside of the function (e.g., from_json(...).device_id). As written, it does not output separate device_id and temperature columns.

リソース

## P4-Q005

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 正答

- agg

### 設問の解説

The agg() function is used after a groupBy() operation when applying one or more aggregate functions to grouped data. In this scenario, the data engineer is calculating both the sum and average of salaries, so agg() is the correct function.

## P4-Q006

### カテゴリ

Section 7: Governance and Security（15%）

### 正答

- The retail-analysts group will be able to read data from daily_revenue using SQL warehouses, but will not be able to create, alter, or delete objects in the sales catalog or transactions schema.

### 設問の解説

In Databricks Unity Catalog, securing and accessing data follows an explicit, hierarchical privilege model. Here is why this statement is correct based on the actions taken:

Read Access Granted Clearly: To read a table, a user or group needs the USE CATALOG privilege on its parent catalog, USE SCHEMA on its parent schema, and SELECT on the table itself. The data engineer explicitly granted all three of these matching prerequisites (sales catalog -> transactions schema -> daily_revenue table).

No Write/Modify Privileges: The USE CATALOG and USE SCHEMA privileges only allow a user to traverse or look inside those containers; they do not grant any permission to write, modify, or delete. To create tables, the group would explicitly need the CREATE TABLE privilege on the schema. To alter or delete, they would need ownership or explicit modification rights (like MODIFY or ALL PRIVILEGES).

リソース

## P4-Q007

### カテゴリ

Section 5: Implementing CI/CD（10%）

### 正答

- databricks bundle run sales_job

### 設問の解説

When working with Declarative Automation Bundles (DABs), you first use databricks bundle deploy to provision the resources into your designated workspace. Once deployed, the run command is used to trigger a specific job or pipeline resource defined within your configuration files.

Syntax Breakdown

databricks bundle run <resource-key> [flags]

sales_job: This corresponds to the resource key assigned to the job inside your databricks.yml (or included resources) configuration file.

If you have multiple targets configured (e.g., dev, prod) and want to target a non-default workspace, you can append the target flag: databricks bundle run sales_job -t prod.

Why other options are incorrect:

databricks bundle execute: The execute subcommand does not exist under the bundle command group.

databricks bundle trigger: While it sounds intuitive for triggering a job, it is not a valid Databricks CLI bundle command.

databricks bundle deploy --run: The deploy command is strictly meant for validating and copying your project bundle assets into the target environment; it does not feature an inline --run flag to simultaneously execute jobs.

リソース

## P4-Q008

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 正答

- df.summary() provides extended statistics such as approximate quartiles (25%, 50%, 75%), which are not available in df.describe().

### 設問の解説

Both df.describe() and df.summary() are used for quick exploratory data analysis, but they calculate different sets of statistics by default.

df.describe(): Computes a basic, fixed set of statistics for numeric and string columns: count, mean, stddev, min, and max.

df.summary(): Computes everything describe() does, but automatically includes approximate quartiles (25%, 50%, and 75%).

Furthermore, df.summary() is more flexible because it allows you to pass specific statistics as arguments if you only want a subset of the data (e.g., df.summary("count", "50%", "95%")), whereas describe() accepts a list of column names but a fixed set of metrics.

リソース

## P4-Q009

### カテゴリ

Section 7: Governance and Security（15%）

### 正答

- GRANT SELECT ON SCHEMA enterprise.reporting TO finance-analyst;  
GRANT USE SCHEMA ON SCHEMA enterprise.reporting TO finance-analyst;  
GRANT USE CATALOG ON CATALOG enterprise TO finance-analyst;

### 設問の解説

In Databricks Unity Catalog, privileges are structured hierarchically (catalog > schema > table/view). To access any data object, a user must have the appropriate container permissions at every level above it:

USE CATALOG: Required on the parent catalog (enterprise) to traverse down to its contained schemas. It does not grant read or write access to any other data objects inside the catalog.

USE SCHEMA: Required on the specific schema (enterprise.reporting) to look up objects inside that schema.

SELECT: Granting SELECT at the schema level automatically propagates read-only access to all existing and future tables and views within that specific schema. This completely satisfies the requirement without explicitly granting permissions table-by-table.

リソース

## P4-Q010

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 正答

- productsDf.select(col("*"), col("price").alias("unit_price"))

### 設問の解説

Here is why this specific fragment works while the others fail to meet the exact requirements:

productsDf.select(col("*"), col("price").alias("unit_price")):

col("*") selects all original columns from the DataFrame.

col("price").alias("unit_price") creates a temporary, duplicated column containing the price data but renames it to unit_price in the output.

It preserves the rest of the columns, leaves the original DataFrame schema completely unmodified, and outputs the result immediately.

Why the other options are incorrect:

productsDf.selectExpr("price as unit_price"): This will only return a DataFrame with a single column (unit_price), dropping all the other columns.

productsDf.select(col("price").alias("unit_price")): Like selectExpr, this isolates the price column and excludes all other columns from the output.

productsDf = productsDf.withColumnRenamed("price", "unit_price"): This actually modifies the schema by replacing the price column name with unit_price, meaning the original price column name is lost in the resulting DataFrame. Furthermore, it assigns it back to productsDf, overwriting the variable.

## P4-Q011

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 正答

- Restart the stream and it will automatically resume from the last committed offset using the converted table.

### 設問の解説

When you use the ALTER TABLE ... SET MANAGED command in Databricks, the underlying data files are moved from your external storage location to the managed storage location defined in Unity Catalog.

To prevent data corruption or missing updates during this migration, Databricks deliberately interrupts active streams reading from or writing to the table. The error message DELTA_STREAMING_INTERRUPTED_BY_MANAGED_TABLE_CONVERSION is built-in safety feedback telling you that the structure has changed. To fix it, you simply need to restart the streaming job. Once restarted with the same configuration, it will leverage Unity Catalog's automatic path-based redirection and pick up right where it left off using the newly managed table.

Why the other options are incorrect:

"Run the REPAIR TABLE command to update the checkpointing offset..." REPAIR TABLE is designed to scan file storage for new partition directories that were added outside of the catalog and register them to the metastore. It does not touch, update, or fix structured streaming checkpoints, which are managed independently by the streaming engine via cloud storage paths.

"Run the VACUUM command on the converted table to remove stale files..." VACUUM is used to permanently delete data files that have been logically removed from a Delta table via deletes or overwrites and are older than a specific retention threshold. Running it will not reset a streaming state or clear a streaming block.

"Roll back the converted managed table to an external table as this feature is supported by the SET MANAGED command." Even though UNSET MANAGED makes a rollback technically possible, doing so does not solve the data engineer's goal of moving to a managed table in production. Rolling back would undo the migration they just performed, rather than fixing the stream to work with the newly converted table.

リソース

## P4-Q012

### カテゴリ

Section 6: Troubleshooting, Monitoring, and Optimization（10%）

### 正答

- spark.conf.set("spark.sql.autoBroadcastJoinThreshold", 104857600)

### 設問の解説

This spark.sql.autoBroadcastJoinThreshold property configures the maximum size, in bytes, for a table that Spark will automatically broadcast to all worker nodes when performing a join. By broadcasting a small dimension table, Spark avoids an expensive shuffle operation of the large fact table, significantly boosting performance. This is known as a Broadcast Hash Join.

The Math: The configuration requires the value to be set in bytes.
100 MB = 100 * 1024 * 1024 bytes = 104,857,600 bytes

Why the other options are incorrect

spark.sql.broadcastTimeout: This sets the timeout change (in seconds) for how long an executor will wait for the broadcast dataset before throwing an error. It doesn't control the size threshold.

spark.sql.shuffle.partitions: This controls the default number of partitions used when shuffling data for joins or aggregations (the default is typically 200).

spark.executor.memory: This controls the total amount of memory allocated to each executor process, not a specific join behavior.

リソース

## P4-Q013

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 正答

- Checkpointing

### 設問の解説

Auto Loader keeps track of discovered files using checkpointing in the checkpoint location. Checkpointing allows Auto loader to provide exactly-once ingestion guarantees.

Study materials from our exam preparation course on Udemy:

Lecture

Hands-on

リソース

## P4-Q014

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 正答

- Configure cloudFiles.schemaLocation, and set cloudFiles.schemaEvolutionMode=addNewColumns to support automatic schema evolution

### 設問の解説

Databricks Auto Loader uses a set of specific configuration properties prefixed with cloudFiles to manage schema inference and evolution when ingesting data (such as JSON or CSV files).

To enable automatic schema evolution, Auto Loader requires two core setups:

cloudFiles.schemaLocation: A directory path where Auto Loader stores the inferred schema and tracks changes over time. This is mandatory for schema evolution to work.

cloudFiles.schemaEvolutionMode: This controls how Auto Loader handles new columns. Setting it to addNewColumns instructs the engine to automatically append any new fields discovered in the source files to the existing table schema without failing the streaming job.

Code Example

In practice, a data engineer would configure the streaming DataFrame reader like this:

# Streaming ingestion with Auto Loader schema evolution
df = (spark.readStream
            .format("cloudFiles")
            .option("cloudFiles.format", "json")
            .option("cloudFiles.schemaLocation", "/path/to/schema/checkpoint")
            .option("cloudFiles.schemaEvolutionMode", "addNewColumns")
            .load("/path/to/source/json/files"))
 
# Writing to a Delta table
    query = (df.writeStream
                .option("checkpointLocation", "/path/to/stream/checkpoint")
                .table("my_evolving_table"))

Why the other options are incorrect

"Auto Loader cannot detect...": This is false. Schema inference and evolution are core functionalities of Auto Loader specifically designed to handle data drift in file formats like JSON and CSV.

mergeSchema = true: While mergeSchema is a valid Delta Lake option used during writes to merge schemas, Auto Loader handles schema evolution on the read/ingestion side using cloudFiles.schemaEvolutionMode. Relying on Delta's mergeSchema alone without configuring Auto Loader's schema evolution mode will result in the streaming read failing or ignoring the new columns before they ever reach the write stage.

inferColumnTypes = true: While Auto Loader can infer column data types, this is not a valid configuration option for driving automatic schema evolution.

リソース

## P4-Q015

### カテゴリ

Section 7: Governance and Security（15%）

### 正答

- Supports rolling back the converted managed table to an external table.
- Redirects path-based reads and writes to allow legacy code to function after conversion.

### 設問の解説

The two correct key advantages are:

Rollback Failsafe: If anything goes wrong or if there's a reason to revert, you can safely use the inverse command (ALTER TABLE ... UNSET MANAGED) to seamlessly roll back the managed table to an external table structure.

Path-Based Redirects: To protect production workflows and prevent downtime, Databricks automatically redirects path-based reads and writes targeting the previous external storage location over to the new managed table location. This allows legacy code to continue functioning seamlessly without manual refactoring.

Why other options are incorrect:

Continues using the original external location... / Syncs locations in parallel: A managed table inherently moves data management control entirely to Unity Catalog's managed storage root. It does not maintain a dual-write sync or treat the old location as a concurrent single source of truth.

Deletes the original external storage location immediately: The original location is not immediately destroyed upon running the command. To prevent data loss, the data remains safely behind for 14 days.

リソース

## P4-Q016

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 正答

- @dp.table

### 設問の解説

dp.expect_all enforces all the specified data quality rules, writes both valid and invalid records to the target table, and captures metrics about any rule violations.

dp.expect would not fully meet the requirements because it applies expectations individually but doesn’t automatically enforce all of them together as a group. Similarly, dp.expect_or_drop removes individual invalid records, and dp.expect_or_fail stops the pipeline on individual rule violations. You can group multiple expectations together and specify collective actions using the functions dp.expect_all_or_drop, and dp.expect_all_or_fail.

リソース

## P4-Q017

### カテゴリ

Section 7: Governance and Security（15%）

### 正答

- Run History

### 設問の解説

The Run History (found inside the Lakeflow Jobs UI under the Runs tab) is specifically designed to track and monitor the performance of workflows over time.

Visualizing Execution Trends: It provides a matrix and list view of recent, active, and completed job runs, along with duration graphs that allow a data engineer to easily spot patterns like a gradual increase in execution duration (performance regression).

Comparing Metrics: It allows you to select and compare past runs side-by-side to look at performance indicators (e.g., rows read/written, query counts, task-level durations) to determine if the slowdown is caused by data volume growth, data skew, or changing workloads.

Why the Other Options are Incorrect

Query History: While Query History tracks individual SQL queries executed across SQL warehouses (showing query profiles, execution times, and performance bottlenecks), it is intended for ad-hoc or warehouse-level query debugging. It does not provide the unified, automated orchestration metrics or sequential multi-task trend monitoring inherent to Lakeflow Jobs.

Catalog Explorer: This tool is used strictly for data governance, discovering data assets, managing permissions (via Unity Catalog), and examining schema definitions or data lineage. It does not track or visualize job execution metrics or runtime durations.

Dashboards: Lakeflow Dashboards are used to build business intelligence (BI) data visualizations and reports for end-users. While you could technically build a custom dashboard by querying underlying system tables (like system.lakeflow.job_run_timeline), it is not an out-of-the-box feature built natively into the Job interface for checking immediate execution trends.

## P4-Q018

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 正答

- Control plane

### 設問の解説

According to the Databricks Lakehouse architecture, Databricks workspace is deployed in the control plane along with Databricks services like Databricks web application (UI), Cluster manager, workflow service, and notebooks.

Study materials from our exam preparation course on Udemy:

Lecture

リソース

## P4-Q019

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 正答

- Significantly lower compute costs

### 設問の解説

Spot instances are a cost-effective option provided by cloud providers (such as AWS, Azure, and GCP) that allow users to take advantage of unused compute capacity at a reduced price—often up to 90% less than on-demand instances. In Databricks, configuring clusters to use spot instances can substantially reduce operational expenses for workloads that are tolerant of potential interruptions.

However, while they offer significant cost savings, spot instances are not well-suited for time-sensitive or mission-critical workloads due to the risk of unexpected termination by the cloud provider.

Study materials from our exam preparation course on Udemy:

Lecture

リソース

## P4-Q020

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 正答

- The query is performing a hop from Silver layer to a Gold table

### 設問の解説

The above Structured Streaming query creates business-level aggregates from clean orders data in the silver table cleanedOrders, and loads them in the gold table aggregatedOrders.

Study materials from our exam preparation course on Udemy:

Lecture

Hands-on

## P4-Q021

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 正答

- PostgreSQL ingestion is only supported via batch JDBC, not native streaming

### 設問の解説

Standard JDBC connections are inherently static, batch-oriented data sources. Apache Spark’s native JDBC connector does not support a continuous, incremental streaming mechanism. When you attempt to read from a PostgreSQL database using a traditional JDBC connection, Spark has no native way of tracking offsets, database transaction logs, or row-level deltas in a continuous stream.

Therefore, if a data engineer wants to bring data from PostgreSQL directly into an SDP using a traditional Spark JDBC configuration, it must be performed as a batch/snapshot read (such as utilizing the spark.read.format("jdbc") function.

To achieve true, near-real-time streaming from PostgreSQL into Databricks Lakeflow, you cannot use raw JDBC. Instead, you must use Lakeflow Connect, which relies on native database logical replication (WAL/Change Data Capture) rather than standard JDBC polling.

Why the Other Options are Incorrect

"Streaming tables support continuous JDBC ingestion from PostgreSQL"

Streaming tables are designed to incrementally append or update data coming from streaming sources (like Cloud Object Storage via Auto Loader/read_files or message queues like Kafka). They cannot natively force a raw JDBC database connection into a continuous stream because the JDBC source itself lacks streaming semantics.

"JDBC sources are automatically treated as streaming sources in SDP"

In SDP, Spark cannot automatically convert a static table from a relational database into a streaming source. If you attempt to wrap a standard JDBC dataset in a STREAM format, the pipeline will fail with an error stating that the source does not support streaming.

"PostgreSQL can be consumed directly like Kafka in streaming tables"

Kafka is built from the ground up as a distributed append-only log with inherent message offsetting, making it natively compatible with Spark's Structured Streaming engine. PostgreSQL is a relational database; it does not naturally expose a pub/sub message log via standard JDBC. Treating it like Kafka would require an intermediary CDC tool or a fully configured ingestion engine like Lakeflow Connect.

## P4-Q022

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 正答

- Dashboards

### 設問の解説

Gold tables provide business level aggregates often used for reporting and dashboarding, or even for Machine learning.

Study materials from our exam preparation course on Udemy:

Lecture

## P4-Q023

### カテゴリ

Section 7: Governance and Security（15%）

### 正答

- Use liquid clustering on the combination of user_id and event_date

### 設問の解説

In this scenario, using liquid clustering on the combination of user_id and event_date is the best choice to avoid expensive scans. This technique incrementally optimizes data layout based on both columns, efficiently supporting filters on these columns and avoiding costly table scans.

Partitioning only on event_date helps queries filtering by date but doesn’t optimize filtering by user_id, leading to potential full scans within partitions. Z-order indexing on user_id optimizes queries filtering on user_id but ignores event_date filtering, resulting in inefficient scans when filtering by date. Lastly, partitioning on user_id + Z-order on event_date supports filtering on both columns but can create many small partitions (if users are numerous), causing management and performance issues.

Study materials from our exam preparation course on Udemy:

Lecture

## P4-Q024

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 正答

- INSERT INTO users VALUES (“0015”, “Adam”, 23)

### 設問の解説

INSERT INTO allows inserting new rows into a Delta table. You specify the inserted rows by value expressions or the result of a query.

Study materials from our exam preparation course on Udemy:

Hands-on

リソース

## P4-Q025

### カテゴリ

Section 6: Troubleshooting, Monitoring, and Optimization（10%）

### 正答

- SQL warehouses

### 設問の解説

Compute resources are infrastructure resources that provide processing capabilities in the cloud. A SQL warehouse is a compute resource that lets you run SQL commands on data objects within Databricks SQL.

Study materials from our exam preparation course on Udemy:

Hands-on

リソース

## P4-Q026

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 正答

- Databricks SQL

### 設問の解説

Databricks SQL (DB SQL) is a data warehouse on the Databricks Lakehouse Platform that lets you run all your SQL and BI applications at scale.

Study materials from our exam preparation course on Udemy:

Hands-on

リソース

## P4-Q027

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 正答

- Compute Optimized

### 設問の解説

The OPTIMIZE command compacts small files into larger ones for better access patterns. Z-Order indexing further sorts data based on specific columns to improve query pruning. Both operations require substantial computational resources for scanning and writing data. Therefore, compute-optimized resources provide the necessary CPU power and parallelism to efficiently process these tasks. While storage and memory are important, the main bottleneck during optimization is CPU-intensive compute operations.

Study materials from our exam preparation course on Udemy:

Lecture

リソース

## P4-Q028

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 正答

- FORMAT_OPTIONS ('modifiedAfter'  =  'ts')

### 設問の解説

In Databricks SQL, the COPY INTO command allows you to specify generic file data source reader options inside the FORMAT_OPTIONS clause.

To filter and ingest only files that have been modified after a specific date and time, Databricks provides the generic format option modifiedAfter. It accepts a timestamp string (e.g., '2026-01-01 00:00:00.000000 UTC+0') to filter out files that are older than the specified cutoff.

The required syntax uses key-value assignments inside FORMAT_OPTIONS:

COPY INTO target_table
FROM 'abfss://logs@staging.dfs.core.windows.net/'
FILEFORMAT = JSON
FORMAT_OPTIONS ('modifiedAfter' = 'ts');

The other options are incorrect because they represent invalid syntax formats

リソース

## P4-Q029

### カテゴリ

Section 5: Implementing CI/CD（10%）

### 正答

- Store all timestamps as TIMESTAMP type in UTC

### 設問の解説

In global data architectures, storing timestamps in Coordinated Universal Time (UTC) is the absolute best practice. Here is why this approach outperforms the other options:

A Single Source of Truth: Storing data from multiple countries in a single, unshifting time standard removes all ambiguity. It allows you to seamlessly sequence events that happen across different continents (e.g., tracking if a passenger booked a connecting flight before or after their first leg landed).

Daylight Saving Time (DST) Immunity: Local time zones change due to DST, which can cause duplicate hours in autumn or missing hours in spring. UTC does not observe DST, protecting your data from chronological anomalies.

Performance and Indexing: Native TIMESTAMP types are stored internally as compact integers (typically microseconds or milliseconds since the Unix epoch). This makes sorting, filtering, and indexing incredibly fast compared to parsing STRING representations.

Why the other options are incorrect:

Storing as STRING: While readable, it breaks date-time math. To filter data (e.g., WHERE booking_date > '2026-01-01'), the database engine must perform expensive string parsing, heavily degrading query performance.

Converting only in BI tools: If you keep timestamps in local time without standardization at the database layer, downstream calculations (like global revenue per hour) become highly complex, error-prone, and slow, as the BI layer has to constantly map changing local offsets.

Storing without timezone context: This results in data corruption. If an event is recorded as 10:00 AM without knowing if it was Tokyo, London, or New York time, the data becomes useless for global tracking.

## P4-Q030

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 正答

- 0

### 設問の解説

COALESCE is a built-in SQL function that evaluates a list of arguments in order and returns the very first non-NULL value it finds, in this case, 0.

Here is exactly how the Databricks SQL pipeline processes this query from the inside out:

TRY_CAST("100$" AS INT): The TRY_CAST function attempts to cast the string "100$" to an integer. Because the string contains an unexpected non-numeric symbol ($), a standard CAST would normally throw a runtime error. However, TRY_CAST is specifically designed to handle formatting mismatches gracefully; when it encounters a value it cannot cast, it returns NULL instead of failing the pipeline.

COALESCE(..., 0): The COALESCE function evaluates the arguments in order and returns the first non-null value. Since the first argument (TRY_CAST outcome) is NULL, COALESCE falls back to the second argument, which is 0.

Reference

リソース

## P4-Q031

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 正答

- MERGE INTO

### 設問の解説

To meet the requirements of retaining 30 days of historical data while preventing duplicates during nightly loads, the data engineer should use the MERGE INTO command.

The MERGE INTO statement (often referred to as an "upsert") allows you to join a source data set with a target table and perform multiple actions based on whether a match is found.

Deduplication: You can define a unique key (e.g., transaction_id). If the ID already exists in the target table, you can choose to update the record or do nothing; if it doesn't exist, you insert it.

Retention: Since MERGE only modifies or adds specific rows, the rest of your historical data (up to your 30-day limit) remains untouched.

Comparison of Options

リソース

## P4-Q032

### カテゴリ

Section 5: Implementing CI/CD（10%）

### 正答

- In PR pipelines, execute databricks bundle validate -t dev;
On prod, execute databricks bundle deploy -t prod

### 設問の解説

databricks bundle validate -t : This command is used to syntactically and structurally verify that the bundle's YAML configuration (databricks.yml) is correct and valid for the specified environment target without actually deploying any resources to the Databricks workspace. It is the recommended best practice for Continuous Integration (CI) pull request gatekeepers.

databricks bundle deploy -t : This command handles the actual generation, compilation, and deployment of the bundle assets (such as jobs, pipelines, and source files) into the designated target workspace environment. This fits the requirement for an automated production deployment upon a branch merge.

Why the others are incorrect:

Commands structured as databricks bundle run validate or databricks bundle run deploy are invalid syntax; databricks bundle run is explicitly used to execute an already deployed resource (like a specific workflow job or pipeline).

The --verify flag is not a valid parameter for the databricks bundle deploy command.

リソース

## P4-Q033

### カテゴリ

Section 5: Implementing CI/CD（10%）

### 正答

- SELECT *
FROM products
WHERE product_id = :pid;

### 設問の解説

In Databricks SQL, named parameter markers are defined using a leading colon (:) followed by the parameter name (e.g., :parameter_name). The mandatory preceding colon explicitly tells the parser to differentiate the parameter namespace from column names and other SQL variables.

Therefore, to use the parameter named pid, the correct syntax is :pid.

Why the other options are incorrect:

B (product_id = pid): Without a prefix, Databricks SQL evaluates pid as a column identifier rather than a dynamic query parameter.

C (product_id = $pid): The $ prefix is invalid for Databricks SQL named parameter markers.

D (product_id = ${var.pid}): This syntax mimics variable substitution in Declarative Automation Bundles (DABs) rather than native SQL parameterization.

リソース

## P4-Q034

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 正答

- .option("cloudFiles.allowOverwrites", "true")

### 設問の解説

By default, Databricks Auto Loader uses a standard cloudFiles.allowOverwrites = false configuration. Under this default behavior, each file path is strictly processed exactly once. If a file is updated, appended to, or re-uploaded under the exact same path and filename, Auto Loader will normally ignore it.

Setting cloudFiles.allowOverwrites to "true" instructs Auto Loader to look at both the file path and the file's last-modified timestamp. When a file is overwritten or re-uploaded with data corrections, Auto Loader detects the updated timestamp and re-ingests the entire file into the stream.

リソース

## P4-Q035

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 正答

- DESCRIBE DATABASE db_hr

### 設問の解説

The DESCRIBE DATABASE or DESCRIBE SCHEMA returns the metadata of an existing schema (database). The metadata information includes the database’s name, comment, and location on the filesystem. If the optional EXTENDED option is specified, database properties are also returned.

Syntax:

DESCRIBE DATABASE [ EXTENDED ] database_name

Study materials from our exam preparation course on Udemy:

Hands-on

リソース

## P4-Q036

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 正答

- Use Auto Loader with file notification mode to enable event-based file detection for current and future files.

### 設問の解説

Databricks Auto Loader (using the cloudFiles format) is explicitly designed to handle exactly this scenario: seamlessly transitioning from loading thousands/millions of existing historical files to streaming newly arrived files in near real-time, all while providing exactly-once processing guarantees.

Here is why this strategy fulfills all the requirements:

Process Archived Files Exactly Once: When you start an Auto Loader stream with file notification mode, Auto Loader automatically performs an initial backfill by listing the directory to discover all existing (archived) files. It records their metadata in a scalable internal key-value store (checkpoint), ensuring every file is processed exactly once, even if the stream fails and restarts.

Near Real-Time Auto-Detection: By choosing file notification mode, Auto Loader sets up a cloud notification service (such as AWS SNS/SQS, Azure Event Grid, or Google Cloud Pub/Sub) that automatically listens to cloud storage file events. As soon as a new JSON metadata file is uploaded, the stream processes it immediately.

Minimize Storage API Calls & Overhead: This is the core advantage of file notification mode over directory listing mode. As a storage bucket grows to contain thousands or millions of files, performing full directory scans (LIST operations) becomes incredibly slow and expensive. File notification mode allows Auto Loader to discover new files completely by listening to event queues, drastically minimizing metadata listing overhead and cloud storage API costs.

Why the other options are incorrect:

Directory listing mode: While it works, it requires continuous, resource-heavy listing scans over the directory to detect changes, which violates the requirement to minimize storage API calls and metadata listing overhead.

COPY INTO initially, then Auto Loader: This introduces unnecessary operational complexity. Auto Loader handles both existing files and incoming files automatically in a single unified architecture without needing a secondary tool.

CTAS statement initially, then Auto Loader: Similar to COPY INTO, using a manual batch step like Create Table As Select (CTAS) creates overhead. It forces you to manually manage the cut-off point between the historical batch and the real-time stream, risking missing files or duplicating data.

リソース

## P4-Q037

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 正答

- Removes rows only when all columns in the row are null

### 設問の解説

By default, df.na.drop() (alias for df.dropna() ) uses the argument how='any', which drops a row if even a single column has a missing value. When you explicitly pass how='all', you are altering that behavior to instruct Spark to only drop a row if every single column in that row evaluates to null (or NaN). If a row has even one valid, non-null value, it will be kept.

Why the other options are incorrect:

Removes rows where any column contains a null value This describes the default behavior of df.na.drop() when no parameters are specified, or when configured as df.na.drop(how='any').

Removes rows where all columns are non-null This is incorrect because it describes the exact opposite of what the function is intended to do. This logic would eliminate perfectly complete rows of valid data while keeping rows full of missing values.

Replaces all null values with empty strings This statement is incorrect because dropping completely removes rows from the dataset. If the data engineer wanted to swap out null values for empty strings, they would use df.na.fill("") or df.na.replace().

Reference

https://docs.databricks.com/aws/en/pyspark/reference/classes/dataframe/dropna

## P4-Q038

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 正答

- FILTER (students, i -> i.total_courses < 3)

### 設問の解説

filter(input_array, lamda_function) is a higher order function that returns an output array from an input array by extracting elements for which the predicate of a lambda function holds.

Example:

Extracting odd numbers from an input array of integers:

SELECT filter(array(1, 2, 3, 4), i -> i % 2 == 1);

output: [1, 3]

Study materials from our exam preparation course on Udemy:

Hands-on

リソース

## P4-Q039

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 正答

- Incremental ingestion using Lakeflow managed connector for Snowflake

### 設問の解説

Databricks Lakeflow Connect provides fully managed, native connectors designed specifically to ingest data from SaaS applications and databases efficiently.

Incremental Ingestion & Efficiency: On its first run, Lakeflow Connect performs a full load of the source table. For all subsequent runs, it leverages built-in incremental tracking (or Change Data Capture where supported) to identify and copy only the records that have changed. This directly prevents data duplication and unnecessary compute costs.

Scheduled Orchestration: It functions natively with Databricks orchestration, allowing you to trigger ingestion pipelines effortlessly on a strict schedule (such as every 6 hours).

Why the other options are incorrect:

Full refresh of the Snowflake table every 6 hours: This approach completely violates the requirement to avoid "unnecessary processing." Overwriting or replacing the entire dataset every 6 hours requires substantial, repetitive computational resources as the data grows.

Structured Streaming ingestion from Snowflake: This requires writing and maintaining complex integration code compared to a fully managed, declarative connector.

Export Snowflake data to files and append it to the target table every 6 hours: This represents a legacy, manual workaround. Exporting to a cloud staging layer (like AWS S3 or Azure Blob) using Snowflake Tasks/Streams and then reading it via Databricks introduces an extra layer of structural fragility, requires writing custom MERGE or APPEND logic, and creates unnecessary storage overhead.

リソース

## P4-Q040

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 正答

- pathGlobFilter

### 設問の解説

The pathGlobFilter option allows you to filter input files based on a glob pattern, such as *.jpg, when using Auto Loader.

Study materials from our exam preparation course on Udemy:

Lecture

リソース

## P4-Q041

### カテゴリ

Section 5: Implementing CI/CD（10%）

### 正答

- Pull changes from a remote Git repository

### 設問の解説

Git folders supports git Pull operation. It is used to fetch and download content from a remote repository and immediately update the local repo to match that content.

Study materials from our exam preparation course on Udemy:

Hands-on

リソース

## P4-Q042

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 正答

- Increase executor memory
- increase the number of shuffle partitions

### 設問の解説

An ExecutorLostFailure during a wide transformation (which involves a shuffle such as a join of two large tables) is almost always a result of the YARN/Kubernetes NodeManager killing the executor container for exceeding its allocated memory limits (often triggered by an Out Of Memory / OOM error). This indicates an executor memory exhaustion during shuffle.

Here is how the two chosen actions directly address the root causes:

Increase executor memory: Shuffling requires Spark to buffer and aggregate data records in the executor memory before transferring them across the network. If the data volume within a partition is too large, the executor will run out of memory space, causing the host operating system or cluster manager to terminate the executor process. Providing more memory prevents this crash.

Increase the number of shuffle partitions: By default, Spark sets spark.sql.shuffle.partitions to 200. If your dataset is large, dividing it into only 200 chunks results in massive individual partitions (skewed or oversized partitions). Increasing this number breaks the dataset into a higher number of smaller, more manageable chunks. This reduces the memory footprint required by an individual executor to process any single partition at a given time.

Why the other options are incorrect

Increase the driver memory: The driver memory is only responsible for scheduling, maintaining the execution plan, and collecting final results (e.g., via .collect()). The actual reshuffling of data happens exclusively on the executors, so driver memory will not resolve an executor-level crash during a wide transformation.

Increase the number of cores per executor: Increasing cores without increasing memory will actually worsen the problem. More cores mean more concurrent tasks running inside the same executor memory pool, reducing the amount of memory available per task and accelerating OOM failures.

Enable the Photon engine: While Databricks' Photon engine optimizes query execution speed, it does not inherently solve systemic data-volume memory issues or poor partition configurations causing an executor loss.

## P4-Q043

### カテゴリ

Section 7: Governance and Security（15%）

### 正答

- ALTER TABLE employees SET ROW FILTER fr_filter ON (region);

### 設問の解説

The correct command to apply the function as a row filter to the Delta Lake table is:

ALTER TABLE employees SET ROW FILTER fr_filter ON (region);

This command correctly associates the user-defined function fr_filter with the region column of the employees table, ensuring that access to rows is filtered based on the function’s logic. In this setup, when a user queries the table, if they belong to the hr_team account group, they will be able to see all rows; otherwise, only rows where the region column equals 'FR' will be visible.

リソース

## P4-Q044

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 正答

- The stage is running normally without any major issues.

### 設問の解説

To determine if a Spark stage has issues like data skew, resource starvation, or excessive garbage collection (GC), we look at the distribution of metrics across the percentiles (Min, 25th, Median, 75th, Max).

No Data Skew: The Input Size / Records and Shuffle Write Size / Records are beautifully and evenly distributed. For instance, the median records processed per task is 55, and the maximum is 76. If there were severe data skew, you would see a massive gap where the Max value is orders of magnitude higher than the Median (e.g., Median = 55, Max = 1,000,000).

Healthy Garbage Collection (GC) Time: The tasks spend a maximum of 59.0 ms on garbage collection out of a 45 s maximum task duration. As a rule of thumb in Spark performance tuning, GC time is only considered a major issue if it exceeds 10% of the total task duration. Here, it represents less than 0.2% of the execution time.

Even Task Durations: Task durations are tightly clustered between 10 s (Min) and 45 s (Max), with a median of 25 s. This indicates that the workload is well-balanced across the cluster workers.

## P4-Q045

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 正答

- There is no need to add ON VIOLATION clause. By default, records violating the constraint will be kept, and reported as invalid in the event log

### 設問の解説

By default, records that violate the expectation are added to the target dataset along with valid records, but violations will be reported in the event log

* Please note that Delta Live Tables (DLT) has been recently renammed to Lakeflow Declarative Pipeline, however, the current exam version may still refer to it as Delta Live Tables.

Study materials from our exam preparation course on Udemy:

Hands-on

リソース

## P4-Q046

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 正答

- CREATE STREAMING TABLE sales_silver
AS
  SELECT store_id, total + tax AS total_after_tax
  FROM STREAM(sales_bronze)

### 設問の解説

In DLT* pipelines, You can stream data from other tables in the same pipeline by using the STREAM() function**. In this case, you must define a streaming table using the CREATE STREAMING TABLE syntax.

CREATE STREAMING TABLE table_name
AS SELECT *
   FROM STREAM(source_table)

* Please note that Delta Live Tables (DLT) has been recently renammed to Lakeflow Declarative Pipeline, however, the current exam version may still refer to it as Delta Live Tables.

** A recent syntax update now also supports the use of STREAM as a keyword.

CREATE STREAMING TABLE table_name
AS SELECT *
   FROM STREAM source_table;

Study materials from our exam preparation course on Udemy:

Hands-on

リソース

## P4-Q047

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 正答

- Serverless Job Compute

### 設問の解説

Serverless Job Compute offers an ideal balance of efficiency, automation, and performance consistency for scheduled jobs. It eliminates the need for cluster pre-warming by dynamically provisioning resources, thereby reducing costs and operational overhead. It is designed specifically to support batch jobs, including Python scripts, making it the most suitable and modern choice for this scenario.

Databricks recommends using serverless compute for all job tasks. You can also specify different compute types for tasks in a job, which might be required if a task type is not supported by serverless compute for workflows.

Study materials from our exam preparation course on Udemy:

Lecture

リソース

## P4-Q048

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 正答

- They provide business-level aggregations that power analytics, machine learning, and production applications

### 設問の解説

Gold layer is the final layer in the multi-hop architecture, where tables provide business level aggregates often used for reporting and dashboarding, or even for Machine learning.

Study materials from our exam preparation course on Udemy:

Lecture

Hands-on

リソース

## P4-Q049

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 正答

- eventsStream = (spark.readStream
                    .format("kafka")
                    .option("kafka.bootstrap.servers", "host:port")
                    .option("subscribe", "events_topic")
                    .option("startingOffsets", "latest")
                    .load()
                )
eventsStream = spark.readStream.format("kafka").load("host:port", "events_topic", "latest")

### 設問の解説

The correct approach uses PySpark’s readStream with format "kafka", and .option() methods to specify the necessary configurations, such as:

kafka.bootstrap.servers to identify the Kafka cluster

subscribe to define the target Kafka topic, and

startingOffsets to control the consumption starting point. This can be set to "latest" or "earliest" to determine where to begin reading.

リソース

## P4-Q050

### カテゴリ

Section 7: Governance and Security（15%）

### 正答

- Attribute-Based Access Control (ABAC) policies

### 設問の解説

In Databricks Unity Catalog, ABAC extends the governance framework beyond standard user or role boundaries. It allows data administrators to use governed tags (attributes attached to schemas, tables, or columns) to dynamically apply Row Filters and Column Masks. Instead of manually applying rules to every individual asset, a single policy defined at the catalog level evaluates these tags and automatically secures all matching columns or rows—both for existing data assets and any future tables created with those tags.

Why the other options are incorrect:

Dynamic views: While dynamic views can be configured with conditional logic (like is_account_group_member()) to mask columns or filter rows, they require creating and maintaining individual view definitions on a per-case basis. They do not automatically scale catalog-wide across future tables via a tag-based declaration.

Predictive Optimization: This feature automatically manages background maintenance tasks for Delta tables (such as OPTIMIZE and VACUUM commands) to ensure peak query performance. It is not an access control or data masking mechanism.

Liquid Clustering: This is a next-generation data layout and indexing technique designed to replace traditional Hive partitioning and Z-ordering. It accelerates query performance by dynamically clustering data based on specified columns, but it plays no role in data governance or security policies.

リソース

## P4-Q051

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 正答

- Lakeflow Connect managed connector

### 設問の解説

Lakeflow Connect is Databricks' fully managed, low-code data ingestion solution designed specifically to discover, prepare, and replicate data from popular enterprise SaaS applications (like Salesforce, Workday, HubSpot, and ServiceNow) and relational databases directly into Unity Catalog tables. It operates on serverless compute, supports automated schema evolution, utilizes incremental processing / Change Data Capture (CDC), and integrates natively with Unity Catalog for end-to-end lineage and governance.

Why the other options are incorrect:

Auto Loader: While it is an automated tool for incremental data ingestion, it is a code-based solution specifically designed for processing files (such as JSON, CSV, or Parquet) dropped into cloud object storage, rather than directly connecting to enterprise SaaS applications.

COPY INTO: This is a declarative SQL command used to load data from cloud file locations into Delta tables in a batch manner. It requires writing SQL and does not connect natively to enterprise application APIs.

Databricks Connect: This is a client library that allows developers to connect their favorite IDEs (like VS Code or PyCharm) and local development tools to Databricks clusters to run Spark code remotely. It is not an ingestion solution.

リソース

## P4-Q052

### カテゴリ

Section 7: Governance and Security（15%）

### 正答

- It leverages Predictive Optimization to choose optimal clustering keys based on observed query behavior.

### 設問の解説

Automatic Liquid Clustering in Databricks is a feature designed to automatically optimize the physical layout of data in Delta tables based on the access patterns and metadata statistics. It leverages Predictive Optimization, which uses query behavior analytics to select clustering keys dynamically.

Study materials from our exam preparation course on Udemy:

Lecture

リソース

## P4-Q053

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 正答

- Streaming table

### 設問の解説

The most suitable object to implement the inventory_latest table is a Streaming table, because it is designed to continuously capture and update near real-time changes from an append-only source like inventory_raw. Implementing inventory_latest as a Streaming table allows you to merge incoming changes or apply a CDC (Change Data Capture) feed from inventory_raw so that the table always reflects the latest inventory state per product_id. Each new event—whether an update or insertion—can be applied in real time, updating current_quantity and updated_timestamp without rebuilding the entire table, which is the main advantage over a materialized view or temporary view.

Materialized Views (formerly known as Live Tables) provide batch-oriented or scheduled incremental processing for precomputed queries rather than continuously updating individual records in real time. Temporary views, in contrast, are ephemeral and not suited for persistent state tracking.

リソース

## P4-Q054

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 正答

- It’s an expression to represent complex job schedule that can be defined programmatically

### 設問の解説

To define a schedule for a Databricks job*, you can either interactively specify the period and starting time, or write a Cron Syntax expression. The Cron Syntax allows to represent complex job schedule that can be defined programmatically

* Please note that Databricks Jobs has been recently renammed to Lakeflow Jobs, however, the current exam version may still refer to it as Databricks Jobs.

Study materials from our exam preparation course on Udemy:

Hands-on

## P4-Q055

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 正答

- Table update trigger

### 設問の解説

In Lakeflow Jobs, the Table update trigger is specifically built to monitor source tables and automatically trigger downstream jobs as soon as new data changes—such as updates, merges, or deletes—occur.

This behavior allows the team to eliminate scheduled guesswork or continuous cluster costs.

Why the other options are incorrect:

File arrival trigger: This triggers a job when raw files are uploaded to a cloud storage path or Unity Catalog volume, rather than responding to internal database updates within a Delta table.

Continuous trigger: This keeps a job permanently running by instantly launching a new run as soon as the previous one finishes or fails, which is inefficient for non-streaming, event-driven report refreshes.

Scheduled trigger: This relies on a fixed time interval (such as a cron schedule) and does not react dynamically to actual data updates.

リソース

