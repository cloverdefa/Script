#!/usr/bin/env python3

"""
功能說明:
此 Python 腳本的功能是將當前目錄中的所有 .webp 檔案轉換為 .gif 格式，並將轉換後的 .gif 檔案移動到
一個名為 'converted_gifs' 的資料夾內。轉換成功後，會刪除原始的 .webp 檔案，最後顯示轉換過程中的統計
資訊，包括成功轉換的檔案數量、總檔案大小和花費的總時間。
"""

import os
import shutil
import subprocess
import sys
import time


def check_command(cmd):
    """檢查指定的指令是否存在於系統中"""
    return shutil.which(cmd) is not None


def ensure_tools():
    """確保所需的工具都已安裝"""
    if not check_command("webp2gif"):
        print("找不到 webp2gif 指令，請安裝後再試。")
        choice = input("是否自動安裝 webp2gif 工具？ (y/n): ").strip().lower()
        if choice == "y":
            print("請手動安裝 webp2gif，請參考官方指引安裝該工具。")
        sys.exit(1)

    # 檢查 ImageMagick 是否已安裝，並確保使用 magick 而非 convert
    if not check_command("magick"):
        print("找不到 ImageMagick 的 magick 指令，請安裝後再試。")
        choice = input("是否自動安裝 ImageMagick 工具？ (y/n): ").strip().lower()
        if choice == "y":
            print("請手動安裝 ImageMagick，請參考官方指引安裝該工具。")
        sys.exit(1)


def convert_webp_to_gif():
    """將當前目錄中的所有 .webp 檔案轉換為 .gif 並刪除原始檔案"""
    ensure_tools()  # 確保工具已安裝

    output_dir = "converted_gifs"  # 轉換後檔案的儲存目錄
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)

    # 收集目錄中所有 .webp 檔案
    webp_files = [f for f in os.listdir(".") if f.endswith(".webp")]

    if not webp_files:
        print("當下目錄沒有 .webp 檔案。")
        return

    start_time = time.time()  # 開始計時
    total_size = 0  # 總檔案大小
    converted_count = 0  # 成功轉換的檔案數量

    for webp_file in webp_files:
        gif_file = webp_file.replace(".webp", ".gif")
        try:
            # 使用 webp2gif 轉換 .webp 為 .gif
            subprocess.run(["webp2gif", webp_file, gif_file], check=True)
            total_size += os.path.getsize(gif_file)
            shutil.move(gif_file, os.path.join(output_dir, gif_file))
            os.remove(webp_file)
            converted_count += 1
        except subprocess.CalledProcessError:
            print(f"轉換失敗：{webp_file}")

    elapsed_time = time.time() - start_time

    # 顯示轉換結果
    print(f"\n轉換完成！共成功轉換了 {converted_count} 個檔案。")
    print(f"全部檔案總容量為 {total_size / (1024 * 1024):.2f} MB。")
    print(f"總耗時 {elapsed_time:.2f} 秒。")


if __name__ == "__main__":
    convert_webp_to_gif()
