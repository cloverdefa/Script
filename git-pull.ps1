# Windows Terminal Script run git pull

echo "========================="
echo "bash 拉取遠端資料"
echo "========================="
cd c:\Users\clove\github\bash
Get-Location | Foreach-Object { $_.Path }
git checkout main
git fetch -p
git pull
echo "Git 拉取遠端資料完成"
echo "========================="

echo "========================="
echo "PowerShell 拉取遠端資料"
echo "========================="
cd c:\Users\clove\github\PowerShell
Get-Location | Foreach-Object { $_.Path }
git checkout main
git fetch -p
git pull
echo "Git 拉取遠端資料完成"
echo "========================="


echo "========================="
echo "Containers 拉取遠端資料"
echo "========================="
cd c:\Users\clove\github\Containers
Get-Location | Foreach-Object { $_.Path }
git checkout main
git fetch -p
git pull
echo "Git 拉取遠端資料完成"
echo "========================="


echo "========================="
echo "Rule-Sets 拉取遠端資料"
echo "========================="
cd c:\Users\clove\github\Rule-Sets
Get-Location | Foreach-Object { $_.Path }
git checkout main
git fetch -p
git pull
echo "Git 拉取遠端資料完成"
echo "========================="


echo "========================="
echo "Script 拉取遠端資料"
echo "========================="
cd c:\Users\clove\github\Script
Get-Location | Foreach-Object { $_.Path }
git checkout main
git fetch -p
git pull
echo "Git 拉取遠端資料完成"
echo "========================="


echo "========================="
echo "ssh 拉取遠端資料"
echo "========================="
cd c:\Users\clove\github\ssh
Get-Location | Foreach-Object { $_.Path }
git checkout main
git fetch -p
git pull
echo "Git 拉取遠端資料完成"
echo "========================="


echo "========================="
echo "VPN-Service 拉取遠端資料"
echo "========================="
cd c:\Users\clove\github\VPN-Service
Get-Location | Foreach-Object { $_.Path }
git checkout main
git fetch -p
git pull
echo "Git 拉取遠端資料完成"
echo "========================="


echo "========================="
echo "Whosis-Sayings 拉取遠端資料"
echo "========================="
cd c:\Users\clove\github\Whosis-Sayings
Get-Location | Foreach-Object { $_.Path }
git checkout main
git fetch -p
git pull
echo "Git 拉取遠端資料完成"
echo "========================="


echo "========================="
echo "DnsChecker 拉取遠端資料"
echo "========================="
cd c:\Users\clove\github\DnsChecker
Get-Location | Foreach-Object { $_.Path }
git checkout main
git fetch -p
git pull
echo "Git 拉取遠端資料完成"
echo "========================="

echo "全部遠端資料拉取同步結束"

# Done
exit