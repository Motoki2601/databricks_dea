$ErrorActionPreference = "Stop"

$udemyRoot = "C:\Users\motok\Desktop\Databricks DEA\Udemy"
$outputRoot = "C:\Users\motok\Desktop\Databricks DEA\Exam Guide\formatted_questions"

New-Item -ItemType Directory -Force -Path $outputRoot | Out-Null

function Get-Category {
    param([string]$Text)

    $t = $Text.ToLowerInvariant()

    if ($t -match "git folder|repos|pull request|asset bundle|automation bundle|dab|databricks bundle|bundle deploy|bundle run|databricks cli|databricks.yml") {
        return "Section 5: Implementing CI/CD（10%）"
    }
    if ($t -match "auto loader|cloudfiles|copy into|lakeflow connect|managed ingestion|connector|file upload|ingest|ingestion|readstream|schema evolution|schema inference|csv|json|jdbc|odbc|rest client|checkpoint|streaming source|trigger\(") {
        return "Section 2: Data Ingestion and Loading（21%）"
    }
    if ($t -match "unity catalog|grant |revoke|deny|privilege|permission|mask|row filter|abac|managed table|external table|set managed|use catalog|use schema|owner|confidential|is_account_group_member") {
        return "Section 7: Governance and Security（15%）"
    }
    if ($t -match "lakeflow job|databricks job|\btask\b|\btasks\b|run_if|job cluster|job failure|job completes|email notification|trigger type|file arrival|retry|repair run|orchestration|workflow") {
        return "Section 4: Working with Lakeflow Jobs（16%）"
    }
    if ($t -match "spark ui|data skew|skew|shuffle|oom|outofmemory|executor lost|broadcast|aqe|adaptive query|liquid clustering|predictive optimization|optimize|vacuum|zorder|small file|performance|bottleneck|auto stop|warehouse") {
        return "Section 6: Troubleshooting, Monitoring, and Optimization（10%）"
    }
    if ($t -match "dataframe|pyspark|groupby|withcolumn|select|join|union|deduplicate|dropduplicates|summary\(|try_cast|udf|create function|materialized view|silver|bronze|gold|medallion|delta table|time travel|constraint|expect|aggregation|explode|split\(") {
        return "Section 3: Data Transformation and Modeling（22%）"
    }
    if ($t -match "classic compute|serverless|sql warehouse|all-purpose|customer cloud account|data plane|control plane|notebook stored|lakehouse architecture|compute virtual machines|databricks web application") {
        return "Section 1: Databricks Intelligence Platform（6%）"
    }

    return "未分類"
}

function Normalize-Text {
    param([string]$Text)
    return (($Text -replace "`r`n", "`n").Trim() -replace "`n{3,}", "`n`n")
}

function Split-Question {
    param([string]$BeforeAnswer)

    $lines = @($BeforeAnswer -split "`r?`n" | Where-Object { $_.Trim() -ne "リソース" })
    $chooseIndex = -1
    for ($i = 0; $i -lt $lines.Count; $i++) {
        if ($lines[$i] -match "^Choose \d+ answers$") {
            $chooseIndex = $i
            break
        }
    }

    $optionStart = -1
    if ($chooseIndex -ge 0) {
        $optionStart = $chooseIndex + 1
    }
    else {
        for ($i = 0; $i -lt $lines.Count; $i++) {
            if ($lines[$i].Trim().EndsWith("?")) {
                $optionStart = $i + 1
            }
        }
        if ($optionStart -lt 0) {
            $optionStart = [Math]::Max(1, $lines.Count - 4)
        }
    }

    $questionLines = @()
    if ($optionStart -gt 0) {
        $questionLines = $lines[0..($optionStart - 1)]
    }
    $optionLines = @()
    if ($optionStart -lt $lines.Count) {
        $optionLines = $lines[$optionStart..($lines.Count - 1)]
    }

    return @{
        Question = (Normalize-Text ($questionLines -join "`n"))
        OptionsText = (Normalize-Text ($optionLines -join "`n"))
    }
}

