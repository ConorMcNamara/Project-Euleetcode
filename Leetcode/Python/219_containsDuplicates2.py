class Solution:
    def containsNearbyDuplicate(self, nums: List[int], k: int) -> bool:
        import numpy as np
        nums = np.array(nums)
        for val in set(nums):
            dups = np.diff(np.where(nums == val)[0])
            if any(dups <= k):
                return True
        return False