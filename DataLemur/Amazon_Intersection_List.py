def intersection(a, b):
    len_a = len(a)
    len_b = len(b)
    intersection_list = []
    if len_a <= len_b:
        for val in a:
            if val in b:
                intersection_list.append(val)
    else:
        for val in b:
            if val in a:
                intersection_list.append(val)
    return intersection_list