# Answers 第1回

- Source: `C:\Users\motok\Desktop\Databricks DEA\Exam Guide\split_questions\answers_第1回.md`
- Count: 55
- ID format: P1-Q001

## P1-Q001

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 正答

- Classic job compute

### 設問の解説

Classic compute resources (such as classic job clusters) are deployed directly within your company's own cloud account virtual network (VNet on Azure, VPC on AWS/GCP), a setup known as VNet injection. Because the compute instances live entirely inside your cloud network, they can seamlessly leverage established corporate routing infrastructure—such as a Site-to-Site VPN, AWS DirectConnect, or Azure ExpressRoute—to securely and reliably access the on-premises corporate data center where the PostgreSQL database resides.

Why the other options are incorrect:

Serverless job compute & Serverless SQL warehouse:
Serverless compute architecture runs entirely inside a Databricks-managed cloud account (the serverless compute plane) rather than inside the customer's virtual network. Consequently, it does not natively support direct network-level integration (like VPNs or direct routes) to physical on-premises environments. While Databricks serverless supports Network Connectivity Configurations (NCCs) for cloud-native storage and services, it cannot naturally bridge the gap to a local, on-premises data center without complex proxy setups or data-staging workarounds.

All-purpose classic compute:
While an all-purpose classic cluster can technically establish a connection to an on-premises database via VNet injection, it is structurally designed for interactive, ad-hoc, and collaborative analysis (e.g., data scientists sharing a notebook). Utilizing an all-purpose cluster to handle an automated daily production job violates Databricks best practices, as it drastically increases costs due to idle cluster times and higher pricing tiers compared to dedicated job compute.

リソース

## P1-Q002

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 正答

- Task B runs only if Task A succeeds, and Task C runs regardless of Task A's outcome.

### 設問の解説

The correct configuration behaves as follows:

run_if: ALL_SUCCESS (Default): The downstream task will execute only if all of its upstream dependencies finish successfully. Since Task B depends on Task A, Task B runs only if Task A succeeds.

run_if: ALL_DONE: The downstream task will execute as soon as all upstream dependencies complete, regardless of whether they succeeded, failed, or were skipped. Since Task C depends on Task A, Task C runs regardless of Task A's outcome.

リソース

## P1-Q003

### カテゴリ

Section 5: Implementing CI/CD（10%）

### 正答

- Commit and push changes to the remote feature branch, then use the GitHub Ul or GitHub CLI to create a pull request (PR).

### 設問の解説

Databricks Git folders allow you to perform local Git operations such as creating branches, staging files, committing, pushing, pulling, and rebasing directly inside your workspace.

However, the Databricks UI does not natively support creating pull requests (PRs) or managing code reviews. To safely merge a feature branch into a protected branch like main, the standard collaborative Git workflow dictates that you push your commits from Databricks to the remote repository (e.g., GitHub, GitLab, Bitbucket). Once the changes are available on the remote, you must use your Git provider's interface (such as the GitHub UI or GitHub CLI) to open, review, and ultimately merge the PR.

## P1-Q004

### カテゴリ

Section 6: Troubleshooting, Monitoring, and Optimization（10%）

### 正答

- 7 days

### 設問の解説

By default, the retention threshold of the VACUUM command is 7 days. This means that VACUUM operation will prevent you from deleting files less than 7 days old, just to ensure that no long-running operations are still referencing any of the files to be deleted.

Study materials from our exam preparation course on Udemy:

Lecture

Hands-on

リソース

## P1-Q005

### カテゴリ

Section 7: Governance and Security（15%）

### 正答

- ALTER TABLE infra_catalog.ops_db.device_logs SET MANAGED;

### 設問の解説

The correct command is:

ALTER TABLE infra_catalog.ops_db.device_logs SET MANAGED;

This command converts an existing external Unity Catalog table into a managed table while preserving:

The table history (allowing for continuous time travel), and

The same table configurations, including table name, Unity Catalog permissions, tags, properties, and associated views. So, it avoids the manual overhead of rebuilding the table metadata.

After conversion, Databricks fully manages the table lifecycle, including automatic deletion of underlying data files when the table is dropped.

The other options are incorrect because they are invalid Databricks SQL syntax.

リソース

## P1-Q006

### カテゴリ

Section 7: Governance and Security（15%）

### 正答

- CREATE FUNCTION patient_mask(diagnosis STRING)
  RETURN CASE WHEN is_account_group_member('doctors') THEN diagnosis ELSE 'CONFIDENTIAL' END;
CREATE FUNCTION patient_mask(diagnosis STRING)
  RETURN CASE WHEN is_account_group_member('doctors') THEN 'CONFIDENTIAL' ELSE diagnosis END;

### 設問の解説

The correct answer is:

CREATE FUNCTION patient_mask(diagnosis STRING)
RETURN CASE WHEN is_account_group_member('doctors') THEN diagnosis ELSE 'CONFIDENTIAL' END;

This function properly implements role-based access control by verifying if the current user belongs to the "doctors" group using the is_account_group_member('doctors') function. If the user is a doctor, the function reveals the actual diagnosis value; otherwise, it replaces the diagnosis with the string "CONFIDENTIAL" to protect sensitive patient information.

