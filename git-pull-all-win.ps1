# 存儲最初目錄
$originalLocation = Get-Location

# 讀取.env檔案並解析為陣列
$envContent = Get-Content -Path ".env" | Out-String
$envContent = $envContent -replace "[\r\n]+", " "  # 移除換行符
$envContent = $envContent -replace '"', ""  # 移除雙引號
$repositories = Invoke-Expression $envContent

# 使用環境變量來設定本地儲存庫根目錄路徑
$localRepositoryRoot = $env:USERPROFILE + "\github"

# 遍歷每個儲存庫並執行Git操作
foreach ($repository in $repositories) {
    Write-Host "檢查儲存庫: $repository"
    
    # 構建完整的本地儲存庫路徑
    $localRepositoryPath = Join-Path -Path $localRepositoryRoot -ChildPath $repository
    
    # 進入儲存庫目錄
    Set-Location -Path $localRepositoryPath
    
    # 檢查是否需要切換到main分支
    $currentBranch = git rev-parse --abbrev-ref HEAD
    if ($currentBranch -ne "main") {
        Write-Host "切換到main分支中..."
        git checkout main
    }
    
    # 檢查是否有更新需要拉取
    $result = git pull
    if ($result -match "Already up to date.") {
        Write-Host "儲存庫已經是最新的。"
    } elseif ($result -match "Updating") {
        Write-Host "儲存庫已經更新。"
    } else {
        Write-Host "無法確定儲存庫狀態。請檢查是否有變更或問題。"
    }
    
    # 返回上一級目錄
    Set-Location -Path $localRepositoryRoot
    
    Write-Host "---------------------------------------------"
}

# 返回到原始目錄
Set-Location -Path $originalLocation
Exit
