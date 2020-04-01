class Solution:
    def plusOne(self, digits: List[int]) -> List[int]:
        copy_digits = digits.copy()
        copy_digits[len(digits) - 1] += 1
        for i in range(len(digits) - 1, -1, -1):
                if copy_digits[i] == 10:
                    copy_digits[i] = 0
                    if i > 0:
                        copy_digits[i - 1] += 1
                    else:
                        copy_digits = [1] + copy_digits
        return copy_digits