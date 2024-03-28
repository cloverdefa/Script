#!/usr/bin/env bash

# 檢查檔案是否存在
if [ -f ~/.config/list/.unifi.list ]; then
    # 讀取檔案內容並存儲到陣列中
    mapfile -t hosts < ~/.config/list/.unifi.list

    # 遍歷目標機器清單
    for host in "${hosts[@]}"; do
        # 去除行尾的換行符
        host=$(echo "$host" | tr -d '\n')
        echo "連接到 $host..."
        # 連接到目標機器，並執行 mca-cli-op info 指令，將結果保存到變數 feedback 中
        feedback=$(ssh "$host" 'mca-cli-op info')
        # 顯示目標機器的回饋信息
        echo "來自 $host 的回饋:"
        echo "$feedback"
        echo "---------------------------------------------"

        # 檢查回饋訊息是否包含 https://unifi:8080/inform，如果是，則提醒
        if [[ "$feedback" =~ "https://unifi:8080/inform" ]]; then
            echo "⚠️ 注意：連接機器 $host 需要重新設定連接 Unifi 控制器 inform"
            echo "---------------------------------------------"
        fi
    done
else
    echo "錯誤: 檔案 ~/.config/list/.unifi.list 不存在"
fi
