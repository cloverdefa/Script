#!/bin/zsh

# 定義顏色代碼
RED='\033[0;31m'    # 紅色
GREEN='\033[0;32m'  # 綠色
YELLOW='\033[0;33m' # 黃色
NC='\033[0m'        # 重置顏色

# 檢查 .repositories.list 檔案是否存在
repositories_list="$HOME/.config/list/.repositories.list"
if [[ ! -f "$repositories_list" ]]; then
  echo "${RED}錯誤：檔案 $repositories_list 不存在。請確保檔案存在並重新執行腳本。${NC}"
  exit 1
fi

# 檢查本地 GitHub 根目錄是否存在，若不存在則跳過並通知
github_root="$HOME/Documents/github"
if [[ ! -d "$github_root" ]]; then
  echo "${YELLOW}警告：本地 GitHub 根目錄不存在，路徑：$github_root${NC}"
  exit 0
fi

# 從 .repositories.list 檔案中讀取儲存庫名稱列表，並過濾掉空白以及注釋行
repos=($(grep -E -v '^\s*(#|$)' "$repositories_list"))

# 添加 dotfiles 和 fzf-git 儲存庫
repos+=(".dotfiles" ".fzf-git.sh")

# 使用函數來執行操作更新
function Git-Pull-Repo {
  local repo_name="$1"
  local repo_path="$github_root/$repo_name" # 使用 $HOME/Documents/github 根目錄
  if [[ "$repo_name" = ".dotfiles" ]]; then
    repo_path="${HOME}/.dotfiles" # 對於 dotfiles 儲存庫，路徑是 $HOME/.dotfiles
  elif [[ "$repo_name" = ".fzf-git.sh" ]]; then
    repo_path="${HOME}/.fzf-git.sh"  # 對於 fzf-git 儲存庫，路徑是 $HOME/.fzf-git
  fi
  local text="$repo_name 拉取遠端資料"

  # 檢查目錄是否存在，若不存在則跳過
  if [[ ! -d "$repo_path" ]]; then
    echo "${YELLOW}目錄不存在，跳過儲存庫：$repo_name${NC}"
    echo "----------------------------------------------------------------------"
    return
  fi

  cd "$repo_path" || { echo "${RED}錯誤：無法切換到目錄 $repo_path ${NC}"; return 1; } # 切換到存儲庫目錄如果切換失敗，返回結束碼1
  echo "${GREEN}儲存庫名稱 $repo_name ${NC}"

  # 切換到主分支
  if git checkout main; then
    echo "${GREEN}已成功切換到主分支${NC}"
  else
    echo "${RED}錯誤：切換到主分支時出現錯誤 $repo_path ${NC}"
    return 1 # 如果切換失敗，返回結束碼1
  fi

  if git remote update -p && git status -uno | grep -q '您的分支落後'; then
    if git pull --rebase; then
      echo "$text 完成，儲存庫名稱：${YELLOW}$repo_name ${NC}"
    else
      echo "$text ${RED}更新出現錯誤，儲存庫名稱：$repo_name ${NC}"
    fi
  else
    echo "GitHub 遠端資料庫無變更或本地資料不需要更新，儲存庫名稱：${YELLOW} $repo_name ${NC}"
  fi

  echo "----------------------------------------------------------------------"
}

for repo in "${repos[@]}"; do
  Git-Pull-Repo "$repo"
done

# 完成
exit 0

