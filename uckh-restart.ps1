<# PowerShell Script rebooting UCKH #>

<# 遠程設備的SSH設定 #>
$SSH_HOST = "switch-core"  <# 設定SSH主機名稱或IP地址 #>
$SSH_USER = "cloverdefa"  <# 設定SSH用戶名 #>
$SSH_KEY_PATH = "$HOME\.ssh\id_rsa"  <# 設定私鑰文件的路徑 #>

<# 設置命令 #>
$CONFIG_COMMANDS = @(
    "enable",  <# 啟用特權模式 #>
    "configure",  <# 進入配置模式 #>
    "interface 0/1",  <# 進入0/1介面配置模式 #>
    "poe opmode shutdown",  <# 設置PoE操作模式為關閉 #>
    "poe opmode auto",  <# 再次設置PoE操作模式為自動 #>
    "exit",  <# 退出介面配置模式 #>
    "exit",  <# 退出配置模式 #>
    "exit"  <# 退出SSH會話 #>
)

<# 將SSH金鑰添加到SSH代理 #>
Add-SshKey -Path $SSH_KEY_PATH

<# 通過SSH連接和配置遠程設備 #>
$session = New-SSHSession -ComputerName $SSH_HOST `
                        -KeyFile $SSH_KEY_PATH `
                        -UserName $SSH_USER
if ($session) {
    $shell = New-SSHShellStream -SSHSession $session
    foreach ($cmd in $CONFIG_COMMANDS) {
        $shell.WriteLine($cmd)  <# 發送命令 #>
        Start-Sleep -Seconds 1  <# 添加1秒的延遲 #>
    }
    $shell.Close()
    Remove-SSHSession -SSHSession $session
    Write-Host "Unifi Cloudkey Home 重新PoE送電啟動完成。"  <# 顯示配置完成的消息 #>
} else {
    Write-Host "無法建立SSH會話。"  <# 顯示錯誤消息，無法建立SSH會話 #>
}

Exit