function Get-AnswerTexts {
    param([string]$MainText)

    $answers = New-Object System.Collections.Generic.List[string]
    $lines = @($MainText -split "`r?`n")

    for ($i = 0; $i -lt $lines.Count; $i++) {
        if ($lines[$i].Trim() -eq "正解" -or $lines[$i].Trim() -eq "正しい選択") {
            $chunk = New-Object System.Collections.Generic.List[string]
            $started = $false
            for ($j = $i + 1; $j -lt $lines.Count; $j++) {
                $line = $lines[$j]
                $trim = $line.Trim()
                if ($trim -eq "正解" -or $trim -eq "正しい選択") {
                    break
                }
                if (-not $started -and $trim -eq "") {
                    continue
                }
                if ($started -and $trim -eq "") {
                    $next = ""
                    for ($k = $j + 1; $k -lt $lines.Count; $k++) {
                        if ($lines[$k].Trim() -ne "") {
                            $next = $lines[$k].Trim()
                            break
                        }
                    }
                    if ($next -eq "") {
                        break
                    }
                    $current = (($chunk.ToArray() -join "`n").Trim())
                    $codeContinuation = $false
                    if ($current -match "^(CREATE|ALTER|GRANT|SELECT|COPY|databricks|spark\.|df\.|import |from pyspark|@dlt|dlt\.|resultdf|result_df)" -and $next -match "^(RETURNS|RETURN|AS |FROM |WHERE |CONSTRAINT|COMMENT|LOCATION|TBLPROPERTIES|\.|option|trigger|table\(|resultdf|result_df|df\.|spark\.|import |from |@dlt|dlt\.)") {
                        $codeContinuation = $true
                    }
                    if (-not $codeContinuation) {
                        break
                    }
                }
                $started = $true
                $chunk.Add($line)
            }
            $answer = Normalize-Text ($chunk.ToArray() -join "`n")
            if ($answer -ne "") {
                $answers.Add($answer)
            }
        }
    }

    return @($answers.ToArray())
}

Get-ChildItem -LiteralPath $udemyRoot -Directory | Sort-Object Name | ForEach-Object {
    $roundName = $_.Name
    $inputPath = Join-Path $_.FullName "問題文.txt"
    if (-not (Test-Path -LiteralPath $inputPath)) {
        return
    }

    $text = Get-Content -LiteralPath $inputPath -Raw -Encoding UTF8
    $examTitle = (($text -split "`r?`n" | Select-Object -First 1).Trim())
    $matches = [regex]::Matches($text, "(?ms)^問題(\d+)\s*\r?\n未回答\s*\r?\n(.*?)(?=^問題\d+\s*$|\z)")
    $out = New-Object System.Collections.Generic.List[string]

    $out.Add("# $roundName Databricks DEA Udemy模擬問題")
    $out.Add("")
    $out.Add("- 元ファイル: ``$inputPath``")
    $out.Add("- 試験名: $examTitle")
    $out.Add("- 問題数: $($matches.Count)")
    $out.Add("")

    foreach ($m in $matches) {
        $num = $m.Groups[1].Value
        $body = $m.Groups[2].Value
        $parts = [regex]::Split($body, "(?m)^全体的な説明\s*$")
        $main = $parts[0]
        $explanation = ""
        if ($parts.Count -gt 1) {
            $explanation = Normalize-Text $parts[1]
        }

        $cleanMain = [regex]::Replace($main, "(?m)^正解\s*$|^正しい選択\s*$", "")
        $parsed = Split-Question $cleanMain
        $answers = Get-AnswerTexts $main

        $allText = "$($parsed.Question)`n$($parsed.OptionsText)`n$($answers -join "`n")`n$explanation"
        $category = Get-Category $allText

        $out.Add("## $roundName 問題$num")
        $out.Add("")
        $out.Add("### カテゴリ")
        $out.Add("")
        $out.Add($category)
        $out.Add("")
        $out.Add("### 設問")
        $out.Add("")
        $out.Add($parsed.Question)
        $out.Add("")
        $out.Add("### 選択肢")
        $out.Add("")
        $out.Add($parsed.OptionsText)
        $out.Add("")
        $out.Add("### 正答")
        $out.Add("")
        foreach ($ans in $answers) {
            $out.Add("- $ans")
        }
        $out.Add("")
        $out.Add("### 設問の解説")
        $out.Add("")
        $out.Add($explanation)
        $out.Add("")
    }

    $outputPath = Join-Path $outputRoot "$roundName.md"
    Set-Content -LiteralPath $outputPath -Value $out -Encoding UTF8
}
