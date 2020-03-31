class Solution(object):
    def searchRange(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: List[int]
        """
        if target not in nums:
            return [-1, -1]
        else:
            indices = [i for i, x in enumerate(nums) if x == target]
            return [min(indices), max(indices)]