<# PowerShell Script git pull all #>

<# 存儲最初目錄 #>
$originalLocation = Get-Location

<# 從 .repositories.list 檔案中讀取存儲庫名稱列表，並過濾掉空白以及注釋行 #>
$repositoryFile = "$env:USERPROFILE\.config\list\.repositories.list"
$repositories = Get-Content $repositoryFile | Where-Object { $_ -match '^\s*[^#].*' }

<# 使用環境變量來設定本地儲存庫根目錄路徑 #>
$localRepositoryRoot = "$env:USERPROFILE\github"

<# 遍歷每個儲存庫並執行Git操作 #>
foreach ($repository in $repositories) {
    Write-Host "檢查儲存庫: $repository"

    <# 構建完整的儲存庫路徑 #>
    $localRepositoryPath = Join-Path -Path $localRepositoryRoot -ChildPath $repository
    
    Set-Location -Path $localRepositoryPath

    <# 檢查是否需要切換到main分支 #>
    $currentBranch = git rev-parse --abbrev-ref HEAD

    if ($currentBranch -ne "main") {
        Write-Host "切換到main分支中..."
        git checkout main
    }

    <# 檢查是否有更新需要拉取 #>
    $result = git pull
    if ($result -match "Already up to date.") {
         Write-Host "儲存庫已經是最新的。儲存庫名稱：$repository"
    } elseif ($result -match "Updating") {
        Write-Host "儲存庫已經更新。儲存庫名稱：$repository"
    } else {
        Write-Host "無法確定儲存庫狀態。請檢查是否有變更或問題。儲存庫名稱：$repository"
    }
    
    <# 返回上一級目錄 #>
    Set-Location -Path $localRepositoryRoot

    <# 顯示分隔線 #>
    Write-Output ("-" * 25)
}

<# 返回到原始目錄 #>
Set-Location -Path $originalLocation

Exit