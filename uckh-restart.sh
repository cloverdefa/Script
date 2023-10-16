#!/bin/bash

# 遠程設備的SSH設定
SSH_HOST="switch-core"
SSH_USER="your_username"
SSH_PASS="your_password"

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

# SSH連接和配置遠程設備
sshpass -p "$SSH_PASS" ssh "$SSH_USER"@"$SSH_HOST" << EOF
    for cmd in "\${CONFIG_COMMANDS[@]}"; do
        echo "\$cmd"
        sleep 1
    done
    exit
EOF

echo "Unifi Cloudkey Home 重新PoE送電啟動完成."
