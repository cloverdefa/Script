#!/usr/bin/env zsh

# 加載 .zshrc 或 .zprofile
source ~/.zshrc

# 更新 Homebrew
if command -v brew &>/dev/null; then
  brew update
  outdated_packages=$(brew outdated)
  
  if [[ -n $outdated_packages ]]; then
    brew upgrade
    brew autoremove
    brew cleanup
  else
    echo "No Homebrew packages need upgrading."
  fi
fi

# 更新 Mac App Store 應用程式
if command -v mas &>/dev/null; then
  echo "==> Checking for Mac App Store updates..."
  outdated_apps=$(mas outdated)
  
  if [[ -n $outdated_apps ]]; then
    mas upgrade
  else
    echo "No Mac App Store apps need upgrading."
  fi
fi

# Zinit update
if command -v zinit &>/dev/null; then
  zinit update
fi

# 同步 $HOME/.fzf-git.sh
fzf_git_script="$HOME/.fzf-git.sh"
fzf_git_dir="$HOME/.fzf-git.sh/.git"
if [[ -d $fzf_git_script && -d $fzf_git_dir ]]; then
  echo "==> Pulling latest changes for $fzf_git_script..."
  (cd $fzf_git_script && git pull origin main)
  echo "Updated $fzf_git_script."
else
  echo "$fzf_git_script is not a Git repository or does not exist. Skipping update."
fi

# Update pip
if command -v pip &>/dev/null; then
  pip install --upgrade debugpy hererocks pip pynvim
else
  echo "pip未安裝或正確設定,因此略過更新"
fi

# Nvim Lazy Update
if command -v nvim &>/dev/null; then
  nvim --headless "+Lazy! update" +qa
else
  echo "Nvim未安裝或正確設定,因此略過更新"
fi

