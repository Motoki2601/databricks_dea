# Databricks Certified Data Engineer Associate（DEA）公式試験範囲

## ドキュメント情報

| 項目 | 内容 |
|------|------|
| 参照元 | Databricks 公式試験ガイドPDF（databricks.com） |
| 参照URL | https://www.databricks.com/sites/default/files/2026-05/databricks-certified-data-engineer-associate-exam-guide-may-2026-000.pdf |
| 試験ガイドバージョン | **2026年5月4日時点の現行試験（May 2026版）** |
| 参照日 | 2026年6月22日 |
| 補足ページ | https://www.databricks.com/learn/certification/data-engineer-associate |

> ⚠️ **注意：試験前に必ず最新版を確認すること**
> 試験ガイドは試験内容の変更に合わせて随時更新されます。受験2週間前に上記URLから最新版を確認してください。

> 📌 **July 2025版からの主な変更点（May 2026版）**
> - セクション数：5 → **7** に増加
> - **配点（%）が初めて公式に明示された**
> - セクション構成が大幅に再編成（CI/CDとトラブルシューティングが独立したセクションに）
> - 推奨トレーニングコースが変更・追加
> - 「Delta Live Tables（DLT）」→「**Lakeflow Spark Declarative Pipeline**」に改名
> - 「Databricks Repos」→「**Databricks Git Folders**」に改名
> - 「Databricks Asset Bundles」→「**Declarative Automation Bundles**」に改名
> - **Lakeflow Connect** / **COPY INTO** / **ABAC ポリシー** が新規追加

---

## 1. 試験概要

| 項目 | 内容 |
|------|------|
| 正式名称 | Databricks Certified Data Engineer Associate |
| 問題数 | 45問（採点対象）※採点なしの試験的問題が含まれる場合あり |
| 試験時間 | 90分 |
| 受験料 | USD 200（現地の税法に基づく税金が別途加算） |
| 受験方法 | オンライン監督（在宅）またはテストセンター |
| 持ち込み | 不可（一切禁止） |
| 前提条件 | なし（ただし関連コース受講と6ヶ月以上の実務経験を強く推奨） |
| 有効期間 | 2年間 |
| 再認定 | 2年ごとに現行試験を受験して再取得が必要 |
| 使用言語（コード） | 可能な限りSQLを使用。それ以外はPython |

---

## 2. 試験の目的（対象スキル）

Databricks Data Intelligence Platform を使用して、基礎的なデータエンジニアリングタスクを完了できる能力を評価する。具体的には以下を含む：

- Data Intelligence Platform のワークスペース・アーキテクチャ・機能の理解
- PySpark を使用したETLタスクの実行、Lakeflow Jobs の操作、CI/CD の実践
- トラブルシューティング・モニタリング・最適化技術の理解
- Databricks プラットフォームにおけるガバナンスとセキュリティの実現

---

## 3. 推奨トレーニング（May 2026版）

### 講師付きコース
- **Data Engineering with Databricks**（インストラクター主導）

### 自己学習コース（Databricks Academy）
- Data Ingestion with Lakeflow Connect
- Deploy Workloads with Lakeflow Jobs
- **DevOps Essentials for Data Engineering** ← 新規追加（旧「Data Management and Governance with Unity Catalog」は廃止）
- **Data Interoperability with Unity Catalog** ← 新規追加
- Build Data Pipelines with Lakeflow Spark Declarative Pipeline
- **Get Started with Data Governance on Databricks** ← 新規追加

---

## 4. 試験出題範囲（セクション別・配点付き）

### Section 1: Databricks Intelligence Platform（6%）

- Databricks Data Intelligence Platform のアーキテクチャ・Delta Lake・Unity Catalog などのコアコンポーネントの理解
- Databricks Data Intelligence Platform のコンピュートサービス（特性・制限・コストモデル）の理解と、ワークロードユースケースに応じた最適なオプションの選択

---

### Section 2: Data Ingestion and Loading（21%）

