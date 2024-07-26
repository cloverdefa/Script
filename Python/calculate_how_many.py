#!/usr/bin/env python3

# Define lengths of A and B
A_length = 147
B_length = 172

# Prompt the user to enter the length of C
C_length = int(input("請輸入白鐵管長度: "))

# Initialize variables to store the best solution
best_x = 0
best_y = 0
best_total_length = 0

# Loop to find the best combination of A and B
for x in range(C_length // A_length + 1):
    for y in range(C_length // B_length + 1):
        total_length = A_length * x + B_length * y
        if total_length <= C_length and total_length > best_total_length:
            best_total_length = total_length
            best_x = x
            best_y = y

# Output the result
print(f"63x100的數量: {best_x}, 63x125的數量: {best_y}, 總長度: {best_total_length}")
