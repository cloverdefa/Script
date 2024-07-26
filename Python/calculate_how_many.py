#!/usr/bin/env python3

# 設定各種類長度
A_length = 147  # 63x100
B_length = 172  # 63x125
C_length = 197  # 63x150

# 允許使用者輸入D種類長度
D_length = int(input("請輸入白鐵管材料長度: "))

# 允許使用者選擇計算的種類
calculate_A = input("是否計算63x100的數量 (y/n): ").strip().lower() == "y"
calculate_B = input("是否計算63x125的數量 (y/n): ").strip().lower() == "y"
calculate_C = input("是否計算63x150的數量 (y/n): ").strip().lower() == "y"

# 初始化變數以儲存最佳解
best_x = 0
best_y = 0
best_z = 0
best_total_length = 0

# 進行計算
for x in range(D_length // A_length + 1):
    for y in range(D_length // B_length + 1):
        for z in range(D_length // C_length + 1):
            total_length = 0
            if calculate_A:
                total_length += A_length * x
            if calculate_B:
                total_length += B_length * y
            if calculate_C:
                total_length += C_length * z
            if total_length <= D_length and total_length > best_total_length:
                best_total_length = total_length
                best_x = x
                best_y = y
                best_z = z

# 輸出結果
if calculate_A:
    print(f"63x100的數量: {best_x}")
if calculate_B:
    print(f"63x125的數量: {best_y}")
if calculate_C:
    print(f"63x150的數量: {best_z}")
print(f"總長度: {best_total_length}")
