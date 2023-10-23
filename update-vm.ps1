# 從 .server.list 檔案中讀取主機名稱列表
$hostnames = Get-Content -Path "$HOME\.config\list\.server.list"

# 定義更新虛擬機的函數
function Update-VM {
    param (
        [string]$hostname
    )
    # 顯示正在更新的主機名稱
    Write-Host "=============================="
    Write-Host "更新 $hostname 主機"
    Write-Host "=============================="

    # 使用 SSH 命令執行虛擬機更新作業
    ssh $hostname 'update-vm'

    # 顯示空行
    Write-Host ""
}

# 初始化成功標誌
$success = $true

# 遍歷主機名稱列表並呼叫 Update-VM 函數以執行更新作業，並傳遞更新命令
$updateCommand = "update-vm"  # 替換為實際的更新命令路徑
$hostnames | ForEach-Object {
    Update-VM -hostname $_ -updateCommand 'update-vm'
    # 檢查是否有更新錯誤，如果有，將成功標誌設置為 false
    if ($LASTEXITCODE -ne 0) {
        $success = $false
    }
}

# 顯示完成訊息
if ($success) {
    Write-Host "全部更新作業完成"
} else {
    Write-Host "更新出現錯誤"
}

# 結束程式，並根據成功標誌設置退出代碼
Exit $success
