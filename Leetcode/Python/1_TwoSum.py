class Solution(object):
    def twoSum(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: List[int]
        """
        for first_counter, a_val in enumerate(nums):
            b_val_target = target - a_val
            if b_val_target in nums and nums.index(b_val_target) != first_counter:
                return [first_counter, nums.index(b_val_target)]