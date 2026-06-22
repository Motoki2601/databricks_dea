# Translation Rules

## 目的

Databricks DEA模擬問題を日本語で出題・採点できるようにする。

## 翻訳方針

- 意訳しない。
- 原文の情報を削らない。
- 原文にない補足を本文に追加しない。
- Databricks製品名、機能名、SQL、PySparkコード、CLIコマンド、設定キーは原則として英語のまま保持する。
- `must`、`should`、`can`などの助動詞の強さを保つ。
- 正答の選択肢は、questions側の選択肢と同じ日本語表現にする。
- 複数正答問題では、正答を複数行で保持する。

## 英語のまま保持する主な用語

- Databricks
- Unity Catalog
- Delta Lake
- Auto Loader
- Lakeflow Jobs
- Lakeflow Connect
- Declarative Automation Bundles
- Databricks Asset Bundles
- Git Folders
- SQL warehouse
- serverless
- classic compute
- job compute
- all-purpose compute
- Spark UI
- Structured Streaming
- PySpark
- DataFrame
- UDF
- VACUUM
- OPTIMIZE
- Liquid Clustering
- Predictive Optimization

## ID形式

- `P1-Q001`: 第1回 問題1
- `P2-Q001`: 第2回 問題1
- `P3-Q001`: 第3回 問題1
- `P4-Q001`: 第4回 問題1

## Claudeに翻訳させる場合の指示

```md
このMarkdownファイルを日本語化してください。

制約:
- 意訳しない。
- 原文の情報を削らない。
- 原文にない補足を追加しない。
- 見出し、問題ID、カテゴリ、Markdown構造を維持する。
- Databricks製品名、SQL、PySparkコード、CLIコマンド、設定キーは翻訳しない。
- 正答欄は選択肢欄と同じ訳語にそろえる。
- 出力はMarkdownのみ。
```
