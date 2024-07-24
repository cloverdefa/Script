<# 記錄當下原始路徑 #>
$originalLocation = Get-Location

<# 定義儲存庫清單文件路徑 #>
$repositoryFile = "$env:USERPROFILE\.config\list\.repositories.list"

<# 檢查儲存庫清單文件是否存在 #>
if (-not (Test-Path $repositoryFile)) {
  Write-Host "儲存庫清單文件不存在" -ForegroundColor Red
  Exit
}

<# 從 .repositories.list 檔案中讀取儲存控名稱列表，並過濾掉空白行以及注釋行 #>
$repositories = Get-Content $repositoryFile | Where-Object { $_ -match '^\s*[^#].*' }

<# 使用環境變量來設置本地儲存庫根目錄路徑 #>
$localRepositoryRoot = "$env:USERPROFILE\github"

<# 檢查本地儲存庫根目錄是否存在，若不存在則創建 #>
if (-not (Test-Path $localRepositoryRoot)) {
  New-Item -ItemType Directory -Path $localRepositoryRoot
}

<# 歷遍每一個儲存控並執行 Git 操作 #>
foreach ($repository in $repositories) {
  Write-Host "檢查儲存庫: $repository" -ForegroundColor Yellow

  <# 構建完整的儲存庫路徑 #>
  $localRepositoryPath = Join-Path -Path $localRepositoryRoot -ChildPath $repository

  if (-not (Test-Path $localRepositoryPath)) {
    Write-Host "儲存庫目錄不存在，正在克隆: $repository" -ForegroundColor Cyan
    git clone "https://github.com/$repository.git" $localRepositoryPath
  }

  Set-Location -Path $localRepositoryPath

  <# 檢查是否需要切換到 main 分支 #>
  $currentBranch = git rev-parse --abbrev-ref HEAD

  if ($currentBranch -ne "main") {
    Write-Host "切換到 main 分支中..."
    git checkout main
  }

  <# 檢查是否有更新需要拉取 #>
  $result = git pull --rebase
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

<# 同步 nvim 資料夾到使用者目錄\AppData\Local\nvim #>
$localNvimPath = "$env:LOCALAPPDATA\nvim"

Write-Host "同步 nvim 資料夾到: $localNvimPath" -ForegroundColor Yellow

if (-not (Test-Path $localNvimPath)) {
  Write-Host "nvim 儲存庫目錄不存在，正在克隆 nvim 儲存庫"
  git clone "https://github.com/cloverdefa/nvim-win.git" $localNvimPath
} else {
  Write-Host "nvim 資料夾已存在，正在執行 git pull"
  Set-Location -Path $localNvimPath
  git pull --rebase
  if ($?) {
    Write-Host "nvim 資料夾更新完成。" -ForegroundColor Green
  } else {
    Write-Host "nvim 資料夾更新失敗。" -ForegroundColor Red
  }
}

<# 返回原始目錄 #>
Set-Location -Path $originalLocation

Exit

