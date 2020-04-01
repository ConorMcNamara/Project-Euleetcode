class Solution:
    def generate(self, numRows: int) -> List[List[int]]:
        triangle = [[1] * (i+1) for i in range(numRows)]
        for row in range(2, len(triangle)):
            for point in range(1, len(triangle[row]) - 1):
                triangle[row][point] = triangle[row-1][point-1] + triangle[row-1][point]
        return triangle