- バッチ・ストリーミング・増分ロードを含むデータ取り込みパターンの有効化と詳細説明。ローカルファイル・Lakeflow Connect 標準コネクタ・Lakeflow Connect マネージドコネクタなどのソースからのデータインポート
- **COPY INTO** コマンドを使用してクラウドオブジェクトストレージ（ADLS / S3 / GCS）から Unity Catalog 管理テーブルへの増分ロード
- **Auto Loader** のスキーマ強制・スキーマエボリューションのバッチモード（ディレクトリリスティングまたはファイル通知）を使用した Unity Catalog 管理テーブルへのデータランディング
- **Lakeflow Connect** の設定による多様なエンタープライズソースから Unity Catalog 管理テーブルへの信頼性の高いデータ取り込み
- ノートブック内の **JDBC / ODBC または REST クライアント** を使用してクラウドストレージまたは Unity Catalog 管理テーブルへの直接データランディング（通常は Lakeflow Jobs でオーケストレーション・スケジュール）
- データ量・取り込み頻度・データ型・Unity Catalog によるガバナンスニーズなどの技術要件に基づく、**Auto Loader / Lakeflow Connect（標準およびマネージドコネクタ）/ パートナーコネクタ / その他の取り込み方法**の優先順位付け
- Lakeflow Connect およびその他のマネージドコネクタを介した、半構造化データおよび非構造化データ（JSON・ネストデータなど）の Unity Catalog 管理 Delta テーブルへの取り込み

---

### Section 3: Data Transformation and Modeling（22%）

- PySpark / SQL を使用してブロンズテーブルを読み込み、null のクレンジング・データ型の標準化を行い、新しいシルバーテーブルへ書き込む**データクレンジング**の実装
- Inner join・Left join・Broadcast join・複数キー・Cross join・Union・Union all などの操作による **DataFrame の結合**
- 列名の追加・削除・分割・リネーム、フィルタの適用、配列の展開（explode）などによる**列・行・テーブル構造の操作**
- count・approximate count distinct・mean・summary などの **DataFrame に対するデータ重複排除操作と集計操作**
- 基本的なチューニングパラメータ（`spark.sql.shuffle.partitions`・`spark.default.parallelism`・`spark.executor/driver.memory`・`spark.sql.autoBroadcastJoinThreshold`）の理解とパフォーマンスの再測定
- Unity Catalog における BI・分析チーム向けの**ゴールドレイヤーオブジェクト**（マテリアライズドビュー・ビュー・ストリーミングテーブル・テーブル）の違いの理解と構築方法
- 信頼性の高いシルバー・ゴールドデータセットを確保するための**データ品質チェックとバリデーションルール**の適用

---

### Section 4: Working with Lakeflow Jobs（16%）

- **Lakeflow Jobs** を使用したパイプラインオーケストレーションにおける制御フロー（リトライ・分岐・ループなどの条件付きタスク）の実装
- Lakeflow Jobs と DAG ベースのタスクグラフを使用した**一般的なタスク**（ノートブック・SQL クエリ・ダッシュボード・パイプラインタスク）とその依存関係の設定
- トリガータイプ（スケジュール・ファイル到着・テーブル更新）の理解に基づく **Lakeflow Jobs のジョブスケジュール**の実装
- データ可用性とパイプライン依存関係に基づく**時間ベースとデータドリブンのトリガー**の選択

---

### Section 5: Implementing CI/CD（10%）

- ブランチの作成・切り替え・コミット・プッシュ・プルリクエストの作成など、**Databricks Git Folders**（旧 Databricks Repos）を使用した Databricks ワークスペース UI 内のコード開発ワークフローの管理
- **Automation Bundle**（旧 Databricks Asset Bundles）の変数とオーバーライドを使用した環境固有設定の理解と、dev・test・prod 環境への同一コードベースのプロモーション
- **Declarative Automation Bundles**（旧 Databricks Asset Bundles）を使用して Lakeflow Jobs・Lakeflow Spark Declarative Pipelines・その他のワークスペースアセットを dev・test・prod 環境間でパッケージ・設定・プロモーションするデプロイ
- 自動化された CI/CD ワークフローにおける Declarative Automation Bundles とその他のワークスペースアセットの検証・デプロイ・管理のための **Databricks CLI** の理解

---

### Section 6: Troubleshooting, Monitoring, and Optimization（10%）

- **Lakeflow Jobs の実行履歴ビュー**を使用した現在の実行時間と過去のベースラインの比較によるジョブパフォーマンスのトレンド特定
- ジョブステータスの解釈・DAG ベースのタスクグラフによる上流ブロッカーの発見・パイプライン実行時間と失敗率の追跡による **Lakeflow Jobs UI を使用したパイプラインヘルスの監視**
- **Spark UI** のステージレベルメトリクスの解釈によるデータスキュー・シャッフル・ディクスピリングなどの一般的なパフォーマンスボトルネックの特定
- **Liquid Clustering** と **Predictive Optimization** の機能の理解
- クラスター起動失敗・ライブラリ競合・メモリ不足問題の診断

