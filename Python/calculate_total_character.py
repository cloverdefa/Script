#!/usr/bin/env python3
# Module Name: calcu

"""
根據用戶輸入的字元
計算用戶一共輸入了多少字元
以此來計算是否超過閾值.
"""
# Given path string
path_string = input("請輸入需要計算長度字元: ")

# Calculate the total number of characters in the path string
num_characters = len(path_string)
print(f"計算後字元總長度為: {num_characters}")
