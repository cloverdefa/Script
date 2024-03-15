#! /usr/bin/env bash

# 定義顏色代碼
RED='\033[0;31m' # 红色
GREEN='\033[0;32m' # 绿色
YELLOW='\033[0;33m' # 黄色
NC='\033[0m'     # 重置颜色

# 定義Oh My Posh 系統平台
POSH=posh-linux-amd64

# 定義版本比較函式
version_compare() {
    # 刪去版本前的'v'字符
    version1=$(echo "$1" | sed 's/^v//')
    version2=$(echo "$2" | sed 's/^v//')

    # 使用awk進行版本比較
    awk -v v1="$version1" -v v2="$version2" '
        BEGIN {
            split(v1, a, ".");
            split(v2, b, ".");
            for (i = 1; i <= 3; i++) {
                if (a[i] > b[i]) {
                    print "gt";
                    exit;
                } else if (a[i] < b[i]) {
                    print "lt";
                    exit;
                }
            }
            print "eq";
        }'
}

# 獲取遠端版本
remote_version=$(curl -s https://api.github.com/repos/JanDeDobbeleer/oh-my-posh/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")')
# 獲取本地版本
local_version=$(oh-my-posh --version | cut -d' ' -f3)

# 進入用戶主目錄
cd $HOME

# 檢查遠端版本是否更新
compare_result=$(version_compare "$remote_version" "$local_version")

if [ "$compare_result" == "gt" ]; then
    # 本地版本落後，進行更新
    wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/${POSH}
    sudo chmod +x /home/cloverdefa/${POSH}
    sudo mv /home/cloverdefa/${POSH} /usr/local/bin/oh-my-posh
    echo -e "${GREEN}Oh My Posh更新完成${NC}"
    echo -e "${YELLOW}更新後的版本版本${NC}"
    oh-my-posh --version
else
    echo -e "${GREEN}本地版本已经是最新的，無須更新${NC}"
fi

exit 0