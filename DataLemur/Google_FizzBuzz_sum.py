def fizz_buzz_sum(target):
    sum_list = []
    for i in range(3, target):
        if i % 3 == 0:
            sum_list.append(i)
        elif i % 5 == 0:
            sum_list.append(i)
        else:
            continue
    return sum(sum_list)
