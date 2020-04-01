import unittest
import pytest
from Project_Euler.ProjectEuler_Part3 import *


class TestProjectEulerP3(unittest.TestCase):

    # Problem 21
    def test_problem21_285(self):
        num = 285
        assert problem_21(num) == 504

    def test_problem21_10000(self):
        num = 100000
        assert problem_21(num) == 852810

    # Problem 25
    def test_problem25_binet(self):
        digit_len = 3
        assert problem_25(digit_len, how='binet') == 12

    def test_problem25_bruteForce(self):
        digit_len = 3
        assert problem_25(digit_len, how='brute') == 12

    def test_problem25_1000(self):
        digit_len = 1000
        assert problem_25(digit_len, how='binet') == 4782


if __name__ == '__main__':
    unittest.main()
