# Windows Terminal Script run git pull

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
echo "Python-studanty 拉取遠端資料"
echo "========================="
cd c:\Users\clove\github\python-studanty
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

echo "全部遠端資料拉取同步結束"

# Done
Exit
