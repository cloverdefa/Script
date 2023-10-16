#!/bin/bash

# 遠程設備的SSH設定
SSH_HOST="switch-core"
SSH_USER="cloverdefa"
SSH_KEY="~/.ssh/id_rsa"  # 私鑰文件的路徑

# 設置命令
CONFIG_COMMANDS=(
    "enable"
    "configure"
    "interface 0/1"
    "poe opmode shutdown"
    "poe opmode auto"
    "exit"
    "exit"
    "exit"
)

# 使用SSH金鑰認證連接和配置遠程設備
ssh -i "$SSH_KEY" "$SSH_USER"@"$SSH_HOST" << EOF
    for cmd in "\${CONFIG_COMMANDS[@]}"; do
        echo "\$cmd"
        sleep 1
    done
    exit
EOF

echo "Unifi Cloudkey Home 重新PoE送電啟動完成."
