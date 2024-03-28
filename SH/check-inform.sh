#!/usr/bin/env bash

# 目標機器列表
hosts=(
    "uxg"
    "switch-core"
    "switch-weakcurrentbox"
    "ap-livingroom"
    "ap-workingroom"
    "ap-bedroom"
    "switch-office"
    "weifan1-switch-1f"
    "weifan1-switch-2f"
    "weifan1-ap-1f"
    "weifan1-ap-2f"
    "weifan2-uxg"
    "weifan2-switch-1f"
    "weifan2-switch-2f"
    "weifan2-ap-1f"
    "weifan2-ap-2f"
)

# 遍歷目標機器列表
for host in "${hosts[@]}"; do
    echo "連接到 $host..."
    # 連接到目標機器，並執行 info 指令，將結果保存到變數 feedback 中
    feedback=$(ssh "$host" 'info')
    # 顯示目標機器的回饋信息
    echo "來自 $host 的回饋:"
    echo "$feedback"
    echo "---------------------------------------------"
done
