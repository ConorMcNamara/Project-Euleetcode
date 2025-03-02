def weakest_strong_link(strength):
    for row, row_array in enumerate(strength):
        min_row = min(row_array)
        min_row_index = row_array.index(min_row)
        col = []
        for arr in strength:
            col.append(arr[min_row_index])
        max_col = max(col)
        if max_col == min_row:
            return max_col
    return -1
