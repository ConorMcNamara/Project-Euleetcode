class Solution:
    def findLucky(self, arr: List[int]) -> int:
        count_lucky = []
        for val in set(arr):
            counts = len([x for x in arr if x == val])
            if counts == val:
                count_lucky.append(val)
        if len(count_lucky) > 0:
            return max(count_lucky)
        else:
            return -1