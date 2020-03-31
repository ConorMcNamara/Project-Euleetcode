class Solution:
    def searchInsert(self, nums: List[int], target: int) -> int:

        if target in nums:
            return nums.index(target)
        else:
            if all([target < val for val in nums]):
                return 0
            elif all(target > val for val in nums):
                return len(nums)
            else:
                return [val > target for val in nums].index(True)