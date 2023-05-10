# Windows Terminal Script run git pull

echo "bash pull"
z bash
git checkout main
git pull
echo "Git Pull完成"

echo "Containers pull"
z Containers
git checkout main
git pull
echo "Git Pull完成"

echo "Rule-Sets pull"
z Rule-Sets
git checkout main
git pull
echo "Git Pull完成"

echo "Script pull"
z Script
git checkout main
git pull
echo "Git Pull完成"

echo "ssh pull"
z ssh
git checkout main
git pull
echo "Git Pull完成"

echo "VPN-Service"
z VPN-Service
git checkout main
git pull
echo "Git Pull完成"

echo "Whosis-Sayings pull"
z Whosis-Sayings
git checkout main
git pull
echo "Git Pull完成"

echo "DnsChecker pull"
z DnsChecker
git checkout main
git pull
echo "Git Pull完成"

cd C:/Users/clove/Github

echo "Pull 結束"