---

### Section 7: Governance and Security（15%）

- Unity Catalog における**マネージドテーブルと外部テーブル**の違いの区別、およびそれらに対する基本操作（作成・変更・削除・マネージドと外部の変換）の実行
- **GRANT・REVOKE・DENY 権限**を UI と SQL を使用して、セキュリティ階層の適切なレベルでプリンシパル（ユーザー・グループ・サービスプリンシパル）に適用するアクセス制御の設定
- ユーザーグループに基づいてデータの可視性を制限するための**列レベルマスキングと行レベルセキュリティ**の理解
- 機密データに対する行レベルフィルタリングと列マスキングを一元的に制御する **Unity Catalog ABAC ポリシー**の理解

---

## 5. セクション別配点まとめ

| セクション | タイトル | 配点 |
|-----------|---------|------|
| Section 1 | Databricks Intelligence Platform | **6%** |
| Section 2 | Data Ingestion and Loading | **21%** |
| Section 3 | Data Transformation and Modeling | **22%** |
| Section 4 | Working with Lakeflow Jobs | **16%** |
| Section 5 | Implementing CI/CD | **10%** |
| Section 6 | Troubleshooting, Monitoring, and Optimization | **10%** |
| Section 7 | Governance and Security | **15%** |
| **合計** | | **100%** |

> **重点学習ポイント：**
> Section 2（21%）+ Section 3（22%）= 43% が取り込みと変換で最大比重。
> Section 4（16%）+ Section 5（10%）= 26% がジョブとCI/CDで新しい重点領域。

---

## 6. 公式サンプル問題と解答（May 2026版）

以下は公式試験ガイドに掲載されているサンプル問題（旧バージョンの試験から引退した問題）です。

---

### Q1：Spark UI によるパフォーマンスボトルネックの特定

**対応セクション：** Section 6 - Troubleshooting, Monitoring, and Optimization

**問題：**
バッチジョブの処理時間が新しいデータソース追加後に2倍になった。Spark UI では最長ステージのほとんどのタスクが30秒以内に完了するが、1タスクだけ10分以上かかっている。タスクサマリーでは Min/Median のシャッフルリードが約400MBに対し、Max シャッフルリードが5GBを超えている。

ジョブのランタイムを短縮する解決策はどれか？

- A. クラスターサイズを拡大してエクゼキューターを追加し、遅いタスクを早く完了させる
- B. スキュージョイン処理を含む Adaptive Query Execution（AQE）が有効になっているか確認し、実行時に過大なパーティションを自動分割させる
- C. `spark.sql.shuffle.partitions` を減らして、より少ないタスクに作業を集約する
- D. ジョイン前にソルトキーを使用してデータセットを手動で再パーティションし、スキューしたキーを均等に分散させる

**正解：B**

**解説：**
- タスクの処理時間の大きな偏り（1タスクだけ10分、他は30秒以内）とシャッフルリードの Max/Median 格差はデータスキューの典型的な症状
- AQE（Adaptive Query Execution）のスキュージョイン処理は、実行時に過大パーティションを自動検出・分割するため、最も適切な解決策
- A はリソース追加であり根本原因（スキュー）を解決しない
- C はパーティション数を減らすため逆効果（スキューが悪化する可能性）
- D は有効な手動対処だが、自動対処（B）より工数がかかり、AQE が利用可能な状況では不要

---

### Q2：コンピュートサービスの選択

**対応セクション：** Section 1 - Databricks Intelligence Platform

**問題：**
パイプラインの迅速なイテレーション・誤取り込み後の信頼性の高いロールバック・法規制コンプライアンスのための監査証跡・AI と BI 両ワークロードへの一貫した単一の情報源のアクセスを必要とするデータエンジニアに適した戦略はどれか？

- A. DBFS の CSV ストレージに手動ファイルバージョニングと夜間コピーによるロールバック
- B. Unity Catalog によるガバナンスと一貫したアクセス・リネージのために Delta Lake の ACID トランザクションとタイムトラベルを使用する
- C. クラウドオブジェクトストレージのみを使用し、復旧とガバナンスにはアドホック SQL クエリを使用する
- D. 監査証跡と BI 配信のためにエフェメラルなインメモリ DataFrames を使用する

