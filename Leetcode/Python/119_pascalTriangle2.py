class Solution:
    def getRow(self, rowIndex: int) -> List[int]:
        triangle = [[1] * (i+1) for i in range(rowIndex+1)]
        for row in range(2, len(triangle)):
            for point in range(1, len(triangle[row]) - 1):
                triangle[row][point] = triangle[row-1][point-1] + triangle[row-1][point]
        return triangle[rowIndex]