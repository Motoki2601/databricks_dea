$ErrorActionPreference = "Stop"

$root = "C:\Users\motok\Desktop\Databricks DEA\Exam Guide\Databricks_DEA_Study"
$questionsRoot = Join-Path $root "01_questions_ja"
$indexRoot = Join-Path $root "06_question_index"

New-Item -ItemType Directory -Force -Path $indexRoot | Out-Null

function Normalize-Text {
    param([string]$Text)
    return (($Text -replace "`r`n", "`n").Trim() -replace "`n{3,}", " ")
}

function Get-Section {
    param([string]$Block, [string]$Name, [string[]]$NextNames)
    $escapedName = [regex]::Escape($Name)
    $nextPattern = ($NextNames | ForEach-Object { [regex]::Escape($_) }) -join "|"
    $pattern = "(?ms)^### $escapedName\s*\r?\n(.*?)(?=^### ($nextPattern)\s*$|\z)"
    $m = [regex]::Match($Block, $pattern)
    if ($m.Success) { return Normalize-Text $m.Groups[1].Value }
    return ""
}

function Get-Tags {
    param([string]$Text)
    $t = $Text.ToLowerInvariant()
    $tags = New-Object System.Collections.Generic.List[string]

    $rules = @(
        @("Auto Loader", "auto loader|cloudfiles"),
        @("Lakeflow Connect", "lakeflow connect|managed ingestion|connector"),
        @("COPY INTO", "copy into"),
        @("Structured Streaming", "readstream|writestream|trigger\(|checkpoint|streaming"),
        @("Unity Catalog", "unity catalog|use catalog|use schema|grant |privilege|permission"),
        @("Column Mask / Row Filter", "mask|row filter|abac|is_account_group_member|confidential"),
        @("Managed vs External Table", "managed table|external table|set managed|drop table"),
        @("Lakeflow Jobs", "lakeflow job|databricks job|\btask\b|\btasks\b|run_if|workflow|repair run"),
        @("DAB / Asset Bundles", "asset bundle|automation bundle|databricks bundle|databricks.yml|bundle deploy|bundle run"),
        @("Git Folders / PR", "git folder|repos|pull request|commit|branch"),
        @("PySpark DataFrame", "pyspark|dataframe|withcolumn|groupby|select|dropduplicates|summary\(|split\("),
        @("SQL / UDF", "create function|udf|try_cast|grant |select |alter table"),
        @("Medallion Architecture", "bronze|silver|gold|medallion"),
        @("Delta Lake", "delta lake|delta table|vacuum|optimize|time travel|zorder"),
        @("Performance Tuning", "spark ui|skew|shuffle|broadcast|aqe|adaptive query|oom|outofmemory|executor lost"),
        @("Liquid Clustering / Predictive Optimization", "liquid clustering|predictive optimization"),
        @("Compute Selection", "serverless|classic compute|job compute|all-purpose|sql warehouse|compute type"),
        @("On-prem Connectivity", "on-prem|vpn|directconnect|expressroute|vnet|vpc")
    )

    foreach ($r in $rules) {
        if ($t -match $r[1]) { $tags.Add($r[0]) }
    }
    if ($tags.Count -eq 0) { $tags.Add("General") }
    return ($tags.ToArray() -join ", ")
}

function Get-Subtopic {
    param([string]$Tags, [string]$Category)
    if ($Tags -match "Unity Catalog|Column Mask|Managed vs External") { return "governance-security" }
    if ($Tags -match "Auto Loader|Lakeflow Connect|COPY INTO|Structured Streaming") { return "ingestion-loading" }
    if ($Tags -match "Lakeflow Jobs") { return "jobs-orchestration" }
    if ($Tags -match "DAB|Git Folders") { return "cicd" }
    if ($Tags -match "Performance|Liquid|Delta Lake") { return "troubleshooting-optimization" }
    if ($Tags -match "PySpark|SQL|Medallion") { return "transformation-modeling" }
    if ($Tags -match "Compute") { return "platform-compute" }
    return ($Category -replace "（.*$", "" -replace "^Section \d+: ", "").ToLowerInvariant().Replace(" ", "-")
}

$rows = New-Object System.Collections.Generic.List[object]

Get-ChildItem -LiteralPath $questionsRoot -Filter "questions_*.md" | Sort-Object Name | ForEach-Object {
    $text = Get-Content -LiteralPath $_.FullName -Raw -Encoding UTF8
    $blocks = [regex]::Matches($text, "(?ms)^## (P(\d)-Q(\d{3}))\s*\r?\n(.*?)(?=^## P\d-Q\d{3}\s*$|\z)")
    foreach ($m in $blocks) {
        $id = $m.Groups[1].Value
        $round = [int]$m.Groups[2].Value
        $qnum = [int]$m.Groups[3].Value
        $block = $m.Groups[4].Value
        $category = Get-Section $block "カテゴリ" @("設問", "選択肢", "正答", "設問の解説")
        $question = Get-Section $block "設問" @("選択肢", "正答", "設問の解説")
        $options = Get-Section $block "選択肢" @("正答", "設問の解説")
        $textForTags = "$category $question $options"
        $tags = Get-Tags $textForTags
        $subtopic = Get-Subtopic $tags $category
        $rows.Add([pscustomobject]@{
            ID = $id
            Round = $round
            Question = $qnum
            Category = $category
            Subtopic = $subtopic
            Tags = $tags
        })
    }
}

$md = New-Object System.Collections.Generic.List[string]
$md.Add("# Question Index")
$md.Add("")
$md.Add("全220問を横断出題するための索引です。")
$md.Add("")
$md.Add("| ID | 回 | 問題 | 公式カテゴリ | サブトピック | 技術タグ |")
$md.Add("|---|---:|---:|---|---|---|")
foreach ($r in $rows) {
    $md.Add("| $($r.ID) | $($r.Round) | $($r.Question) | $($r.Category) | $($r.Subtopic) | $($r.Tags) |")
}
Set-Content -LiteralPath (Join-Path $indexRoot "question_index.md") -Value $md -Encoding UTF8

$rows | Export-Csv -LiteralPath (Join-Path $indexRoot "question_index.csv") -NoTypeInformation -Encoding UTF8
