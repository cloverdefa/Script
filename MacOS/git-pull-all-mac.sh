#!/usr/bin/env zsh

# 定義顏色代碼
RED='\033[0;31m'    # 红色
GREEN='\033[0;32m'  # 绿色
YELLOW='\033[0;33m' # 黄色
NC='\033[0m'        # 重置颜色

# 檢查 .repositories.list 檔案是否存在
repositories_list="$HOME/.config/list/.repositories.list"
if [ ! -f "$repositories_list" ]; then
  echo -e "${RED}錯誤：檔案 $repositories_list 不存在。請確保檔案存在並重新執行腳本。${NC}"
  exit 1
fi

# 從 .repositories.list 檔案中讀取伺服器名稱列表，並過濾掉空白以及注釋行
repos=($(grep -E -v '^\s*(#|$)' "$repositories_list"))

# 添加 dotfiles 儲存庫
repos+=("dotfiles")

# 使用函數來執行操作更新
function Git-Pull-Repo {
  local repo_name="$1"
  local repo_path="$HOME/Documents/github/$repo_name" # 使用$HOME環境變數
  if [ "$repo_name" = "dotfiles" ]; then
    repo_path="$HOME/$repo_name" # 對於dotfiles儲存庫，路徑是$HOME/dotfiles
  fi
  local text="$repo_name 拉取遠端資料"

  cd "$repo_path" || { echo -e "${RED}錯誤：無法切換到目錄 $repo_path ${NC}"; exit 1; } # 切換到存儲庫目錄如果切換失敗，退出，並返回結束碼1
  echo -e "${GREEN}儲存庫名稱 $repo_name ${NC}"

  # 切換到主分支
  if git checkout main; then
    echo -e "${GREEN}已成功切換到主分支${NC}"
  else
    echo -e "${RED}錯誤：切換到主分支時出現錯誤 $repo_path ${NC}"
    exit 1 # 如果切換失敗，退出，並返回結束碼1
  fi

  if git remote update -p && git status -uno | grep -q '您的分支落後'; then
    if git pull; then
      echo -e "$text 完成，存儲庫名稱：${YELLOW}$repo_name ${NC}"
    else
      echo -e "$text ${RED}更新出現錯誤，存儲庫名稱：$repo_name ${NC}"
    fi
  else
    echo -e "GitHub 遠端資料庫無變更或本地資料不需要更新，存儲庫名稱：${YELLOW} $repo_name ${NC}"
  fi

  echo "----------------------------------------------------------------------"
}

for repo in "${repos[@]}"; do
  Git-Pull-Repo "$repo"
done

# 完成
exit 0

