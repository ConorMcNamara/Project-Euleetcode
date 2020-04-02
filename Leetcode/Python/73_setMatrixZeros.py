class Solution:
    def setZeroes(self, matrix: List[List[int]]) -> None:
        """
        Do not return anything, modify matrix in-place instead.
        """
        ncol = len(matrix[0])
        zero_col = []
        for index, row in enumerate(matrix):
            if 0 in row:
                zero_col = zero_col + [i for i, x in enumerate(row) if x == 0]
                row[:] = [0] * ncol

        for row in matrix:
            for col in set(zero_col):
                row[col] = 0
