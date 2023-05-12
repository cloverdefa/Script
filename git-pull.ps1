# Windows Terminal Script run git pull

echo "========================="
echo "bash 拉取遠端資料"
echo "========================="
z bash
git checkout main
git pull
echo "Git 拉取遠端資料完成"
echo "========================="

echo "========================="
echo "Containers 拉取遠端資料"
echo "========================="
z Containers
git checkout main
git pull
echo "Git 拉取遠端資料完成"
echo "========================="

echo "========================="
echo "Rule-Sets 拉取遠端資料"
echo "========================="
z Rule-Sets
git checkout main
git pull
echo "Git 拉取遠端資料完成"
echo "========================="

echo "========================="
echo "Script 拉取遠端資料"
echo "========================="
z Script
git checkout main
git pull
echo "Git 拉取遠端資料完成"
echo "========================="

echo "========================="
echo "ssh 拉取遠端資料"
echo "========================="
z ssh
git checkout main
git pull
echo "Git 拉取遠端資料完成"
echo "========================="

echo "========================="
echo "VPN-Service 拉取遠端資料"
echo "========================="
z VPN-Service
git checkout main
git pull
echo "Git 拉取遠端資料完成"
echo "========================="

echo "========================="
echo "Whosis-Sayings 拉取遠端資料"
echo "========================="
z Whosis-Sayings
git checkout main
git pull
echo "Git 拉取遠端資料完成"
echo "========================="

echo "========================="
echo "DnsChecker 拉取遠端資料"
echo "========================="
z DnsChecker
git checkout main
git pull
echo "Git 拉取遠端資料完成"
echo "========================="

cd C:/Users/clove/Github

echo "拉取遠端資料結束"