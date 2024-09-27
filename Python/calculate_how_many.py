#!/usr/bin/env python3

"""
模組功能說明:
此模組用於計算白鐵管材料的最佳利用方式，
根據輸入的材料長度 (D)，
找出63x100 (A)、63x125 (B) 和 63x150 (C) 的數量組合，
使得總長度最接近或等於但不超過材料總長度(D)。
"""

# 設定各種類長度 (單位：毫米)
A_LENGTH = 147  # 63x100的長度
B_LENGTH = 172  # 63x125的長度
C_LENGTH = 197  # 63x150的長度


def calculate_optimal_combination(
    D_LENGTH, calculate_A=True, calculate_B=True, calculate_C=True
):
    """
    計算最佳的63x100、63x125和63x150的數量組合，使總長度不超過指定的材料長度D。

    參數:
        D_LENGTH (int): 白鐵管材料總長度
        calculate_A (bool): 是否計算63x100的數量
        calculate_B (bool): 是否計算63x125的數量
        calculate_C (bool): 是否計算63x150的數量

    回傳:
        dict: 包含63x100、63x125、63x150的最佳數量和總長度的字典
    """

    # 初始化變數以儲存最佳解
    best_x = 0  # 最佳63x100數量
    best_y = 0  # 最佳63x125數量
    best_z = 0  # 最佳63x150數量
    best_total_length = 0  # 最佳總長度

    # 使用三層迴圈計算各種類的數量組合
    for x in range(D_LENGTH // A_LENGTH + 1):
        for y in range(D_LENGTH // B_LENGTH + 1):
            for z in range(D_LENGTH // C_LENGTH + 1):
                current_total_length = 0  # 計算當前組合的總長度

                # 根據是否選擇計算來累加總長度
                if calculate_A:
                    current_total_length += A_LENGTH * x
                if calculate_B:
                    current_total_length += B_LENGTH * y
                if calculate_C:
                    current_total_length += C_LENGTH * z

                # 更新最佳解 (即總長度最接近但不超過D)
                if (
                    current_total_length <= D_LENGTH
                    and current_total_length > best_total_length
                ):
                    best_total_length = current_total_length
                    best_x = x
                    best_y = y
                    best_z = z

    # 回傳結果
    return {
        "63x100": best_x,
        "63x125": best_y,
        "63x150": best_z,
        "total_length": best_total_length,
    }


def main():
    """
    測試用主函式，允許使用者輸入參數並輸出最佳結果。
    """
    # 允許使用者輸入白鐵管材料的長度
    D_LENGTH = int(input("請輸入白鐵管材料長度: "))

    # 允許使用者選擇是否計算每種類的數量
    calculate_A = input("是否計算63x100的數量 (y/n): ").strip().lower() == "y"
    calculate_B = input("是否計算63x125的數量 (y/n): ").strip().lower() == "y"
    calculate_C = input("是否計算63x150的數量 (y/n): ").strip().lower() == "y"

    # 呼叫計算函式並輸出結果
    result = calculate_optimal_combination(
        D_LENGTH, calculate_A, calculate_B, calculate_C
    )

    if calculate_A:
        print(f"63x100的數量: {result['63x100']}")
    if calculate_B:
        print(f"63x125的數量: {result['63x125']}")
    if calculate_C:
        print(f"63x150的數量: {result['63x150']}")
    print(f"總長度: {result['total_length']}")


# 當作為主程式執行時，運行main()函式
if __name__ == "__main__":
    main()
