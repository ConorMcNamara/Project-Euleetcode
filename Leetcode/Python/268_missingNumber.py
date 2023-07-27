from typing import List
class Solution(object):
    def missingNumber(self, nums: List[int]) -> int:
        """
        :type nums: List[int]
        :rtype: int
        """
        n=len(nums)
        return (n*(n+1))/2-sum(nums)

# Alternatively
class Solution(object):
    def missingNumber(self, nums: List[int]) -> int:
        """
        :type nums: List[int]
        :rtype: int
        """
        min_val = min(nums)
        max_val = max(nums)
        range_list = [i for i in range(min_val, max_val+1)]
        if 0 not in nums:
            return 0
        if sum(range_list) - sum(nums) == 0:
            return max_val + 1
        return sum([i for i in range(min_val, max_val+1)]) - sum(nums)
