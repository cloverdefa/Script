#!/bin/zsh

# 定義變數來存儲通知
notifications=""
unifi_notification=""

# 檢查檔案是否存在
if [[ -f "${HOME}/.config/list/.unifi.list" ]]; then
	# 讀取檔案內容並存儲到陣列中,同時刪除末尾的空白
  IFS=$'\n' hosts=($(grep -vE '^$|^#' ~/.config/list/.unifi.list))

	# 遍歷目標機器清單
	for host in "${hosts[@]}"; do
		echo "嘗試連接到 $host..."
		# 使用 SSH 連接到目標機器，並設置連接超時時間為10秒
		if ssh -o ConnectTimeout=10 "$host" 'mca-cli-op info' >/dev/null 2>&1; then
			echo "連接到 $host 成功"
			# SSH 命令成功完成，繼續處理回饋
			feedback=$(ssh "$host" 'mca-cli-op info')

			# 檢查回饋是否為空
			if [[ -z "$feedback" ]]; then
				notifications+="警告：來自 $host 的回饋為空\n"
				notifications+="---------------------------------------------\n"
				continue # 繼續處理下一個目標機器
			fi

			# 顯示目標機器的回饋信息
			notifications+="來自 $host 的回饋:\n"
			notifications+="$feedback\n"
			notifications+="---------------------------------------------\n"

			# 檢查回饋訊息是否包含 http://unifi:8080/inform，如果是，則提醒
			if [[ "$feedback" =~ "http://unifi:8080/inform" ]]; then
				unifi_notification+="⚠️ 注意：連接機器 $host 需要重新設定連接 Unifi 控制器 inform\n"
			fi
		else
			# SSH 命令執行失敗，顯示連接失敗訊息
			echo "連接到 $host 失敗"
			notifications+="連接失敗：無法連接到 $host\n"
			notifications+="---------------------------------------------\n"
			continue # 繼續處理下一個目標機器
		fi
	done

	# 先顯示其他通知，再顯示包含 http://unifi:8080/inform 的醒目通知
	echo -e "$notifications"
	if [[ -n "$unifi_notification" ]]; then
		echo -e "$unifi_notification"
	fi

else
	echo "錯誤: 檔案 ~/.config/list/.unifi.list 不存在"
fi
