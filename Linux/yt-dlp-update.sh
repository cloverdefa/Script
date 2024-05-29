#!/bin/bash

# 設定變數
BIN_DIR="$HOME/bin"
YTDLP_LINUX="$BIN_DIR/yt-dlp_linux"
YTDLP_LINUX_AARCH64="$BIN_DIR/yt-dlp_linux_aarch64"
RELEASE_URL="https://github.com/yt-dlp/yt-dlp/releases/latest"

# 檢查 yt-dlp 版本
check_version() {
	local file=$1
	if [ -f "$file" ]; then
		"$file" --version
	else
		echo ""
	fi
}

# 取得遠端最新版本號
get_latest_version() {
	curl -sL "$RELEASE_URL" | grep -oP 'yt-dlp/releases/tag/\K[0-9]+\.[0-9]+\.[0-9]+' | head -n 1
}

# 下載最新版本
download_latest_version() {
	local arch=$1
	local latest_version=$2
	local download_url="https://github.com/yt-dlp/yt-dlp/releases/download/${latest_version}/yt-dlp_${arch}"
	local dest="$BIN_DIR/yt-dlp_${arch}"
	curl -L -o "$dest" "$download_url"
	chmod +x "$dest"
}

# 主邏輯
if [ -f "$YTDLP_LINUX" ]; then
	local_version=$(check_version "$YTDLP_LINUX")
	arch="linux"
elif [ -f "$YTDLP_LINUX_AARCH64" ]; then
	local_version=$(check_version "$YTDLP_LINUX_AARCH64")
	arch="linux_aarch64"
else
	echo "未找到 yt-dlp_linux 或 yt-dlp_linux_aarch64"
	exit 1
fi

latest_version=$(get_latest_version)

if [ -z "$local_version" ]; then
	echo "本地版本無法檢測"
	exit 1
fi

if [ -z "$latest_version" ]; then
	echo "無法獲取遠端最新版本"
	exit 1
fi

echo "本地版本: $local_version"
echo "遠端最新版本: $latest_version"

if [ "$latest_version" != "$local_version" ]; then
	echo "有新版本，是否下載更新？ (Y/N)"
	read -r response
	if [[ "$response" =~ ^[Yy]$ ]]; then
		echo "開始下載..."
		download_latest_version "$arch" "$latest_version"
		echo "下載完成並更新 yt-dlp 至最新版本"
	else
		echo "取消更新"
	fi
else
	echo "已是最新版本，無需更新"
fi
