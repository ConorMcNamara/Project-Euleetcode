class Solution:
    def isHappy(self, number: int) -> bool:
        start_num = number
        while True:
            str_nums = str(start_num)
            start_num = sum([pow(int(val), 2) for val in str_nums])
            if start_num == 1:
                return True
            elif start_num == number:
                return False
            elif start_num == 4:
                return False


## alternatively
class Solution:
    def isHappy(self, number: int) -> bool:
        seen_before = set()
        while number != 1:
            number = sum([pow(int(val), 2) for val in str(number)])
            if number in seen_before:
                return False
            else:
                seen_before.add(number)
        return True

