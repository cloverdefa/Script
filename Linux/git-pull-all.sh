#!/usr/bin/env bash

# 定義顏色代碼
RED='\033[0;31m'    # 紅色
GREEN='\033[0;32m'  # 綠色
YELLOW='\033[0;33m' # 黃色
NC='\033[0m'        # 重置顏色

# 檢查 .repositories.list 檔案是否存在
repositories_list="$HOME/.config/list/.repositories.list"
if [ ! -f "$repositories_list" ]; then
  echo -e "${RED}錯誤：檔案 $repositories_list 不存在。請確保檔案存在並重新執行腳本。${NC}"
  exit 1
fi

# 檢查本地 Git 根目錄是否存在，若不存在則跳過並通知
github_root="$HOME/github"
if [ ! -d "$github_root" ]; then
  echo -e "${YELLOW}警告：本地 Git 根目錄不存在，路徑：$github_root${NC}"
  exit 0
fi

# 從 .repositories.list 檔案中讀取儲存庫名稱列表，並過濾掉空白行和註解行
mapfile -t repos < <(grep -E -v '^\s*(#|$)' "$repositories_list")

# 添加 dotfiles、fzf-git.sh 和 fzf 儲存庫
repos+=(".dotfiles" ".fzf-git.sh" ".fzf")

# 函數來執行 Git 操作
function git_pull_repo() {
  local repo_name="$1"
  local repo_path="$github_root/$repo_name" # 使用 $HOME/github 根目錄
  if [ "$repo_name" == ".dotfiles" ]; then
    repo_path="$HOME/$repo_name" # 對於 dotfiles 儲存庫，路徑是 $HOME/.dotfiles
  fi
  local text="$repo_name 拉取遠端資料"

  # 檢查目錄是否存在，若不存在則跳過
  if [ ! -d "$repo_path" ]; then
    echo -e "${YELLOW}目錄不存在，跳過儲存庫：$repo_name${NC}"
    echo "----------------------------------------------------------------------"
    return
  fi

  cd "$repo_path" || return 1 # 切換到儲存庫目錄，如果切換失敗，返回結束碼1
  echo -e "${GREEN}檢查儲存庫 $repo_name ${NC}"

  # 切換到主分支
  if git checkout main; then
    echo -e "${GREEN}已成功切換到主分支${NC}"
  else
    echo -e "${RED}錯誤：切換到主分支時出現錯誤 $repo_path ${NC}"
    return 1 # 如果切換失敗，返回結束碼1
  fi

  if git remote update -p; then
    local behind_commits=$(git rev-list --count --left-only @{upstream}...HEAD)
    if [ "$behind_commits" -gt 0 ]; then
      if git pull --rebase; then
        echo -e "$text 完成，儲存庫名稱：${YELLOW}$repo_name ${NC}"
      else
        echo -e "$text ${RED}出現錯誤，儲存庫名稱：$repo_name ${NC}"
      fi
    else
      echo -e "Git 遠端資料庫無變更或本地資料不需要更新，儲存庫名稱：${YELLOW} $repo_name ${NC}"
    fi
  else
    echo -e "${RED}錯誤：更新遠端失敗 $repo_path ${NC}"
    return 1
  fi

  echo "----------------------------------------------------------------------"
}

for repo in "${repos[@]}"; do
  git_pull_repo "$repo"
done

# 完成
exit 0
