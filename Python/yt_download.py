#!/usr/bin/env python3
"""
此腳本用於下載影片，使用 yt-dlp 工具進行操作。
用戶可以指定影片格式進行下載，並將影片保存至程式當下目錄下。
"""

import os
import subprocess
import sys


def main():
    """
    主函數用於處理用戶輸入的影片 URL 並使用 yt-dlp 工具下載影片。
    函數首先確認應用程序是否運行在打包環境中，根據情況設置基本路徑。
    接著，提示用戶輸入一個影片的 URL 網址。
    若輸入有效，則使用 yt-dlp 執行下載操作，並捕獲可能發生的錯誤，以便提供適當的錯誤訊息。
    如果在下載過程中遇到任何錯誤（如 subprocess 的呼叫錯誤或操作系統錯誤），
    將會打印相應的錯誤訊息。
    """
    if getattr(sys, "frozen", False):
        base_path = getattr(sys, "_MEIPASS", os.path.dirname(os.path.abspath(__file__)))
    else:
        base_path = os.path.dirname(os.path.abspath(__file__))

    yt_dlp_path = os.path.join(base_path, "yt-dlp")
    ffmpeg_path = os.path.join(base_path, "ffmpeg")

    os.environ["PATH"] += os.pathsep + os.path.dirname(ffmpeg_path)

    video_url = input("請輸入影片 URL 網址：")
    if not video_url:
        print("錯誤：影片 URL 不能為空")
        input("請按任意鍵退出...")
        return

    print("正在獲取可用的影片格式...")
    list_command = [yt_dlp_path, "-F", video_url]
    try:
        subprocess.run(list_command, check=True)
    except subprocess.CalledProcessError:
        print("獲取影片格式失敗，請檢查影片 URL 是否正確")
        input("請按任意鍵退出...")
        return

    format_code = input(
        "請輸入希望下載的影片格式代碼（直接按 Enter 選擇畫質最高的 MP4）："
    )
    if format_code.strip() == "":
        format_code = "bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4"

    try:
        command = [
            yt_dlp_path,
            "-f",
            format_code,
            "--merge-output-format",
            "mp4",
            video_url,
        ]
        subprocess.run(command, check=True)
        print("影片下載成功")
    except subprocess.CalledProcessError:
        print("下載過程中發生錯誤")
        input("請按任意鍵退出...")
    except OSError as e:
        print(f"操作系統錯誤：{e}")
        input("請按任意鍵退出...")

    input("下載完成，請按任意鍵退出...")


if __name__ == "__main__":
    main()
