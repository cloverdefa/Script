#!/usr/bin/env bash

# 定義顏色代碼
RED=$'\033[0;31m'    # 紅色
GREEN=$'\033[0;32m'  # 綠色
YELLOW=$'\033[0;33m' # 黃色
NC=$'\033[0m'        # 重置顏色

# 定義 Oh My Posh 系統平台
POSH="posh-linux-amd64"

# 定義版本比較函數
version_compare() {
	# 刪除版本前的 'v' 字元
	local version1="${1//v/}"
	local version2="${2//v/}"

	# 使用 awk 進行版本比較
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

# 檢查是否成功獲取遠端版本
if [ -z "$remote_version" ]; then
	echo -e "${RED}讀取遠端版本失敗，請檢查網絡連接或GitHub API限制${NC}"
	exit 1
fi

# 獲取本地版本
local_version=$(oh-my-posh --version | cut -d' ' -f3)

# 進入用戶主目錄
cd "$HOME" || {
	echo "無法切換到主目錄"
	exit 1
}

# 檢查遠端版本是否更新
compare_result=$(version_compare "$remote_version" "$local_version")

if [ "$compare_result" = "gt" ]; then
	# 本地版本落後，進行更新
	wget "https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/${POSH}" -O "${POSH}"
	chmod +x "${POSH}"
	mv "${POSH}" ~/.local/bin/oh-my-posh
	echo -e "${GREEN}Oh My Posh 更新完成${NC}"
	echo -e "${YELLOW}更新前的版本: $local_version${NC}"
	echo -e "${YELLOW}更新後的版本: $(oh-my-posh --version)${NC}"
else
	echo -e "${GREEN}本地版本已經是最新的，無需更新${NC}"
fi

exit 0
