# 定義要更新的主機名稱列表
$hostnames = "pve", "snell", "zero-trust", "agh", "bot", 
    "uptime-kuma", "wordpress", "rustdesk-server", 
    "Node-01", "Node-02", "Node-03", "Node-04", 
    "unifi-cloudkey-home", "unifi-cloudkey-office"

# 定義更新虛擬機的函數
function Update-VM {
    param (
        [string]$hostname
    )
    # 顯示正在更新的主機名稱
    Write-Host "更新 $hostname 主機"

    # 使用 SSH 命令執行虛擬機更新作業
    ssh $hostname 'update-vm'

    # 顯示空行
    Write-Host ""
}

# 初始化成功標誌
$success = $true

# 遍歷主機名稱列表並呼叫 Update-VM 函數以執行更新作業
$hostnames | ForEach-Object {
    Update-VM -hostname $_
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
