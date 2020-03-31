class Solution:
    def letterCombinations(self, digits: str) -> List[str]:
        from itertools import product
        combination_types = {'1': [],
                             '2': ['a', 'b', 'c'],
                             '3': ['d', 'e', 'f'],
                             '4': ['g', 'h', 'i'],
                             '5': ['j', 'k', 'l'],
                             '6': ['m', 'n', 'o'],
                             '7': ['p', 'q', 'r', 's'],
                             '8': ['t', 'u', 'v'],
                             '9': ['w', 'x', 'y', 'z'],
                             '0': []}
        char_list, comb_list = [], []
        if len(digits) == 0:
            return []
        for char in digits:
            char_list.append(combination_types[char])
        letter_list = list(product(*char_list))
        for val in letter_list:
            str1 = ''
            for char in val:
                str1 += char
            comb_list.append(str1)
        return comb_list