def is_same_stripes(matrix):
    matrix_len = len(matrix)
    row_len = len(matrix[0])
    for ii in range(1, matrix_len):
        for jj in range(1, row_len):
            if matrix[ii][jj] != matrix[ii - 1][jj - 1]:
                return False
    return True
