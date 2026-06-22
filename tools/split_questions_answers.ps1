$ErrorActionPreference = "Stop"

$inputRoot = "C:\Users\motok\Desktop\Databricks DEA\Exam Guide\formatted_questions"
$outputRoot = "C:\Users\motok\Desktop\Databricks DEA\Exam Guide\split_questions"

New-Item -ItemType Directory -Force -Path $outputRoot | Out-Null

function Normalize-Text {
    param([string]$Text)
    return (($Text -replace "`r`n", "`n").Trim() -replace "`n{3,}", "`n`n")
}

function Get-Section {
    param(
        [string]$Block,
        [string]$Name,
        [string[]]$NextNames
    )

    $escapedName = [regex]::Escape($Name)
    $nextPattern = ($NextNames | ForEach-Object { [regex]::Escape($_) }) -join "|"
    $pattern = "(?ms)^### $escapedName\s*\r?\n(.*?)(?=^### ($nextPattern)\s*$|\z)"
    $m = [regex]::Match($Block, $pattern)
    if ($m.Success) {
        return Normalize-Text $m.Groups[1].Value
    }
    return ""
}

Get-ChildItem -LiteralPath $inputRoot -Filter "*.md" | Sort-Object Name | ForEach-Object {
    $round = [IO.Path]::GetFileNameWithoutExtension($_.Name)
    $text = Get-Content -LiteralPath $_.FullName -Raw -Encoding UTF8
    $blocks = [regex]::Matches($text, "(?ms)^## ($round 問題\d+)\s*\r?\n(.*?)(?=^## $round 問題\d+\s*$|\z)")

    $questions = New-Object System.Collections.Generic.List[string]
    $answers = New-Object System.Collections.Generic.List[string]

    $questions.Add("# $round questions")
    $questions.Add("")
    $questions.Add("- Source: ``$($_.FullName)``")
    $questions.Add("- Count: $($blocks.Count)")
    $questions.Add("")

    $answers.Add("# $round answers")
    $answers.Add("")
    $answers.Add("- Source: ``$($_.FullName)``")
    $answers.Add("- Count: $($blocks.Count)")
    $answers.Add("")

    foreach ($m in $blocks) {
        $title = $m.Groups[1].Value
        $block = $m.Groups[2].Value
        $category = Get-Section $block "カテゴリ" @("設問", "選択肢", "正答", "設問の解説")
        $question = Get-Section $block "設問" @("選択肢", "正答", "設問の解説")
        $options = Get-Section $block "選択肢" @("正答", "設問の解説")
        $answer = Get-Section $block "正答" @("設問の解説")
        $explanation = Get-Section $block "設問の解説" @()

        $questions.Add("## $title")
        $questions.Add("")
        $questions.Add("### カテゴリ")
        $questions.Add("")
        $questions.Add($category)
        $questions.Add("")
        $questions.Add("### 設問")
        $questions.Add("")
        $questions.Add($question)
        $questions.Add("")
        $questions.Add("### 選択肢")
        $questions.Add("")
        $questions.Add($options)
        $questions.Add("")

        $answers.Add("## $title")
        $answers.Add("")
        $answers.Add("### カテゴリ")
        $answers.Add("")
        $answers.Add($category)
        $answers.Add("")
        $answers.Add("### 正答")
        $answers.Add("")
        $answers.Add($answer)
        $answers.Add("")
        $answers.Add("### 設問の解説")
        $answers.Add("")
        $answers.Add($explanation)
        $answers.Add("")
    }

    Set-Content -LiteralPath (Join-Path $outputRoot "questions_$round.md") -Value $questions -Encoding UTF8
    Set-Content -LiteralPath (Join-Path $outputRoot "answers_$round.md") -Value $answers -Encoding UTF8
}
