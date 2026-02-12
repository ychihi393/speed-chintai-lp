# このスクリプトがあるフォルダをカレントにして簡易HTTPサーバーを起動
# 使い方: エクスプローラーでこのファイルを右クリック → 「PowerShellで実行」
# または、このフォルダでターミナルを開き: .\start.ps1
$here = $PSScriptRoot
if (-not $here) { $here = Get-Location | Select-Object -ExpandProperty Path }
Set-Location -LiteralPath $here

$port = 5500
Write-Host "起動中: http://localhost:$port/"
Write-Host "止めるには Ctrl+C を押してください。"
Write-Host ""

$python = $null
if (Get-Command python -ErrorAction SilentlyContinue) { $python = "python" }
elseif (Get-Command py -ErrorAction SilentlyContinue) { $python = "py" }
if (-not $python) {
    Write-Host "エラー: Python が見つかりません。Python をインストールしてください。"
    Write-Host "  https://www.python.org/downloads/"
    exit 1
}
& $python -m http.server $port
