def rotating_factorial(n):
    for i, val in enumerate(range(n, 0, -1)):
        if i == 0:
            count = val
        elif i == 1:
            count *= val
        elif i == 2:
            count = count // val
        elif i % 4 == 3:
            count += val
        elif i % 4 == 0:
            if val - 2 > 0:
                count -= (val * (val - 1)) // (val - 2)
            else:
                count -= (val) * (val - 1)
        else:
            continue
    return count
