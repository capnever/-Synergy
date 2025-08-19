def sum_negative_between_max_min(arr):
    if not arr:
        return 0

    max_index = arr.index(max(arr))
    min_index = arr.index(min(arr))

    start_index = min(max_index, min_index) + 1
    end_index = max(max_index, min_index)

    sum_negatives = sum(x for x in arr[start_index:end_index] if x < 0)
    
    return sum_negatives

A = [5, -2, -1, -3, -10]
result = sum_negative_between_max_min(A)
print(f"Сумма отрицательных элементов между максимальным и минимальным: {result}")