**正解：B**

**解説：**
- Delta Lake のACIDトランザクション → 信頼性の高いロールバック
- タイムトラベル → 誤取り込み後のデータ復元
- Unity Catalog のリネージ → 監査証跡・コンプライアンス
- Unity Catalog による管理 → AI・BI の一貫したアクセス

---

### Q3：データ取り込みパターンの理解

**対応セクション：** Section 2 - Data Ingestion and Loading

**問題：**
データエンジニアが顧客所有の S3 バケットから Databricks 監査ログを消費するダウンストリームパイプラインを構築している。スキーマ推論とチェックポイントを実装する前に、配信フォーマット・典型的な取り込みレイテンシ・ファイルが上書きされる可能性を理解したい。

Databricks 監査ログのストレージ動作はどれか？

- A. ファイルは JSON 形式で配信される。配信開始から通常15分以内のイベントログレイテンシで、新しい配信が既存ファイルを上書きする場合がある
- B. ファイルは CSV 形式でサブミニット遅延保証で配信され、不変性を保持するために一度書き込まれたファイルへの上書きは発生しない
- C. ファイルは Parquet 形式で24時間を超える最終整合性で配信され、ストリーミング取り込みを簡素化するために上書きは無効化されている
- D. ファイルは JSON 形式で週次バッチで配信され、上書きにより以前のコンテンツが完全に置換される

**正解：A**

**解説：**
- Databricks 監査ログは JSON 形式
- 配信は通常15分以内（リアルタイムではなくニアリアルタイム）
- 上書きの可能性があるため、ダウンストリームパイプラインで考慮が必要

---

### Q4：クラスター設定の選択

**対応セクション：** Section 6 - Troubleshooting, Monitoring, and Optimization

**問題：**
複数のビジネスアナリストが日中にキュレーション済みの Delta テーブルでアドホック SQL クエリを実行する。効率的なクエリパフォーマンス・高速なクラスター起動・複数の同時ユーザーのサポートを確保しながら、過大なクラスターへの不要なスケーリングを避けてコストを管理する必要がある。

要件を満たすクラスター設定はどれか？

- A. スケジュールされた ETL ワークフロー用に設計されたオートスケーリング付きジョブクラスター
- B. 固定ワーカーノード数で構成されたオールパーパスクラスター
- C. オートスケーリングが有効なハイコンカレンシークラスター
- D. 軽量開発タスク用に設定されたシングルノードクラスター

**正解：C**

**解説：**
- 複数の同時ユーザー → ハイコンカレンシー（高並列）が必要
- コスト管理 → オートスケーリングによる需要に応じたスケーリング
- アドホッククエリ → 常時稼働するオールパーパスクラスターが適切（ジョブクラスターは都度起動）

---

### Q5：CI/CD の実装

**対応セクション：** Section 5 - Implementing CI/CD

**問題：**
チームが Databricks において ETL パイプラインをモジュール式にデプロイ・バージョン管理・オーケストレーションし、CI/CD と再現性を実現したい。

この要件をサポートする機能はどれか？

- A. Unity Catalog のモデルを使用して ETL ジョブを表現し、各モデルがパイプラインコードアーティファクトを格納して、CI/CD がジョブタスクに紐づくモデルエイリアスを更新することでバージョンをプロモートする
- B. Unity Catalog Volumes に格納された wheel ライブラリとして変換ロジックをパッケージ化し、環境全体で決定論的なデプロイを保証するためにジョブタスクにバインドする
- C. Volume マウントされたノートブック内に API ロジックをパッケージ化し、Jobs API v2 を使用してノートブックをトリガーし、バージョニングシステムとしてノートブックの改定履歴に依存する
- D. **DABs**（Declarative Automation Bundles）を使用してリソースとコードアセットを定義し、Git でバージョン管理して、自動化された CI/CD アクションで環境間のデプロイをプロモートする

**正解：D**

**解説：**
- DABs（Declarative Automation Bundles）が Databricks における CI/CD の標準的なアプローチ
- Git によるバージョン管理 + CI/CD アクション = モジュール式・再現性・デプロイ自動化の要件を全て満たす
- A は Unity Catalog のモデルの誤用（MLflow モデル用途）
- B は有効だが DABs を使わないため CI/CD の完全な自動化が困難

