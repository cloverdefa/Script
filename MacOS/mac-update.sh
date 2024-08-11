#!/usr/bin/env zsh

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

# 更新 Zinit 插件
if command -v zinit &>/dev/null; then
  zinit self-update
  zinit update --all
fi

# 更新 Mac App Store 應用程式
if command -v mas &>/dev/null; then
  outdated_apps=$(mas outdated)
  
  if [[ -n $outdated_apps ]]; then
    mas upgrade
  else
    echo "No Mac App Store apps need upgrading."
  fi
fi
