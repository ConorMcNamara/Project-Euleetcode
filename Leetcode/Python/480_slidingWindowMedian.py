class Solution:
    def medianSlidingWindow(self, nums: List[int], k: int) -> List[float]:
        def _median(l):
            length = len(l)
            sorted_l = sorted(l)
            if length % 2 == 1:
                return sorted_l[length // 2]
            else:
                return (sorted_l[length // 2 - 1] + sorted_l[length // 2]) / 2

        median_array = []
        for index in range(len(nums) - k + 1):
            median_array.append(_median(nums[index:index + k]))
        return median_array