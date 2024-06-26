<# PowerShell Script git pull all Repositories #>

<# 記錄當下原始路徑 #>
$originalLocation = Get-Location

<# 定義儲存庫清單文件路徑 #>
$repositoryFile = "$env:USERPROFILE\.config\list\.repositories.list"

<# 檢查儲存庫清單文件是否存在 #>
if (-not (Test-Path $repositoryFile)) {
  Write-Host "儲存庫清單文件不存在" -ForegroundColor Red
    Exit
}

<# 从 .repositories.list 檔案中讀取儲存控名稱列表，並過濾掉空白行以及注釋行 #>
$repositories = Get-Content $repositoryFile | Where-Object { $_ -match '^\s*[^#].*' }

<# 使用環境變量來設置本地儲存庫跟目錄路徑 #>
$localRepositoryRoot = "$env:USERPROFILE\github"

<# 歷遍每一個儲存控並執行 Git 操作 #>
foreach ($repository in $repositories) {
  Write-Host "檢查儲存庫: $repository" -ForegroundColor Yellow

    <# 構建完整的儲存庫路徑 #>
    $localRepositoryPath = Join-Path -Path $localRepositoryRoot -ChildPath $repository

    Set-Location -Path $localRepositoryPath

    <# 检查是否需要切换到 main 分支 #>
    $currentBranch = git rev-parse --abbrev-ref HEAD

    if ($currentBranch -ne "main") {
      Write-Host "切換到 main 分支中..."
        git checkout main
    }

  <# 检查是否有更新需要拉取 #>
    $result = git pull
    if ($result -match "Already up to date.") {
      Write-Host "儲存庫已經是最新的。儲存庫名稱：$repository" -ForegroundColor Green
    } elseif ($result -match "Updating") {
      Write-Host "儲存庫已經更新。儲存庫名稱：$repository" -ForegroundColor Green
    } else {
      Write-Host "無法確定儲存庫狀態。請檢查是否有變更或問題。儲存庫名稱：$repository" -ForegroundColor Red
    }

  <# 返回上一層目錄 #>
    Set-Location -Path $localRepositoryRoot

    <# 顯示分隔線 #>
    Write-Output ("-" * 50)
}

<# 返回原始目錄 #>
Set-Location -Path $originalLocation

Exit

