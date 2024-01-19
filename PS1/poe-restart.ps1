< # Unifi Switch PoE 重新啟動 # >

# 遠程設備的SSH設定
$SSH_HOST = "switch-core"  # 設定SSH主機名稱或IP地址
$SSH_USER = "cloverdefa"  # 設定SSH用戶名
$SSH_KEY = "$env:USERPROFILE\.ssh\id_rsa"  # 私鑰文件的路徑

# 設置命令
$CONFIG_COMMANDS = @(
    "telnet localhost",  # 進入telnet模式
    "enable",  # 啟用特權模式
    "configure",  # 進入配置模式
    "interface 0/1",  # 進入0/1介面配置模式
    "poe opmode shutdown",  # 設置PoE操作模式為關閉
    "poe opmode auto",  # 再次設置PoE操作模式為自動
    "exit",  # 退出介面配置模式
    "exit",  # 退出配置模式
    "exit",  # 退出特權模式
    "exit",  # 退出telnet
    "exit"  # 退出SSH會話
)

# 使用SSH金鑰認證連接和配置遠程設備
foreach ($cmd in $CONFIG_COMMANDS) {
    Write-Host $cmd
    Start-Sleep -Seconds 1
}

# 檢查SSH連接的退出狀態
if ($LASTEXITCODE -ne 0) {
    Write-Host "無法建立SSH連接。"
    exit 1
}
