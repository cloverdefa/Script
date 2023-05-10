# Windows Terminal Script run git pull

echo "========================="
echo "bash pull"
echo "========================="
z bash
git checkout main
git pull
echo "Git Pull完成"
echo "========================="

echo "========================="
echo "Containers pull"
echo "========================="
z Containers
git checkout main
git pull
echo "Git Pull完成"
echo "========================="

echo "========================="
echo "Rule-Sets pull"
echo "========================="
z Rule-Sets
git checkout main
git pull
echo "Git Pull完成"
echo "========================="

echo "========================="
echo "Script pull"
echo "========================="
z Script
git checkout main
git pull
echo "Git Pull完成"
echo "========================="

echo "========================="
echo "ssh pull"
echo "========================="
z ssh
git checkout main
git pull
echo "Git Pull完成"
echo "========================="

echo "========================="
echo "VPN-Service"
echo "========================="
z VPN-Service
git checkout main
git pull
echo "Git Pull完成"
echo "========================="

echo "========================="
echo "Whosis-Sayings pull"
echo "========================="
z Whosis-Sayings
git checkout main
git pull
echo "Git Pull完成"
echo "========================="

echo "========================="
echo "DnsChecker pull"
echo "========================="
z DnsChecker
git checkout main
git pull
echo "Git Pull完成"
echo "========================="

cd C:/Users/clove/Github

echo "Pull 結束"