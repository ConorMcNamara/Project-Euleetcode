import unittest
import pytest
from Project_Euler.ProjectEuler import *


class TestProjectEuler(unittest.TestCase):

    # Problem 1

    def test_problem1_10(self):
        n = 10
        assert problem_1(n) == 23

    def test_problem1_1000(self):
        n = 1000
        assert problem_1(n) == 233168

    def test_problem1_list(self):
        n = 1000
        assert problem_1(n, 'list') == 233168

    # Problem 2

    def test_problem2_100(self):
        max_val = 100
        assert problem_2(max_val) == 44

    def test_problem2_4000000(self):
        max_val = 4000000
        assert problem_2(max_val) == 4613732

    def test_problem2_generator(self):
        max_val = 4000000
        assert problem_2(max_val, 'generator') == 4613732

    # Problem 3

    def test_problem3_13195(self):
        n = 13195
        assert problem_3(n) == 29

    def test_problem3_600851475143(self):
        n = 600851475143
        assert problem_3(n) == 6857

    # Problem 4
    def test_problem4_2(self):
        n = 2
        assert problem_4(n) == 9009

    def test_problem4_3(self):
        n = 3
        assert problem_4(3) == 906609

    # Problem 5

    def test_problem5_10(self):
        n = 10
        assert problem_5(10) == 2520

    def test_problem5_20(self):
        n = 20
        assert problem_5(n) == 232792560

    # Problem 6

    def test_problem6_10(self):
        n = 10
        assert problem_6(n) == 2640

    def test_problem6_100(self):
        n = 100
        assert problem_6(n) == 25164150

    def test_problem6_list(self):
        n = 100
        assert problem_6(n, 'list') == 25164150

    # Problem 7
    def test_problem7_6(self):
        n = 6
        assert problem_7(6) == 13

    def test_problem_7_10000(self):
        n = 10001
        assert problem_7(n) == 104743


if __name__ == '__main__':
    unittest.main()