# Windows Terminal Script run git pull

echo "========================="
echo "bash 拉取遠端資料"
echo "========================="
cd c:\Users\clove\github\bash
Get-Location | Foreach-Object { $_.Path }
git checkout main
git fetch -p
git pull
if (@? -ne 0)
{
    echo "拉取 bash 遠端資料出現錯誤"
}
else
{
    echo "bash 拉取遠端 Git 資料完成"
}    
echo "========================="

echo "========================="
echo "Containers 拉取遠端資料"
echo "========================="
cd c:\Users\clove\github\Containers
Get-Location | Foreach-Object { $_.Path }
git checkout main
git fetch -p
git pull
if (@? -ne 0)
{
    echo "拉取 Containers 遠端資料出現錯誤"
}
else
{
    echo "Conteiners 拉取遠端 Git 資料完成"
}
echo "========================="

echo "========================="
echo "hath-docker 拉取遠端資料"
echo "========================="
cd c:\Users\clove\github\hath-docker
Get-Location | Foreach-Object { $_.Path }
git checkout main
git fetch -p
git pull
if (@? -ne 0)
{
    echo "拉取 hath-docker 遠端資料出現錯誤"
}
else
{
    echo "hath-docker 拉取遠端 Git 資料完成"
}    
echo "========================="

echo "========================="
echo "PowerShell 拉取遠端資料"
echo "========================="
cd c:\Users\clove\github\PowerShell
Get-Location | Foreach-Object { $_.Path }
git checkout main
git fetch -p
git pull
if (@? -ne 0)
{
    echo "拉取 PowerShell 遠端資料出現錯誤"
}
else
{
    echo "PowerShell 拉取遠端 Git 資料完成"
}    
echo "========================="

echo "========================="
echo "python-studanty 拉取遠端資料"
echo "========================="
cd c:\Users\clove\github\python-studanty
Get-Location | Foreach-Object { $_.Path }
git checkout main
git fetch -p
git pull
if (@? -ne 0)
{
    echo "拉取 python-studanty 遠端資料出現錯誤"
}
else
{
    echo "python-studanty 拉取遠端 Git 資料完成"
}    
echo "========================="

echo "========================="
echo "Rule-Sets 拉取遠端資料"
echo "========================="
cd c:\Users\clove\github\Rule-Sets
Get-Location | Foreach-Object { $_.Path }
git checkout main
git fetch -p
git pull
if (@? -ne 0)
{
    echo "拉取 Rule-Sets 遠端資料出現錯誤"
}
else
{
    echo "Rule-Sets 拉取遠端 Git 資料完成"
}    
echo "========================="

echo "========================="
echo "Script 拉取遠端資料"
echo "========================="
cd c:\Users\clove\github\Script
Get-Location | Foreach-Object { $_.Path }
git checkout main
git fetch -p
git pull
if (@? -ne 0)
{
    echo "拉取 Script 遠端資料出現錯誤"
}
else
{
    echo "Script 拉取遠端 Git 資料完成"
}    
echo "========================="

echo "========================="
echo "ssh 拉取遠端資料"
echo "========================="
cd c:\Users\clove\github\ssh
Get-Location | Foreach-Object { $_.Path }
git checkout main
git fetch -p
git pull
if (@? -ne 0)
{
    echo "拉取 ssh 遠端資料出現錯誤"
}
else
{
    echo "ssh 拉取遠端 Git 資料完成"
}    
echo "========================="

echo "========================="
echo "VPN-Service 拉取遠端資料"
echo "========================="
cd c:\Users\clove\github\VPN-Service
Get-Location | Foreach-Object { $_.Path }
git checkout main
git fetch -p
git pull
if (@? -ne 0)
{
    echo "拉取 VPN-Service 遠端資料出現錯誤"
}
else
{
    echo "VPN-Service 拉取遠端 Git 資料完成"
}    
echo "========================="

echo "========================="
echo "Whosis-Sayings 拉取遠端資料"
echo "========================="
cd c:\Users\clove\github\Whosis-Sayings
Get-Location | Foreach-Object { $_.Path }
git checkout main
git fetch -p
git pull
if (@? -ne 0)
{
    echo "全部 Git 遠端資料拉取同步結束"
    cd
    Exit
}
else
{
    echo "Whosis-Sayings 拉取遠端 Git 資料完成"
}    

# Done