This approach ensures compliance with healthcare data privacy requirements while allowing authorized medical staff to access the necessary information.

リソース

## P1-Q007

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 正答

- Software as a Service (SaaS) connectors
- Database connectors

### 設問の解説

In Databricks Lakeflow Connect, ingestion approaches are broken down into categories where Managed Connectors (No-Code) specifically refer to:

SaaS connectors: Fully managed ingestion pipelines for enterprise applications like Salesforce, HubSpot, Jira, and Workday.

Database connectors: Fully managed ingestion using change data capture (CDC) or query-based setups for relational databases like SQL Server, MySQL, and PostgreSQL.

In contrast, Auto Loader is classified as a Standard Connector (code-based cloud object storage connector) because it requires writing structured streaming code and does not offer a fully out-of-the-box managed pipeline. COPY INTO and CREATE TABLE AS (CTAS) are SQL commands used for traditional file ingestion and transformations rather than no-code managed ingestion connectors.

リソース

## P1-Q008

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 正答

- CREATE FUNCTION plus_one(value INTEGER)

RETURNS INTEGER

RETURN value +1;

### 設問の解説

The correct syntax to create a UDF is:

CREATE [OR REPLACE] FUNCTION function_name ( [ parameter_name data_type [, ...] ] )
RETURNS data_type
RETURN { expression | query }

Study materials from our exam preparation course on Udemy:

Hands-on

リソース

## P1-Q009

### カテゴリ

Section 5: Implementing CI/CD（10%）

### 正答

- Store the source code in Git folders, and deploy jobs using Databricks Asset Bundles (DAB)

### 設問の解説

Databricks Asset Bundles allow teams to define jobs and workflows declaratively in a YAML file, promoting consistency, version control, and automation. These configurations can be stored and tracked in GitHub, making deployments reproducible and reliable. Other methods rely on manual processes or ad hoc tooling and lack the benefits of structured DevOps practices.

Study materials from our exam preparation course on Udemy:

Hands-on

リソース

## P1-Q010

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 正答

- Data skew

### 設問の解説

In Apache Spark, data skew occurs when data is unevenly distributed across partitions. When a shuffle operation happens (like a join or groupBy), Spark routes rows with the same key to the same partition. If a few keys are vastly more popular than others, those specific partitions become massive.

Because Spark processes tasks in parallel across these partitions, the tasks handling the average-sized partitions finish quickly (under 20 seconds). However, the tasks handling the oversized, skewed partitions choke on the massive volume of data, resulting in a few "straggler" tasks that take an exponentially longer time to complete (25+ minutes).

Why the other options are incorrect:

Small file problem: This typically causes the opposite symptom—thousands of tiny tasks that finish in milliseconds, but create massive overhead due to excessive disk I/O and Spark UI metadata management.

Executor memory leak: An executor memory leak would generally result in an OutOfMemoryError (OOM) or cause tasks to crash and restart repeatedly across multiple stages, rather than causing a clean but extremely slow completion of just a few tasks.

Network timeout: A network timeout would cause tasks to fail completely after a certain threshold (e.g., spark.network.timeout), leading to task retries or stage failures, rather than just running slowly for 25 minutes.

リソース

## P1-Q011

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 正答

- NULL

### 設問の解説

In Databricks SQL, the TRY_CAST function attempts to cast an expression to a specified data type. It behaves exactly like the standard CAST function, with one critical difference: instead of throwing a runtime error when a conversion fails due to incompatible data or formatting issues, it safely returns NULL.

Because the string '100$' contains a non-numeric symbol ($), it cannot be parsed directly as an integer. A standard CAST('100$' AS INT) would throw an error, but TRY_CAST catches this data quality issue and outputs NULL.

リソース

## P1-Q012

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 正答

- Classic compute virtual machines

### 設問の解説

When the customer sets up a classic compute, the cluster virtual machines are deployed in the data plane in the customer's cloud account.

Study materials from our exam preparation course on Udemy:

Lecture

リソース

## P1-Q013

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 正答

- Auto loader monitors a source location, in which files accumulate, to identify and ingest only new arriving files with each command run. While the files that have already been ingested in previous runs are skipped.

### 設問の解説

Auto Loader incrementally and efficiently processes new data files as they arrive in cloud storage.

Study materials from our exam preparation course on Udemy:

Lecture

Hands-on

リソース

## P1-Q014

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 正答

- Input data size

### 設問の解説

An OutOfMemoryError (OOM): Java heap space error coupled with Executor Lost messages typically signifies that the cluster's memory capacity was overwhelmed during processing. In Apache Spark (the engine powering Databricks), this most commonly happens due to data-related memory pressures, such as:

Data Skew: A large volume of input data being routed to a single partition or node, causing that specific executor to run out of memory.

Massive Volume: High volumes of input data being loaded into memory all at once (e.g., via operations like .collect() or massive joins) without adequate memory available on the initial instance size.

When you scale up to a larger instance type, you increase both the available RAM (Java heap space) and the computational headroom per node. This allows the system to successfully cache, shuffle, and process the large input data volume without crashing the executors.

Why the other options are less likely:

Incorrect file format / Schema mismatch: These configuration issues generally trigger compilation errors, analysis exceptions, or explicit parsing failures right at the start of read operations (e.g., AnalysisException). They do not inherently cause executors to exhaust their Java heap space and crash.

