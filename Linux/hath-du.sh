#!/usr/bin/env bash

# 目標機器的 hostname
HOST="node01"

# SSH連線並執行指令
ssh "$HOST" "du -sh ~/hath"

# 回饋畫面顯示
echo "指令執行完成"
