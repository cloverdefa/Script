<#  顯示NODE01目前HATH硬碟空間使用狀況 #>

<# 目標機器的 hostname #>
$TargetHost = "node01"

<# SSH連線並執行指令 #>
ssh $TargetHost "du ~/hath -sh"

<# 回饋畫面顯示 #>
Write-Host "指令執行完成"