Misconfigured library: While a library conflict can cause startup failures, it typically manifests as a ClassNotFoundException, NoSuchMethodError, or a direct initialization crash, rather than an OOM error caused by resource exhaustion during data execution.

リソース

## P1-Q015

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

## P1-Q016

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 正答

- df.dropDuplicates(["user_id", "product_id"])

df.dropDuplicates(["user_id", "product_id",”timestamp”])

df.dropDuplicates()

df.dropDuplicates(["timestamp"])

### 設問の解説

The goal is to ensure uniqueness at the product-view level per user, meaning a single user should only have one recorded view for a specific product.

In PySpark, the dropDuplicates() (or its alias distinct()) method removes duplicate rows from a DataFrame. When you pass a list of column names to dropDuplicates([cols]), PySpark considers rows to be duplicates if they have identical values only in those specified columns. It then keeps the first occurrence it encounters and drops the rest.

Why the other options are incorrect:

df.dropDuplicates(["user_id", "product_id", "timestamp"]): This would only drop a row if a user viewed the exact same product at the exact same millisecond. It fails to ensure uniqueness if they viewed it at different times.

df.dropDuplicates(["timestamp"]): This would dangerously drop all other user actions that happened to occur at the same timestamp across the entire platform.

df.dropDuplicates(): With no arguments, this drops rows only if every single column (including the unique timestamp) is identical.

リソース

## P1-Q017

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 正答

- The query is performing raw data ingestion into a Bronze table

### 設問の解説

The query here is using Autoloader (cloudFiles) to load raw json data from ordersLocation into the Bronze table uncleanedOrders.

Study materials from our exam preparation course on Udemy:

Lecture

Hands-on

リソース

## P1-Q018

### カテゴリ

Section 7: Governance and Security（15%）

### 正答

- Unity Catalog Data Lineage

### 設問の解説

The description accurately defines the Data Lineage feature within Unity Catalog. This functionality is designed to provide transparency into data flows, allowing users to trace how datasets are created, modified, and consumed throughout the Databricks workspace. It is an essential tool for data governance, auditing, and ensuring the reliability of analytics workflows.

Study materials from our exam preparation course on Udemy:

Hands-on

リソース

## P1-Q019

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 正答

- Delta Lake builds upon standard data formats: Parquet + XML

### 設問の解説

It is not true that Delta Lake builds upon XML format. It builds upon Parquet and JSON formats

Study materials from our exam preparation course on Udemy:

Lecture

Hands-on

## P1-Q020

### カテゴリ

Section 5: Implementing CI/CD（10%）

### 正答

- databricks bundle init

### 設問の解説

The databricks bundle init command initializes a new Databricks Asset Bundle (DAB) project in your local directory. When you run it, the CLI prompts you interactively to choose a project template (such as a default Python project) and walks you through configuring the initial settings.

The other options are incorrect because these commands do not exist in the Databricks CLI syntax.

リソース

## P1-Q021

### カテゴリ

Section 7: Governance and Security（15%）

### 正答

- REVOKE ALL PRIVILEGES ON SCHEMA main.hr_schema FROM hr_group;

### 設問の解説

To ensure a principal (user or group) does not retain any existing privileges before assigning a new, restricted set of permissions, you need to strip away whatever explicit permissions they currently hold.

REVOKE ALL PRIVILEGES removes all explicitly granted capabilities (such as SELECT, MODIFY, CREATE, etc.) on the target object for that specific group.

Executing a REVOKE statement in Unity Catalog is safe and will succeed even if the group didn't have certain privileges to begin with. It functions as a clean slate ensuring that those explicit privileges are completely absent.

Why other options are incorrect:

SHOW GRANTS...: These commands are diagnostic and only display existing permissions. They do not remove or alter any privileges.

DENY ALL PRIVILEGES...: The DENY command only exists in Databricks for legacy purposes to support the old Hive Metastore (hive_metastore) table access control lists (ACLs). Anyway, a DENY statement creates an explicit restriction that supersedes any current or future privileges (even inherited ones). Using DENY would prevent the team from successfully assigning the "new, restricted set of permissions" afterwards, as the DENY would block them.

リソース

## P1-Q022

### カテゴリ

Section 5: Implementing CI/CD（10%）

### 正答

- targets:
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

### 設問の解説

In Declarative Automation Bundles (formerly Databricks Asset Bundles), target environments are configured under the top-level targets mapping key. Each specific target environment (e.g., dev, prod) allows you to override deployment settings.

To define the host URL and the root storage path within that target, you must nest a workspace mapping block containing the host and root_path attributes.

Other choices given in the prompt fail because hosts:, workspaces:, and environments: are not valid top-level syntax keys for defining target environments in a Databricks bundle schema.

リソース

## P1-Q023

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 正答

- SELECT a.order_id, b.order_id
FROM orders_a a
INNER JOIN orders_b b
ON a.order_id <=> b.order_id;
SELECT a.order_id, b.order_id
FROM orders_a a
INNER JOIN orders_b b
ON a.order_id = b.order_id
AND (a.order_id IS NULL
OR b.order_id IS NULL);

### 設問の解説

