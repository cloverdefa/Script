#!/usr/bin/env python3

"""
程式功能說明:
本程式用於計算白鐵管材料的最佳利用方式，
根據使用者輸入的材料長度 (D)，
找出63x100 (A)、63x125 (B) 和 63x150 (C) 的數量組合，
使得總長度最接近但不超過材料總長度(D)。
"""

# 設定各種類長度
A_LENGTH = 147  # 63x100
B_LENGTH = 172  # 63x125
C_LENGTH = 197  # 63x150

# 允許使用者輸入材料總長度 D
D_length = int(input("請輸入白鐵管材料長度: "))

# 允許使用者選擇計算的種類
calculate_A = input("是否計算63x100的數量 (y/n): ").strip().lower() == "y"
calculate_B = input("是否計算63x125的數量 (y/n): ").strip().lower() == "y"
calculate_C = input("是否計算63x150的數量 (y/n): ").strip().lower() == "y"

# 初始化變數以儲存最佳解
BEST_X = 0
BEST_Y = 0
BEST_Z = 0
BEST_TOTAL_LENGTH = 0

# 進行計算
for x in range(D_length // A_LENGTH + 1):
    for y in range(D_length // B_LENGTH + 1):
        for z in range(D_length // C_LENGTH + 1):
            TOTAL_LENGTH = 0
            if calculate_A:
                TOTAL_LENGTH += A_LENGTH * x
            if calculate_B:
                TOTAL_LENGTH += B_LENGTH * y
            if calculate_C:
                TOTAL_LENGTH += C_LENGTH * z
            if TOTAL_LENGTH <= D_length and TOTAL_LENGTH > BEST_TOTAL_LENGTH:
                BEST_TOTAL_LENGTH = TOTAL_LENGTH
                BEST_X = x
                BEST_Y = y
                BEST_Z = z

# 輸出結果
if calculate_A:
    print(f"63x100的數量: {BEST_X}")
if calculate_B:
    print(f"63x125的數量: {BEST_Y}")
if calculate_C:
    print(f"63x150的數量: {BEST_Z}")
print(f"總長度: {BEST_TOTAL_LENGTH}")
