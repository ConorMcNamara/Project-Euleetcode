class Solution(object):
    def firstMissingPositive(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        if not nums:
            return 1
        max_val = max(nums)
        if max_val < 1:
            return 1
        elif max_val == 1:
            return 2
        else:
            num_set = set([i for i in nums if i > 0])
            counter = 1
            while (counter < max_val):
                if counter not in num_set:
                    return counter
                counter += 1
            return max_val + 1