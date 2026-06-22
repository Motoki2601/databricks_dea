# Weakpoint Drill Map

採点後に弱点タグを横断出題へ変換するための方針です。

## Unity Catalog権限階層

優先タグ:
- Unity Catalog
- Column Mask / Row Filter
- Managed vs External Table

出題方針:
1. `USE CATALOG` / `USE SCHEMA` / `SELECT` / `MODIFY` の権限問題
2. 列マスク、行フィルター、ABAC
3. managed table と external table のライフサイクル

## データ取り込み

優先タグ:
- Auto Loader
- Lakeflow Connect
- COPY INTO
- Structured Streaming

出題方針:
1. Auto Loaderのスキーマ推論とスキーマ進化
2. Lakeflow Connectのmanaged connector
3. COPY INTOとファイル取り込み
4. Structured Streamingのtriggerとcheckpoint

## Lakeflow Jobs

優先タグ:
- Lakeflow Jobs

出題方針:
1. task依存関係と`run_if`
2. ジョブ通知、失敗時の再実行、repair run
3. スケジュール、ファイル到着、テーブル更新トリガー

## CI/CD

優先タグ:
- DAB / Asset Bundles
- Git Folders / PR

出題方針:
1. Git Foldersでのcommit / push / PR
2. Databricks Asset Bundles / Declarative Automation Bundles
3. bundle変数、target、deploy、run

## 変換・モデリング

優先タグ:
- PySpark DataFrame
- SQL / UDF
- Medallion Architecture

出題方針:
1. DataFrame変換、集計、重複排除
2. SQL関数、UDF、TRY_CAST
3. Bronze / Silver / Goldの役割

## 性能・トラブルシュート

優先タグ:
- Performance Tuning
- Liquid Clustering / Predictive Optimization
- Delta Lake

出題方針:
1. Spark UIによるdata skew、shuffle、OOMの診断
2. AQE、broadcast join、partitionの理解
3. OPTIMIZE、VACUUM、Liquid Clustering、Predictive Optimization

## コンピュート選択

優先タグ:
- Compute Selection
- On-prem Connectivity

出題方針:
1. serverlessとclassic computeの違い
2. job computeとall-purpose computeの使い分け
3. on-prem接続要件とネットワーク配置