In Databricks SQL (and Apache Spark SQL), the standard equality operator (=) evaluates to NULL if either or both sides of the comparison are NULL. Because NULL represents an unknown value, standard joins will filter those records out.

To handle comparisons where NULL values should be treated as equal to other NULL values, Databricks SQL provides the null-safe equal operator, which is written as <=>.

a.order_id <=> b.order_id: Returns true if both values are equal, or if both values are NULL. It returns false if one value is NULL and the other is not.

This operator mimics the standard SQL IS NOT DISTINCT FROM.

Why the other options are incorrect:

a.order_id = b.order_id: Standard = will cause NULL = NULL to evaluate to NULL instead of true, missing the matching null rows.

a.order_id <> b.order_id <>: is the "not equal to" operator, which does the exact opposite of what is required.

a.order_id = b.order_id AND (a.order_id IS NULL OR b.order_id IS NULL): This logic uses OR with IS NULL, but it will mistakenly attempt to match a valid ID from one table to a NULL in the other table, or fail to correctly evaluate the join condition as true for two nulls.

リソース

## P1-Q024

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 正答

- Interactive compute

### 設問の解説

Interactive compute resources are specifically designed for analyzing data collaboratively using interactive notebooks. They allow data engineers and data scientists to manually start the compute, write code cell-by-cell, run it immediately, and see the results in real time. Features like the Python Notebook Interactive Debugger, breakpoint insertion, and variable inspection are uniquely built into this environment, making it the ideal choice for rapid development and troubleshooting.

Incorrect Options

Serverless SQL warehouse:
These are highly optimized compute resources specifically built to execute SQL queries, power BI dashboards, and run analytics workloads. They are not intended for broad data engineering notebook tasks (such as writing complex Python, Scala, or PySpark ETL pipelines) or general code debugging.

Serverless Job compute:
Job compute (automated compute) is designed for running automated, production-level scheduled tasks and pipelines via Databricks Workflows. When a job runs, Databricks creates the compute resource, runs the task, and terminates it immediately. Because it does not support active, live iteration or cell-by-cell execution with an attached debugger, it is poorly suited for the active development phase.

Instance pools:

An instance pool is a set of idle, ready-to-use virtual machine instances that reduce cluster start and auto-scaling times. While they can be used to back interactive clusters, an instance pool itself is an infrastructure configuration layer—not a type of compute workload meant for running and debugging a notebook.

## P1-Q025

### カテゴリ

Section 7: Governance and Security（15%）

### 正答

- It enhances query performance by collecting statistics as data is written to the table.
- It simplifies maintenance by automatically running maintenance operations on the table.

### 設問の解説

Predictive Optimization in Databricks Unity Catalog automatically optimizes managed tables in Unity Catalog by:

Running background maintenance tasks like VACUUM, OPTIMIZE, and ANALYZE to reduce fragmentation and improve performance.

Collecting table statistics during writes, which helps the query optimizer make better decisions and improve query speed.

リソース

## P1-Q026

### カテゴリ

Section 4: Working with Lakeflow Jobs（16%）

### 正答

- Define processing_region as a job-level parameter and reference it in each task using the dynamic value {{job.parameters.processing_region}}

### 設問の解説

Databricks Lakeflow Jobs allow you to define parameters at the Job level.

Centralized Configuration: Defining processing_region at the job level means you set it exactly once.

Dynamic Parameter Passing: By using the task parameter syntax {{job.parameters.processing_region}} inside each notebook task's parameter settings, the workflow engine automatically injects that value into every task when the job runs.

Runtime Overrides: This parameter is exposed directly in the Databricks Jobs UI. When triggering a manual run ("Run now with different parameters"), an operator can change the value on the fly without ever touching or modifying the underlying notebook code.

Why other options are incorrect:

Cluster environment variables (spark.conf.get): While this avoids hard-coding in the notebook, changing a cluster-level variable typically requires editing the cluster configuration or restarting the cluster. It cannot be cleanly overridden on a per-run basis directly from the Jobs UI run interface.

Using dbutils.notebook.run: Lakeflow Jobs are designed to orchestrate tasks at the UI/workflow level. Trying to manually chain notebooks via dbutils inside a task defeats the purpose of using a multi-task Lakeflow Job, complicates data lineage, and makes visual tracking harder.

Hard-coding: This breaks the requirement to change the value from the Jobs UI and introduces massive maintenance overhead if the region ever changes.

リソース

## P1-Q027

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 正答

- COPY_OPTIONS('force' = 'true')

### 設問の解説

By default, COPY INTO is an idempotent operation; it automatically keeps track of which files have already been ingested to avoid data duplication.

If a pipeline needs to force a complete re-processing of all data files (including those previously tracked as ingested), setting 'force' = 'true' disables this built-in safety filter and guarantees every file in the source location is re-read.

リソース

## P1-Q028

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 正答

- Use an if/else conditional task to route execution based on the processing_mode parameter.

### 設問の解説

Databricks Lakeflow Jobs explicitly provide an If/else condition task type designed to introduce boolean branching logic into your Directed Acyclic Graph (DAG) workflows.

By setting up an If/else task, you can evaluate runtime parameters (such as processing_mode) directly at the orchestration level. Based on whether the condition evaluates to true or false, Lakeflow will dynamically route the execution down the appropriate downstream path (streaming or batch), leaving the irrelevant branch untouched and saving computational resources.

