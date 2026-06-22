$ErrorActionPreference = "Stop"

$root = "C:\Users\motok\Desktop\Databricks DEA\Exam Guide"
$packRoot = Join-Path $root "Databricks_DEA_Study"
$sourceRoot = Join-Path $root "split_questions"

$dirs = @(
    "00_instructions",
    "01_questions_ja",
    "02_answers_ja",
    "03_official_guide",
    "04_attempt_logs",
    "05_analysis",
    "90_source_en"
)

foreach ($d in $dirs) {
    New-Item -ItemType Directory -Force -Path (Join-Path $packRoot $d) | Out-Null
}

Copy-Item -LiteralPath (Join-Path $root "databricks_dea_exam_guide.md") -Destination (Join-Path $packRoot "03_official_guide\databricks_dea_exam_guide.md") -Force
Copy-Item -LiteralPath (Join-Path $sourceRoot "*.md") -Destination (Join-Path $packRoot "90_source_en") -Force

function Normalize-Text {
    param([string]$Text)
    return (($Text -replace "`r`n", "`n").Trim() -replace "`n{3,}", "`n`n")
}

function Convert-QuestionIds {
    param(
        [string]$InputPath,
        [string]$OutputPath,
        [string]$Kind,
        [int]$Round
    )

    $text = Get-Content -LiteralPath $InputPath -Raw -Encoding UTF8
    $prefix = "P$Round"
    $blocks = [regex]::Matches($text, "(?ms)^## [^\r\n]*?(\d+)\s*\r?\n(.*?)(?=^## |\z)")

    $out = New-Object System.Collections.Generic.List[string]
    $out.Add("# $Kind 第${Round}回")
    $out.Add("")
    $out.Add("- Source: ``$InputPath``")
    $out.Add("- Count: $($blocks.Count)")
    $out.Add("- ID format: P$Round-Q001")
    $out.Add("")

    foreach ($m in $blocks) {
        $num = [int]$m.Groups[1].Value
        $id = "{0}-Q{1:D3}" -f $prefix, $num
        $body = Normalize-Text $m.Groups[2].Value
        $out.Add("## $id")
        $out.Add("")
        $out.Add($body)
        $out.Add("")
    }

    Set-Content -LiteralPath $OutputPath -Value $out -Encoding UTF8
}

foreach ($i in 1..4) {
    Convert-QuestionIds `
        -InputPath (Join-Path $sourceRoot "questions_第${i}回.md") `
        -OutputPath (Join-Path $packRoot "01_questions_ja\questions_第${i}回.md") `
        -Kind "Questions" `
        -Round $i

    Convert-QuestionIds `
        -InputPath (Join-Path $sourceRoot "answers_第${i}回.md") `
        -OutputPath (Join-Path $packRoot "02_answers_ja\answers_第${i}回.md") `
        -Kind "Answers" `
        -Round $i
}
