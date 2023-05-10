# Windows Terminal Script run git pull

echo "bash pull"
z bash
git branch main
git pull
echo "Git Pull完成"

echo "Containers pull"
z Containers
git branch main
git pull
echo "Git Pull完成"

echo "Rule-Sets pull"
z Rule-Sets
git branch main
git pull
echo "Git Pull完成"

echo "Script pull"
z Script
git branch main
git pull
echo "Git Pull完成"

echo "ssh pull"
z ssh
git branch main
git pull
echo "Git Pull完成"

echo "VPN-Service"
z VPN-Service
git branch main
git pull
echo "Git Pull完成"

echo "Whosis-Sayings pull"
z Whosis-Sayings
git branch main
git pull
echo "Git Pull完成"

echo "DnsChecker pull"
z DnsChecker
git branch main
git pull
echo "Git Pull完成"

cd C:/Users/clove/Github

echo "Pull 結束"