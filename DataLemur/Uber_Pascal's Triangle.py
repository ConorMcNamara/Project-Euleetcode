def generate(numRows):
    if numRows == 1:
        triangle = [[1]]
    elif numRows == 2:
        triangle = [[1], [1, 1]]
    else:
        triangle = [[1], [1, 1]]
        for i in range(2, numRows):
            prior_row = triangle[i - 1]
            sum_list = []
            for j in range(1, i):
                sums = prior_row[j] + prior_row[j - 1]
                sum_list.append(sums)
            triangle_row = [1] + sum_list + [1]
            triangle.append(triangle_row)
    return triangle