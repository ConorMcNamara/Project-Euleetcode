def another_one(digits):
    digit = "".join(str(d) for d in digits)
    plus_one = int(digit) + 1
    return [int(x) for x in str(plus_one)]
