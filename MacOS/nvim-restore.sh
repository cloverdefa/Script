#!/usr/bin/env zsh

sudo rm -r ~/.config/nvim
sudo rm -r ~/.local/share/nvim
sudo rm -r ~/.local/state/nvim
sudo rm -r ~/.cache/nvim

gh repo clone nvim ~/.config/nvim

exit 0
