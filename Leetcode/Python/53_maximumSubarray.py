class Solution:
    def maxSubArray(self, nums: List[int]) -> int:
        max_val = float('-inf')
        current_sum = 0
        for num in nums:
            current_sum = max(num, current_sum + num)
            max_val = max(max_val, current_sum)
        return max_val