---

## 7. 重要な用語と概念（試験頻出・May 2026版）

### Databricks プラットフォーム
- **Data Intelligence Platform**：データ・分析・AIを統合した単一プラットフォーム
- **Delta Lake**：ACIDトランザクション対応のオープンソースストレージレイヤー（Parquetファイル + トランザクションログ）
- **Unity Catalog（UC）**：3層の名前空間（カタログ・スキーマ・テーブル）によるガバナンス
- **コントロールプレーン / データプレーン**：アーキテクチャの2層構造

### コンピュートサービス
- **オールパーパスクラスター**：インタラクティブ開発・アドホック分析向け。常時稼働
- **ジョブクラスター**：ジョブ実行専用の一時クラスター。完了後に自動終了
- **ハイコンカレンシークラスター**：複数同時ユーザーのSQL分析向け
- **サーバーレスコンピュート**：Databricksが自動管理・最適化するコンピュート（起動が速い）

### データ取り込み
- **Auto Loader**：クラウドストレージからの増分ファイル取り込み機能
  - スキーマ強制（Schema Enforcement）：スキーマ変更時の挙動制御
  - スキーマエボリューション（Schema Evolution）：スキーマ変更への自動対応
  - バッチモード：ディレクトリリスティング / ファイル通知
- **Lakeflow Connect**：多様なエンタープライズソースへの接続コネクタ群（標準コネクタ・マネージドコネクタ）
- **COPY INTO**：クラウドオブジェクトストレージからの増分ロードコマンド
- **JDBC / ODBC / REST**：外部データソースへのノートブックからのデータ取り込み手段

### データ変換・処理
- **Medallion Architecture**：Bronze（生データ）→ Silver（クレンジング済み）→ Gold（ビジネス集計）
- **Lakeflow Spark Declarative Pipeline**（旧 Delta Live Tables / DLT）：宣言的パイプライン定義
- **PySpark DataFrame API**：groupBy / agg / join / filter / select / withColumn / explode 等
- **マテリアライズドビュー**：クエリ結果をキャッシュして定期的に更新されるビュー
- **ストリーミングテーブル**：ストリーミングデータを増分に追記するテーブル
- **Broadcast join**：小さいテーブルを全エクゼキューターにブロードキャストして高速化
- **Approximate count distinct**：大規模データの近似ユニークカウント（HyperLogLog）
- **データスキュー**：特定のパーティションにデータが偏る現象

### パイプライン本番化・CI/CD
- **Lakeflow Jobs**：ジョブのスケジューリング・オーケストレーション機能
  - トリガータイプ：スケジュール・ファイル到着・テーブル更新
  - 制御フロー：リトライ・分岐（IF/ELSE）・ループ
- **Declarative Automation Bundles（DABs）**（旧 Databricks Asset Bundles）：ワークフロー等のCI/CDデプロイ管理ツール
- **Databricks Git Folders**（旧 Databricks Repos）：ワークスペース内の Git 統合機能
- **Databricks CLI**：DABs の検証・デプロイ・管理のためのコマンドラインツール

### パフォーマンス最適化
- **Spark UI**：ステージ・タスクレベルのパフォーマンス分析ツール
  - データスキュー・シャッフル・ディスクスピリングの検出
- **AQE（Adaptive Query Execution）**：実行時の動的最適化（スキュージョイン処理含む）
- **Liquid Clustering**：Z-Ordering の後継。データレイアウトの自動最適化
- **Predictive Optimization**：OPTIMIZE / VACUUM の自動実行

### ガバナンス
- **マネージドテーブル**：Unity Catalog が管理するストレージ（テーブル削除でデータも削除）
- **外部テーブル**：ユーザー管理のストレージを参照（テーブル削除でデータは残る）
- **GRANT / REVOKE / DENY**：Unity Catalog の権限制御コマンド
- **列レベルマスキング**：ユーザーグループに応じた列データの動的マスキング
- **行レベルセキュリティ（RLS）**：ユーザーグループに応じた行データのフィルタリング
- **ABAC（Attribute-Based Access Control）ポリシー**：属性ベースのアクセス制御による行フィルタリングと列マスキングの一元管理
- **Delta Sharing**：Databricks 間または外部システムへのデータ共有機能
- **Lakehouse Federation**：外部データソースへのクエリフェデレーション機能
