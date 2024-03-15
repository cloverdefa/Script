#! /usr/bin/env bash

# 遠程設備的SSH設定
SSH_HOST="switch-core"  # 設定SSH主機名稱或IP地址
SSH_USER="cloverdefa"  # 設定SSH用戶名
SSH_KEY="$HOME/.ssh/id_rsa"  # 私鑰文件的路徑

# 設置命令
CONFIG_COMMANDS=(
    "telnet localhost"  # 進入telnet模式
    "enable"  # 啟用特權模式
    "configure"  # 進入配置模式
    "interface 0/1"  # 進入0/1介面配置模式
    "poe opmode shutdown"  # 設置PoE操作模式為關閉
    "poe opmode auto"  # 再次設置PoE操作模式為自動
    "exit"  # 退出介面配置模式
    "exit"  # 退出配置模式
    "exit"  # 退出特權模式
    "exit"  # 退出telnet
    "exit"  # 退出SSH會話
)

# 使用SSH金鑰認證連接和配置遠程設備
ssh -i "$SSH_KEY" "$SSH_USER"@"$SSH_HOST" << EOF
    for cmd in "${CONFIG_COMMANDS[@]}"; do
        echo "$cmd"
        sleep 1
        $cmd
        if [ $? -ne 0 ]; then
            echo "命令 '$cmd' 執行失敗。"
            exit 1
        fi
    done
    exit
EOF

# 檢查SSH連接的退出狀態
if [ $? -ne 0 ]; then
    echo "無法建立SSH連接。"
    exit 1
fi