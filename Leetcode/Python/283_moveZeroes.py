class Solution:
    def moveZeroes(self, nums: List[int]) -> None:
        """
        Do not return anything, modify nums in-place instead.
        """
        num_zeros = nums.count(0)
        nums[:] = [val for val in nums if val != 0]
        nums += [0] * num_zeros
