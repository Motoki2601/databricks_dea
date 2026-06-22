# Databricks DEA Study Pack

このフォルダ構成は、Claudeで模擬試験を運用するためのものです。

## 推奨Claude Project

### スマホ向けオールインワンProject

スマホで出題、即時採点、弱点分析まで完結したい場合は、この構成を使います。

アップロードするファイル:

- `00_instructions/claude_examiner_prompt.md`
- `00_instructions/claude_grader_prompt.md`
- `00_instructions/claude_mobile_all_in_one_prompt.md`
- `00_instructions/category_map.md`
- `06_question_index/question_index.md`
- `06_question_index/weakpoint_drill_map.md`
- `03_official_guide/databricks_dea_exam_guide.md`
- `01_questions_ja/questions_第1回.md`
- `01_questions_ja/questions_第2回.md`
- `01_questions_ja/questions_第3回.md`
- `01_questions_ja/questions_第4回.md`
- `02_answers_ja/answers_第1回.md`
- `02_answers_ja/answers_第2回.md`
- `02_answers_ja/answers_第3回.md`
- `02_answers_ja/answers_第4回.md`

Claude Projectのカスタム指示には、`claude_mobile_all_in_one_prompt.md`の内容を入れます。

使い方:

- `即時採点オン`: 回答ごとにその場で採点します。
- `即時採点オフ`: 回答中は採点せず、最後にまとめて採点します。
- `今日の10問`: 全体から10問出します。
- `弱点10問`: 弱点タグから横断出題します。
- `まとめて採点`: 現在の回答ログを採点します。

### 出題用Project

アップロードするファイル:

- `00_instructions/claude_examiner_prompt.md`
- `00_instructions/category_map.md`
- `06_question_index/question_index.md`
- `06_question_index/weakpoint_drill_map.md`
- `03_official_guide/databricks_dea_exam_guide.md`
- `01_questions_ja/questions_第1回.md`
- `01_questions_ja/questions_第2回.md`
- `01_questions_ja/questions_第3回.md`
- `01_questions_ja/questions_第4回.md`

アップロードしないファイル:

- `02_answers_ja/answers_*.md`

### 採点・分析用Project

アップロードするファイル:

- `00_instructions/claude_grader_prompt.md`
- `00_instructions/category_map.md`
- `06_question_index/question_index.md`
- `06_question_index/weakpoint_drill_map.md`
- `03_official_guide/databricks_dea_exam_guide.md`
- `01_questions_ja/questions_*.md`
- `02_answers_ja/answers_*.md`
- 必要に応じて `04_attempt_logs/*.md`

## スマホ向けコマンド例

- `今日の10問`
- `弱点10問`
- `Section 2を5問`
- `未回答から10問`
- `間違えた問題から`
- `P1-Q020から`
- `中断`
- `再開`
- `答え合わせ`
- `即時採点オン`
- `即時採点オフ`
- `まとめて採点`

## ID体系

- `P1-Q001`: 第1回 問題1
- `P2-Q014`: 第2回 問題14
- `P4-Q055`: 第4回 問題55

回答ログでは必ずこのIDを使用します。

## 日本語対応の状態

`01_questions_ja` と `02_answers_ja` は、Claudeが扱いやすいID体系へ変換済みです。
本文は原文を保持し、Claude Projectの指示で出題時・採点時に日本語へ直訳させる運用です。

固定の日本語訳ファイルを作る場合は、`00_instructions/translation_rules.md` に従って、回ごとに翻訳・検査してください。