リソース

## P1-Q029

### カテゴリ

Section 7: Governance and Security（15%）

### 正答

- The table is external

### 設問の解説

External (unmanaged) tables are tables whose data is stored in an external storage path by using a LOCATION clause.

When you run DROP TABLE on an external table, only the table's metadata is deleted, while the underlying data files are kept.

Study materials from our exam preparation course on Udemy:

Lecture

Hands-on

リソース

## P1-Q030

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 正答

- joined_df = products_df.join(reviews_df, "product_id", "left")

### 設問の解説

In PySpark data manipulation, a left join (left or left_outer) keeps all rows from the left DataFrame (products_df) regardless of whether there is a match in the right DataFrame (reviews_df).

The Left DataFrame (products_df): Represents the primary entity. Every single record is preserved.

The Right DataFrame (reviews_df): If a matching product_id is found, the review details are appended to that row. If no match exists, the missing columns are automatically populated with null.

Why the other options are incorrect:

inner: Only retains rows where there is a match in both DataFrames (this would mistakenly drop products that haven't received reviews yet).

full / full_outer: Retains all rows from both DataFrames, which would introduce extra rows for reviews that don't map to a valid product.

cross: Computes the Cartesian product of both DataFrames, pairing every single product with every single review, which is computationally expensive and logically incorrect for this use case.

リソース

## P1-Q031

### カテゴリ

Section 6: Troubleshooting, Monitoring, and Optimization（10%）

### 正答

- OPTIMIZE

### 設問の解説

Delta Lake can improve the speed of read queries from a table. One way to improve this speed is by compacting small files into larger ones. You trigger compaction by running the OPTIMIZE command

Study materials from our exam preparation course on Udemy:

Lecture

Hands-on

リソース

## P1-Q032

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 正答

- File arrival trigger

### 設問の解説

In Databricks Lakeflow Jobs, a File Arrival trigger is designed to monitor a specified cloud storage path. This can be a Unity Catalog volume or an external location such as Amazon S3, Azure Storage, or Google Cloud Storage. The trigger starts a job run when new files arrive in the monitored location. This feature is useful when scheduled jobs become inefficient due to irregular data arrival patterns.

Why other options are incorrect:

Continuous trigger: Keeps a job running indefinitely by launching a new run immediately after the previous one finishes or fails. It is optimized for continuous stream processing rather than reacting dynamically to newly dropped batch files.

Scheduled trigger: Runs jobs at specific, fixed intervals (e.g., every hour or daily at 12:00 AM). Because the logs arrive at completely unpredictable times, a scheduled trigger would cause latency or waste compute resources processing empty paths.

Table update trigger: Listens for changes/commits made to existing Delta or Unity Catalog tables, rather than checking a raw cloud storage landing zone for new unparsed JSON log files.

リソース

## P1-Q033

### カテゴリ

Section 7: Governance and Security（15%）

### 正答

- GRANT ALL PRIVILEGES ON TABLE employees TO hr_team

### 設問の解説

ALL PRIVILEGES is used to grant full permissions on an object to a user or group of users. The syntax for the GRANT command is as follows:

GRANT <privilege> ON TABLE <table_name> TO <principal>;

Study materials from our exam preparation course on Udemy:

Lecture

Hands-on

リソース

## P1-Q034

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 正答

- Select a Unity Catalog connection that stores the application credentials, then configure the destination catalog and schema, and set the schedule and notifications.

### 設問の解説

Databricks Lakeflow Connect provides a fully managed, no-code/low-code experience for incrementally ingesting data from SaaS applications (like Salesforce, GitHub, ServiceNow, Confluence, etc.) directly into tables governed by Unity Catalog.

Setting up a SaaS connector follows a standard wizard-driven workflow that abstracts away manual engineering tasks:

Connection Setup: You select or create a Unity Catalog connection object that safely securely manages and stores the credentials/tokens required to authenticate with the source SaaS application's API.

Pipeline Configuration & Target Selection: You name the ingestion pipeline and pick the target destination (the parent catalog and schema managed within Unity Catalog) where the streaming Delta tables will land.

Schedules & Notifications: You set up the orchestrating Lakeflow Job frequency (the execution schedule) to ingest new/changed records incrementally via built-in API change-tracking mechanics, and you configure email alerts for pipeline outcomes.

Why the other options are incorrect:

Manual extraction of CSV or JSON files into a volume followed by writing custom COPY INTO or Auto Loader code represents the traditional, code-heavy approach. Lakeflow Connect is explicitly designed to handle connection management, API pagination, and incremental Change Data Capture (CDC) without needing these manual interim stages or explicit file-parsing code.

Lakehouse Federation (which uses "foreign catalogs" to query external databases in real-time) is separate from Lakeflow Connect's managed SaaS pipelines, which pull data downstream incrementally into storage rather than just federating live query access.

リソース

## P1-Q035

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 正答

- Use Auto Loader with cloudFiles.useNotifications = true to enable event-based file detection

### 設問の解説

cloudFiles.useNotifications = true is an option in Databricks Auto Loader that switches the ingestion mechanism from directory listing to an event-driven notification system.

What it means in practice

Instead of repeatedly scanning an ADLS folder to detect new files, Auto Loader uses Azure Event Grid notifications to learn when new files arrive.

So the flow becomes:

A new file lands in Azure Data Lake Storage (ADLS)

ADLS emits an event via Event Grid

Databricks Auto Loader receives the event

Only that file is picked up for processing

Why it exists

Without notifications, Auto Loader uses:

Directory listing mode → periodically scans folders to find new files

That works, but at very large scale (like 100,000 files/day), listing becomes:

slower

more expensive (API calls)

less efficient

Benefits of useNotifications = true

Faster ingestion latency (near real-time detection)

Lower storage/listing costs (fewer ADLS list operations)

Better scalability for very high file volumes

Still supports incremental processing + checkpointing

Works well with schema inference and evolution

Maintains Unity Catalog lineage when writing to governed tables

When it works best

It’s ideal when:

You have very high file arrival rates

Your storage supports Event Grid integration (like ADLS Gen2)

You want minimal overhead and near real-time ingestion

Simple mental model

Without notifications → “Databricks keeps checking the folder”

With notifications → “Storage tells Databricks when something new arrives”

リソース

## P1-Q036

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 正答

- joined_df = colors_df.crossJoin(sizes_df)

### 設問の解説

To generate every possible combination of two DataFrames (also known as a Cartesian product), you need a cross join. crossJoin() explicitly combines every row of the first DataFrame with every row of the second DataFrame. If you have 10 colors and 5 sizes, it will correctly output all 50 unique color-size combinations.

Why the other options are incorrect:

The other three options use an inner, left, or full join based on a matching column ("color_id"). This would only pair rows where a color ID matches a size ID, which does not create a complete product matrix and conceptually makes little sense since colors and sizes don't share identical IDs.

リソース

## P1-Q037

### カテゴリ

Section 6: Troubleshooting, Monitoring, and Optimization（10%）

### 正答

- Broadcast the skewed keys to all worker nodes to avoid shuffle during the join.

### 設問の解説

Broadcasting is typically used to share small lookup datasets with all executors to avoid joins that cause shuffles. However, broadcasting skewed keys, especially if the associated data is large, does not solve the skew problem and may actually increase memory pressure on each executor.

Other options are appropriate solutions:

A. Use salting by appending a random prefix to skewed user_id values to distribute the load across partitions.
Salting is an effective technique to mitigate skew by artificially spreading out hot keys across multiple partitions. This approach reduces bottlenecks caused by skewed keys during shuffles.

B. Repartition the clickstream dataset to increase the number of partitions before the join.
Increasing the number of partitions via repartition() helps balance the data load and enhances parallelism. It can help mitigate skew by distributing keys more evenly.

D. Separate processing of skewed keys by handling high-frequency users in a dedicated job.

Isolating skewed keys for specialized processing prevents them from affecting the entire join operation. This targeted approach can improve performance by tailoring resources to problematic keys.

## P1-Q038

### カテゴリ

Section 5: Implementing CI/CD（10%）

### 正答

- databricks bundle deploy --target prod --auto-approve

### 設問の解説

The bundle deploy command accepts the --auto-approve flag to handle automated, non-interactive environments by skipping interactive approvals that might be required for deployment.

When executing deployments inside automated CI/CD tools (like GitHub Actions, GitLab CI/CD, or Azure DevOps), there is no terminal interface for a human to type "yes" or confirm the execution. Appending the --auto-approve flag tells the Databricks CLI to skip any interactive prompt confirmations and directly execute the resource updates.

Why other options are incorrect:

--force: This flag exists but is specifically used to force-override Git branch validation (e.g., if you are deploying a production target from a non-main branch). It does not bypass resource approval prompts.

--confirm and --non-interactive: These are invalid flags for this command.

リソース

## P1-Q039

### カテゴリ

Section 5: Implementing CI/CD（10%）

### 正答

- A YAML file named databricks.yml that defines the bundle's structure, including targets, resources, and configurations.

### 設問の解説

Databricks Asset Bundles use a structured YAML configuration file named databricks.yml as the primary entry point. This file defines key aspects of the bundle, such as:

Targets: Represent different environments (e.g., dev, staging, prod).

Resources: Define objects like jobs, notebooks, pipelines, and clusters.

Configurations: Include settings such as workspace paths, environment variables, and parameter values.

The format is designed to be declarative and human-readable, facilitating clear version control and automation within CI/CD workflows. Unlike JSON or TOML, YAML is preferred for its readability and native support for nested structures, making it ideal for complex infrastructure and deployment definitions.

bundle:
    name: my_bundle
 
targets:
    dev:
        default: true
 
    prod:
        workspace:
            host: https://<production-workspace-url>
 
resources:
    jobs:
        my-job

Study materials from our exam preparation course on Udemy:

Hands-on

リソース

## P1-Q040

### カテゴリ

Section 6: Troubleshooting, Monitoring, and Optimization（10%）

### 正答

- AQE automatically converts the join to a broadcast join at runtime based on actual data statistics

### 設問の解説

Before Adaptive Query Execution (AQE) was introduced, Spark relied on static framework statistics estimated before the query started running. If those estimates were missing or inaccurate, Spark would often default to a heavy, expensive Sort-Merge Join (which requires shuffling data across the network).

With AQE enabled, Spark dynamically optimizes the query plan at runtime using actual, accurate data sizes gathered from completed map stages. In this scenario:

Post-Shuffle Size Detection: Spark looks at the actual size of the small dimension table after initial filtering or processing stages.

Dynamic Join Conversion: If the actual size of that table falls below the broadcast threshold (spark.sql.adaptive.autoBroadcastJoinThreshold), AQE automatically converts the join from a Shuffle Sort-Merge Join to a Broadcast Hash Join.

Performance Boost: This eliminates the highly expensive data shuffle phase for the large fact table, providing a massive performance boost without requiring manual hints (like /*+ BROADCAST(dimension) */) in the code.

Why the other options are incorrect:

"AQE rewrites the query into Python code for faster execution": This is incorrect. Spark executes on the JVM. Writing it to Python would actually introduce significant PySpark serialization overhead and slow things down.

"AQE disables shuffling entirely for all joins": This is incorrect. AQE minimizes and optimizes shuffles, but large-to-large joins still require shuffling.

"AQE forces all joins to use sort-merge join regardless of data size": This is incorrect. It does the exact opposite—it attempts to transition away from sort-merge joins to broadcast joins whenever local data sizes allow for it.

リソース

## P1-Q041

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 正答

- They provide a more refined view of raw data, where it’s filtered, cleaned, and enriched.

### 設問の解説

Silver tables provide a more refined view of the raw data. For example, data can be cleaned and filtered at this level. And we can also join fields from various bronze tables to enrich our silver records.

Study materials from our exam preparation course on Udemy:

Lecture

Hands-on

リソース

## P1-Q042

### カテゴリ

Section 5: Implementing CI/CD（10%）

### 正答

- finance_schema

### 設問の解説

Deployment-Time Interpretation: Bundle variables (${var.schema_name}) are deployment-time concepts in Declarative Automation Bundles (DABs). When you execute databricks bundle deploy -t dev --var="schema_name=finance_schema", the CLI completely evaluates all the custom variables and substitutes them directly into the deployed job definition configuration in the workspace.
Therefore, the deployed job definition is explicitly written with:

base_parameters:
    schema_name: finance_schema

Run-Time Evaluation: When you later execute databricks bundle run, it tells Databricks to trigger the already-deployed job configuration. The --var flag is explicitly a deployment-time modifier for variable evaluation; it cannot dynamically manipulate standard bundle variable references at runtime during a bundle run.
Because the schema_name parameter was already hardcoded as finance_schema in the workspace upon deployment, that is the value passed to the notebook.

リソース

## P1-Q043

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 正答

- groupBy

### 設問の解説

groupBy("customer_id") groups the data by customer, allowing aggregate functions such as max(), min(), sum(), avg(), and count() to be applied within each group. This is the appropriate approach for computing customer-level statistics.

## P1-Q044

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 正答

- Materialized view

### 設問の解説

The most suitable object for this use case is a materialized view because it allows the data analyst to precompute and store business-level aggregations, such as total revenue, average order value, and units sold per category, so that downstream reports and dashboards can access the results quickly without recalculating them every time, unlike a temporary or standard view, which either exist only for the session or require repeated recomputation, and unlike a streaming table, which is designed for processing raw, real-time event streams rather than pre-aggregated summaries.

リソース

## P1-Q045

### カテゴリ

Section 6: Troubleshooting, Monitoring, and Optimization（10%）

### 正答

- To incrementally optimize data layout for improved query performance

### 設問の解説

Liquid Clustering in Databricks is a feature designed to progressively optimize the physical layout of data within Delta tables by organizing it according to specified clustering keys, typically columns that are frequently queried. This ensures that data is stored in a way that enhances the performance of queries by reducing the amount of data read during execution.

Study materials from our exam preparation course on Udemy:

Lecture

リソース

## P1-Q046

### カテゴリ

Section 7: Governance and Security（15%）

### 正答

- The analyst_group does not have the USE SCHEMA privilege on fraud_schema
- The analyst_group does not have the USE CATALOG privilege on bank_catalog

### 設問の解説

In Databricks Unity Catalog, privileges operate on a strict hierarchy: Catalog -> Schema -> Object.

To successfully query an object, a principal (user, group, or SP) must not only possess the object-level privilege (SELECT on the table), but they must also have explicit traversal privileges on every parent container in that object's path.

USE CATALOG: Required to traverse and interact with any objects contained within that specific catalog. Without it, the user cannot "see" into bank_catalog.

USE SCHEMA: Required to traverse and interact with any objects contained within that specific schema. Without it, the user cannot see beyond the catalog into fraud_schema.

Because the data engineer only executed the table-level grant, the analysts will receive an INSUFFICIENT_PERMISSIONS error until the parent traversal grants are provided.

リソース

## P1-Q047

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 正答

- discount is added automatically as a nullable column, with values populated only for new records.

### 設問の解説

Here is exactly what happens under the hood when Auto Loader encounters that new field with addNewColumns:

Schema Evolution: When Auto Loader detects the discount column in a new file, it automatically updates the schema of your destination table to include it.

No Backfilling: Auto Loader does not rewrite existing historical data in order to update new column values.

Null Handling: Because historical rows don't contain this column, querying older records will simply return null for discount.

The other options are incorrect because Auto Loader will never automatically rewrite historical files to inject defaults, delete existing data, or trigger an expensive MERGE operation during a standard append stream.

## P1-Q048

### カテゴリ

Section 6: Troubleshooting, Monitoring, and Optimization（10%）

### 正答

- VACUUM

### 設問の解説

Running the VACUUM command on a Delta table deletes the unused data files older than a specified data retention period. As a result, you lose the ability to time travel back to any version older than that retention threshold.

Study materials from our exam preparation course on Udemy:

Lecture

Hands-on

## P1-Q049

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 正答

- The stream fails and will not restart unless the schema is manually updated or the problematic data file is removed.

### 設問の解説

With the failOnNewColumns mode, the stream detects any new columns and fails immediately to enforce strict schema consistency. It will not automatically restart until the schema has been manually updated to include the new columns or the data files causing the schema mismatch are removed. This prevents silent schema drift and ensures deliberate schema management.

Study materials from our exam preparation course on Udemy:

Lecture

リソース

## P1-Q050

### カテゴリ

Section 2: Data Ingestion and Loading（21%）

### 正答

- trigger(processingTime=”30 seconds")

### 設問の解説

In Spark Structured Streaming, in order to process data in micro-batches at the user-specified intervals, you can use processingTime keyword. It allows to specify a time duration as a string.

Study materials from our exam preparation course on Udemy:

Lecture

Hands-on

## P1-Q051

### カテゴリ

Section 7: Governance and Security（15%）

### 正答

- Apply Unity Catalog ABAC policies centrally across all relevant tables

### 設問の解説

Unity Catalog supports Attribute-Based Access Control (ABAC) policies, which allow you to define row filters and column masks based on tags (like confidential_info) rather than hardcoding rules for every single table.

By applying a central tag-based policy, the rule automatically propagates and enforces access controls across all existing and future tables where that tag is present. This drastically reduces administrative overhead and ensures consistent governance.

Why other options are incorrect:

Create dynamic views manually for every table...: While dynamic views can enforce masking rules, creating them manually across "many tables" defeats the goal of scalability and efficiency. It doesn't scale well and becomes difficult to audit.

Write custom code logic to manage table masking rules dynamically: This introduces significant maintenance overhead, is prone to errors, and duplicates functionality that is already natively built into the governance layer.

Partition tables by confidential columns at table creation...: Partitioning is a performance optimization tool, not a robust security boundary. Managing security at the partition level for "every column tagged confidential_info" across many tables would quickly become an administrative nightmare and break table design.

リソース

## P1-Q052

### カテゴリ

Section 7: Governance and Security（15%）

### 正答

- It gives the ability to add, update, or delete data within the table

### 設問の解説

The MODIFY privilege grants a user the ability to add, update, or delete data from an object. It is typically assigned to users who need to make changes to existing records or insert new information into the object.

Study materials from our exam preparation course on Udemy:

Lecture

Hands-on

## P1-Q053

### カテゴリ

Section 6: Troubleshooting, Monitoring, and Optimization（10%）

### 正答

- Minimizes the total running time of the warehouse

### 設問の解説

The Auto Stop feature stops the warehouse if it’s idle for a specified number of minutes.

Study materials from our exam preparation course on Udemy:

Hands-on

リソース

## P1-Q054

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 正答

- import pyspark.sql.functions as F
 
resultDf = df.withColumn("month", F.split(F.col("date_str"), "-").getItem(1) )
import pyspark.sql.functions as F
 
resultDf = df.withColumn("month", F.split(F.col("date_str"), "-").getItem(2) )
import pyspark.sql.functions as F
 
resultDf = df.withColumn("month", F.split(F.col("date_str"), "-0").getItem(2) )
import pyspark.sql.functions as F
 
resultDf = df.withColumn("month", F.split(F.col("date_str"), "-0").getItem(1) )

### 設問の解説

In PySpark, pyspark.sql.functions.split divides a string column into an array of substrings based on a specified delimiter pattern.

Splitting the String: When you split "2026-01" using the delimiter "-", it breaks the string into an array containing two elements: ["2026", "01"].

Accessing Array Elements: PySpark arrays use 0-based indexing.

getItem(0) returns the year ("2026").

getItem(1) returns the month ("01").

Using "-0" as a delimiter would fail for months like October ("2026-10"), November, or December because the character following the hyphen is a "1", not a "0".

リソース

## P1-Q055

### カテゴリ

Section 3: Data Transformation and Modeling（22%）

### 正答

- A DataFrame containing statistical metrics, including count, mean, standard deviation, min, max, and approximate quartile values for each column.

### 設問の解説

The df.summary() command is used for exploratory data analysis. It computes specified statistics for all numerical and string columns in a DataFrame.

When you run df.summary() without any specific arguments, it automatically calculates the following metrics for each applicable column:

count (number of non-null values)

mean

stddev (standard deviation)

min

25% (approximate 1st quartile)

50% (median / approximate 2nd quartile)

75% (approximate 3rd quartile)

max

The output itself is returned as a standard Spark DataFrame, which you can then view using display(df.summary()) in a Databricks notebook.

リソース

