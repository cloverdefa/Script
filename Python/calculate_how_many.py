#!/usr/bin/env python3
# Module Name: calculate_optimal_combination

"""
模組功能說明:
此模組用於計算白鐵管材料的最佳利用方式，
根據輸入的材料長度 (D)，
找出⌀63x100 (A)、⌀63x125 (B) 和 ⌀63x150 (C) 的數量組合，
使得總長度最接近或等於但不超過材料總長度(D)。
"""

# 設定各種類長度 (單位：毫米)
A_LENGTH = 147  # ⌀63x100的長度
B_LENGTH = 172  # ⌀63x125的長度
C_LENGTH = 197  # ⌀63x150的長度
LENGTH_UNIT = "mm"


def calculate_optimal_combination(
    d_length, calculate_a=True, calculate_b=True, calculate_c=True
):
    """
    計算最佳的⌀63x100、⌀63x125和⌀63x150的數量組合，使總長度不超過指定的材料長度D。

    參數:
        d_length (int): 白鐵管材料總長度
        calculate_a (bool): 是否計算⌀63x100的數量
        calculate_b (bool): 是否計算⌀63x125的數量
        calculate_c (bool): 是否計算⌀63x150的數量

    回傳:
        dict: 包含⌀63x100、⌀63x125、⌀63x150的最佳數量和總長度的字典
    """

    # 檢查長度是否足夠進行計算
    if calculate_a and d_length < A_LENGTH:
        return {"error": "材料長度不足以計算⌀63x100的數量。"}
    if calculate_b and d_length < B_LENGTH:
        return {"error": "材料長度不足以計算⌀63x125的數量。"}
    if calculate_c and d_length < C_LENGTH:
        return {"error": "材料長度不足以計算⌀63x150的數量。"}

    # 初始化變數以儲存最佳解
    best_x = 0  # 最佳⌀63x100數量
    best_y = 0  # 最佳⌀63x125數量
    best_z = 0  # 最佳⌀63x150數量
    best_total_length = 0  # 最佳總長度

    # 使用三層迴圈計算各種類的數量組合
    for x in range(d_length // A_LENGTH + 1):
        for y in range(d_length // B_LENGTH + 1):
            for z in range(d_length // C_LENGTH + 1):
                current_total_length = 0  # 計算當前組合的總長度

                # 根據是否選擇計算來累加總長度
                if calculate_a:
                    current_total_length += A_LENGTH * x
                if calculate_b:
                    current_total_length += B_LENGTH * y
                if calculate_c:
                    current_total_length += C_LENGTH * z

                # 更新最佳解 (即總長度最接近但不超過D)
                if best_total_length < current_total_length <= d_length:
                    best_total_length = current_total_length
                    best_x = x
                    best_y = y
                    best_z = z

    # 回傳結果
    return {
        "⌀63x100": best_x,
        "⌀63x125": best_y,
        "⌀63x150": best_z,
        "total_length": best_total_length,
    }


def should_calculate(prompt):
    """
    判斷使用者是否選擇計算某一類的數量。

    參數:
        prompt (str): 要顯示給使用者的提示訊息

    回傳:
        bool: 使用者是否選擇計算該類的數量
    """
    return input(prompt).strip().lower() in ["y", "yes"]


def main():
    """
    測試用主函式，允許使用者輸入參數並輸出最佳結果。
    """
    try:
        while True:
            try:
                d_length = int(input(f"請輸入白鐵管材料長度(單位:{LENGTH_UNIT}): "))
                if d_length <= 0:
                    raise ValueError("長度必須為正整數。")
                if d_length < 147:
                    raise ValueError("長度必須至少為 147 mm。")
                break
            except ValueError as e:
                print(f"輸入錯誤: {e}")

        calculate_a = should_calculate("是否計算⌀63x100的數量 (Yes/No): ")
        calculate_b = should_calculate("是否計算⌀63x125的數量 (Yes/No): ")
        calculate_c = should_calculate("是否計算⌀63x150的數量 (Yes/No): ")

        # 呼叫計算函式並輸出結果
        result = calculate_optimal_combination(
            d_length, calculate_a, calculate_b, calculate_c
        )

        # 檢查是否有錯誤訊息
        if "error" in result:
            print(result["error"])
        else:
            output_strings = []
            if calculate_a:
                output_strings.append(f"⌀63x100的數量: {result['⌀63x100']}")
            if calculate_b:
                output_strings.append(f"⌀63x125的數量: {result['⌀63x125']}")
            if calculate_c:
                output_strings.append(f"⌀63x150的數量: {result['⌀63x150']}")
            output_strings.append(
                f"加工材料使用總長度(單位:{LENGTH_UNIT}): {result['total_length']}"
            )
            print("\n".join(output_strings))

    except KeyboardInterrupt:
        print("\n程式已被中斷，感謝使用，再見！")


# 當作為主程式執行時，運行main()函式
if __name__ == "__main__":
    main()
