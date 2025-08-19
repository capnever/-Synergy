A = [3, -2, 5, -7, 8, -1, 4]

max_idx = A.index(max(A))
min_idx = A.index(min(A))
start = min(max_idx, min_idx) + 1
end = max(max_idx, min_idx)
negative_sum = sum(x for x in A[start:end] if x < 0)

print("Массив:", A)
print("Сумма отрицательных элементов между максимумом и минимумом:", negative_sum)