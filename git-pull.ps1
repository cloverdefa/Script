# Windows Terminal Script run git pull

echo "========================="
echo "bash 拉取遠端資料"
echo "========================="
cd c:\Users\clove\github\bash
echo $(pwd)
git checkout main
git fetch -p
git pull
echo "Git 拉取遠端資料完成"
echo "========================="

echo "========================="
echo "Containers 拉取遠端資料"
echo "========================="
cd c:\Users\clove\github\Containers
echo $(pwd)
git checkout main
git fetch -p
git pull
echo "Git 拉取遠端資料完成"
echo "========================="

echo "========================="
echo "Rule-Sets 拉取遠端資料"
echo "========================="
cd c:\Users\clove\github\Rule-Sets
echo $(pwd)
git checkout main
git fetch -p
git pull
echo "Git 拉取遠端資料完成"
echo "========================="

echo "========================="
echo "Script 拉取遠端資料"
echo "========================="
cd c:\Users\clove\github\Script
echo $(pwd)
git checkout main
git fetch -p
git pull
echo "Git 拉取遠端資料完成"
echo "========================="

echo "========================="
echo "ssh 拉取遠端資料"
echo "========================="
cd c:\Users\clove\github\ssh
echo $(pwd)
git checkout main
git fetch -p
git pull
echo "Git 拉取遠端資料完成"
echo "========================="

echo "========================="
echo "VPN-Service 拉取遠端資料"
echo "========================="
cd c:\Users\clove\github\VPN-Service
echo $(pwd)
git checkout main
git fetch -p
git pull
echo "Git 拉取遠端資料完成"
echo "========================="

echo "========================="
echo "Whosis-Sayings 拉取遠端資料"
echo "========================="
cd c:\Users\clove\github\Whosis-Sayings
echo $(pwd)
git checkout main
git fetch -p
git pull
echo "Git 拉取遠端資料完成"
echo "========================="

echo "========================="
echo "DnsChecker 拉取遠端資料"
echo "========================="
cd c:\Users\clove\github\DnsChecker
echo $(pwd)
git checkout main
git fetch -p
git pull
echo "Git 拉取遠端資料完成"
echo "========================="

cd C:/Users/clove/Github

echo "拉取遠端資料結束"

# Done
exit