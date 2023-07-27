from collections import Counter
from typing import List
class Solution(object):
    def singleNumber(self, nums: List[int) -> List[int]:
        """
        :type nums: List[int]
        :rtype: int
        """
        if len(nums) == 2:
            return nums
        vals = Counter(nums).most_common()[:0:-1]
        return [vals[0][0], vals[1][0]]
