# Databricks DEA Study Materials

Databricks Certified Data Engineer Associate（DEA）対策用のClaude学習パックです。

## 使うフォルダ

- `Databricks_DEA_Study/00_instructions`: Claude Project用プロンプト、カテゴリ表、翻訳ルール
- `Databricks_DEA_Study/01_questions_ja`: 出題用ファイル
- `Databricks_DEA_Study/02_answers_ja`: 採点・分析用ファイル
- `Databricks_DEA_Study/03_official_guide`: 公式試験ガイド
- `Databricks_DEA_Study/06_question_index`: 横断出題・弱点ドリル用インデックス

## Claude Project構成

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

## 注意

`01_questions_ja` と `02_answers_ja` はClaudeが扱いやすいID体系へ変換済みです。
本文は原文を保持し、Claude Projectの指示で出題時・採点時に日本語へ直訳させる運用です。
