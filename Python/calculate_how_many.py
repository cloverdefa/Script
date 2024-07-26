#!/usr/bin/env python3

"""
程式功能說明:
本程式用於計算白鐵管材料的最佳利用方式，
根據使用者輸入的材料長度 (D)，
找出63x100 (A)、63x125 (B) 和 63x150 (C) 的數量組合，
使得總長度最接近或等於但不超過材料總長度(D)。
"""

# 設定各種類長度 (單位：毫米)
A_LENGTH = 147  # 63x100的長度
B_LENGTH = 172  # 63x125的長度
C_LENGTH = 197  # 63x150的長度

# 允許使用者輸入白鐵管材料的長度 (D)
D_LENGTH = int(input("請輸入白鐵管材料長度: "))

# 允許使用者選擇是否計算每種類的數量
calculate_A = input("是否計算63x100的數量 (y/n): ").strip().lower() == "y"
calculate_B = input("是否計算63x125的數量 (y/n): ").strip().lower() == "y"
calculate_C = input("是否計算63x150的數量 (y/n): ").strip().lower() == "y"

# 初始化變數以儲存最佳解
BEST_X = 0  # 最佳63x100數量
BEST_Y = 0  # 最佳63x125數量
BEST_Z = 0  # 最佳63x150數量
BEST_TOTAL_LENGTH = 0  # 最佳總長度

# 使用三層迴圈計算各種類的數量組合
for x in range(D_LENGTH // A_LENGTH + 1):
    for y in range(D_LENGTH // B_LENGTH + 1):
        for z in range(D_LENGTH // C_LENGTH + 1):
            CURRENT_TOTAL_LENGTH = 0  # 計算當前組合的總長度

            # 根據使用者是否選擇計算來累加總長度
            if calculate_A:
                CURRENT_TOTAL_LENGTH += A_LENGTH * x
            if calculate_B:
                CURRENT_TOTAL_LENGTH += B_LENGTH * y
            if calculate_C:
                CURRENT_TOTAL_LENGTH += C_LENGTH * z

            # 更新最佳解 (即總長度最接近但不超過D)
            if (
                CURRENT_TOTAL_LENGTH <= D_LENGTH
                and CURRENT_TOTAL_LENGTH > BEST_TOTAL_LENGTH
            ):
                BEST_TOTAL_LENGTH = CURRENT_TOTAL_LENGTH
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
