from math import ceil, log10, sqrt
from functools import reduce


def problem_21(num=10000):
    """
    Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
    If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.

    For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110;
    therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

    Evaluate the sum of all the amicable numbers under num.

    Parameters
    ----------
    num: int, default is 100000
        The maximum value we can reach for our amicable numbers

    Returns
    -------
    The sum of all amicable numbers
    """
    def _find_factors(num):
        step = 2 if num % 2 else 1
        x = set(reduce(list.__add__, ([i, num//i] for i in range(1, int(sqrt(num))+1, step) if num % i == 0)))
        x.remove(num)
        return x
    nums = set()
    for i in range(4, num):
        sum_factor = sum(_find_factors(i))
        reverse_factor = sum(_find_factors(sum_factor))
        if reverse_factor == i and sum_factor != i:
            nums.add(sum_factor)
    return sum(nums)


def problem_25(digit_len=1000, how='binet'):
    """
    The Fibonacci sequence is defined by the recurrence relation:
    Fn = Fn−1 + Fn−2, where F1 = 1 and F2 = 1.
    Hence the first 12 terms will be:

    F1 = 1
    F2 = 1
    F3 = 2
    F4 = 3
    F5 = 5
    F6 = 8
    F7 = 13
    F8 = 21
    F9 = 34
    F10 = 55
    F11 = 89
    F12 = 144
    The 12th term, F12, is the first term to contain three digits.

    What is the index of the first term in the Fibonacci sequence to contain digit_len digits?

    Parameters
    ----------
    digit_len: int, default is 1000
        The number of digits we wish to find

    Returns
    -------
    The first index to contain digit_len.
    """
    if how.casefold() == 'binet':
        if digit_len < 2:
            return 1
        psi = (1 + 5 ** 0.5) / 2
        return ceil((digit_len + log10(5) / 2 - 1) / log10(psi))
    else:
        a, b = 1, 1
        index = 2
        digit_denom = pow(10, (digit_len - 1))
        while True:
            a, b = b, a + b
            if a // digit_denom != 0:
                return index
            index += 1